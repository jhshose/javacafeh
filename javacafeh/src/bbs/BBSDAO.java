package bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import common.DAO;
import bbs.BBSDAO;
 
public class BBSDAO extends DAO {
		
	// 단건조회
	public BBS selectOne(String i) {
		BBS bbs = null;
		try {
			// 1.드라이버 로딩 2.DB연결
			connect();
			// 3.SQL 구분 실행
			stmt = conn.createStatement();
			String sql = " select * from boards where bbsnum = " +i;  
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.next()) {
				bbs = new BBS();
				bbs.setBbsnum(rs.getString("BBSNUM"));
				bbs.setTitle(rs.getString("Title"));
				bbs.setContents(rs.getString("Contents"));
				bbs.setRef(rs.getString("Ref"));
				bbs.setRe_step(rs.getString("Re_step"));
				bbs.setReg_date(rs.getDate("Reg_Data"));
				bbs.setReadcount(rs.getString("ReadCount"));
				bbs.setPassword_yn(rs.getString("Password_yn"));
				bbs.setRef_lev(rs.getString("Ref_lev"));
				bbs.setUser_no(rs.getString("user_no"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 5 연결해제
			disconnect();
		}
		return bbs;
	}

	// 전체 조회
	public List<BBS> selectAll() {
		ArrayList<BBS> list = new ArrayList<BBS>();
		BBS bbs = null;
		try {
			// 1.드라이버 로딩 2.DB연결
			connect();
			// 3.SQL 구분 실행
			stmt = conn.createStatement(); 
			String sql = " select * from boards order by bbsnum ";
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				bbs = new BBS();
				bbs.setBbsnum(rs.getString("BBSNUM"));
				bbs.setTitle(rs.getString("Title"));
				bbs.setContents(rs.getString("Contents"));
				bbs.setRef(rs.getString("Ref"));
				bbs.setRe_step(rs.getString("Re_step"));
				bbs.setReg_date(rs.getDate("Reg_Date"));
				bbs.setReadcount(rs.getString("ReadCount"));
				bbs.setPassword_yn(rs.getString("Password_yn"));
				bbs.setRef_lev(rs.getString("Ref_lev"));
				bbs.setUser_no(rs.getString("user_no"));
				list.add(bbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 5 연결해제
			disconnect();
		}
		return list;
	}

	// 페이징 조회

	public List<BBS> selectPage(int start, int end) {
		ArrayList<BBS> list = new ArrayList<BBS>();
		BBS bbs = null;
		try {
			// 1.드라이버 로딩 2.DB연결
			connect();
			// 3.SQL 구분 실행
			stmt = conn.createStatement();
			String sql = "select * from (select rownum rn, a.* from ( "
					+ "select *  from boards order by bbsnum" + " ) a ) b  where rn between ? and ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				bbs.setBbsnum(rs.getString("BbsNum"));
				bbs.setTitle(rs.getString("Title"));
				bbs.setContents(rs.getString("Contents"));
				bbs.setRef(rs.getString("Ref"));
				bbs.setRe_step(rs.getString("Re_Step"));
				bbs.setReg_date(rs.getDate("Reg_Date"));
				bbs.setReadcount(rs.getString("ReadCount"));
				bbs.setPassword_yn(rs.getString("Password_yn"));
				bbs.setRef_lev(rs.getString("Ref_lev"));
				bbs.setUser_no(rs.getString("user_no"));
				list.add(bbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 5 연결해제
			disconnect();
		}
		return list;
	}
	
	//등록구현
	public boolean insert(BBS bbs) {
		
		try {
			connect();
			String sql = "insert into boards (bbsnum, title, contents, ref, user_no,reg_date,readcount)"				
					+ " values(BOARDS_SEQ.nextval, ?, ?, ?, ? ,sysdate,0)";
			
			String bbsnum = bbs.getBbsnum();				
			
			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, bbs.getBbsnum());				
			pstmt.setString(1, bbs.getTitle());
			pstmt.setString(2, bbs.getContents());	
			pstmt.setString(3, bbs.getRef());	
			pstmt.setString(4, bbs.getUser_no());		
			
			int r = pstmt.executeUpdate();
			System.out.println(r + "건이 업데이트 완료");

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}
		
	
	public boolean delete(String bbsnum) {
		// 삭제 구현
		try {
			connect();
			stmt = conn.createStatement();
			String sql = "delete from boareds where bbsnum = ";
			int r = stmt.executeUpdate(sql);
			System.out.println(r + "건이 삭제 완료");
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	// 수정 구현
	public boolean update(BBS bbs) {
		try {
			connect();
			String sql = "update boards " + "bbsnum = ?, " + "title = ?" +"contents = ?"
					+ "where bbsnum = ? ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bbs.getBbsnum());
			pstmt.setString(2, bbs.getTitle());
			pstmt.setString(3, bbs.getContents());			
			
	
			int r = pstmt.executeUpdate();
			System.out.println(r + "건이 업데이트 완료");

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	public static void main(String[] args) {
		BBSDAO bbsDAO = new BBSDAO();
		// 페이징 조회 테스트
		List<BBS> datas = bbsDAO.selectPage(1, 5);
		for (BBS temp : datas) {
			System.out.println(temp.getBbsnum() + " " + temp.getTitle() + " " + temp.getContents());
		}

		/*
		 * //전체조회 테스트 List<Employees> datas = empDAO.selectAll();
		 * System.out.println(datas); //이름만 모두 출력; for(Employees temp : datas) {
		 * System.out.println(temp.getFirst_name() + " " + temp.getLast_name()); }
		 * 
		 * Employees emp = empDAO.selectOne("100"); System.out.println(emp);
		 */
		// empDAO.delete(300);
		// empDAO.insert (new Employees("350", "째" , "완", "s1s1s134@nddr.com", null,
		// "ST_MAN"));

		/*
		 * emp = new Employees (); emp.setFirst_name("이이이"); emp.setLast_name("하이");
		 * emp.setEmployee_id("350"); empDAO.update(emp);
		 */

	} // end of main
} // end of class
