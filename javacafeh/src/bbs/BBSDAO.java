package bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import common.DBManager;
import bbs.BBSDAO;

public class BBSDAO {
	
	 Connection conn;
	 Statement stmt;
	 PreparedStatement pstmt;
	 ResultSet rs;
		
	// 단건조회
	public BBS selectOne(int i) {
		BBS bbs = null;
		try {
			// 1.드라이버 로딩 2.DB연결
			conn = DBManager.getConnection();
			// 3.SQL 구분 실행
			stmt = conn.createStatement();
			String sql = " select * from boards where user_no = " +i;  
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
			DBManager.close(conn);
		}
		return bbs;
	}

	// 전체 조회
	public List<BBS> selectAll() {
		ArrayList<BBS> list = new ArrayList<BBS>();
		BBS bbs = null;
		try {
			// 1.드라이버 로딩 2.DB연결
			conn = DBManager.getConnection();
			// 3.SQL 구분 실행
			stmt = conn.createStatement(); 
			String sql = " select * from boards order by user_no ";
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
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
				list.add(bbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 5 연결해제
			DBManager.close(conn);
		}
		return list;
	}

	// 페이징 조회

	public List<BBS> selectPage(int start, int end) {
		ArrayList<BBS> list = new ArrayList<BBS>();
		BBS bbs = null;
		try {
			// 1.드라이버 로딩 2.DB연결
			conn = DBManager.getConnection();
			// 3.SQL 구분 실행
			stmt = conn.createStatement();
			String sql = "select * from (select rownum rn, a.* from ( "
					+ "select *  from boards order by user_no" + " ) a ) b  where rn between ? and ? ";
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
			DBManager.close(conn);
		}
		return list;
	}
	
	//등록구현
	public boolean insert(BBS bbs) {
		try {
			conn = DBManager.getConnection();
			String sql = "insert into boards (bbsnum, title, contents, ref, readcount, user_no)"
					+ "    values(?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bbs.getBbsnum());
			pstmt.setString(2, bbs.getTitle());
			pstmt.setString(3, bbs.getContents());	
			pstmt.setString(4, bbs.getRef());	
			pstmt.setString(5, bbs.getReadcount());
			pstmt.setString(6, bbs.getUser_no());
			int r = pstmt.executeUpdate();
			System.out.println(r + "건이 업데이트 완료");

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			DBManager.close(conn);
		}
		return true;
	}
		
	
	public boolean delete(String bbsnum) {
		// 삭제 구현
		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();
			String sql = "delete from boareds where bbsnum = " +bbsnum;
			int r = stmt.executeUpdate(sql);
			System.out.println(r + "건이 삭제 완료");
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			DBManager.close(conn);			
		}
		return true;
	}

	// 수정 구현
	public void update(BBS bbs) {
		try {
			conn = DBManager.getConnection();
			String sql = "update employees " + "user_no = ?, " + "title = ?" +"contents = ?"+ "where user_no = ? ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bbs.getUser_no());
			pstmt.setString(2, bbs.getTitle());
			pstmt.setString(3, bbs.getContents());

			int r = pstmt.executeUpdate();
			System.out.println(r + "건이 업데이트 완료");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn);
		}
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
