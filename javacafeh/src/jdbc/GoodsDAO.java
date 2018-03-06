package jdbc;

import java.sql.ResultSet;
import java.util.ArrayList;

import common.DAO;

public class GoodsDAO extends DAO {
	/*
	 * 1_prod_no 2_prod_name 3_prod_content 4_onhand_qty 5_prod_price 6_off_price
	 * 7_prod_category 8_useyn
	 */

	public String createProdNo(String category) {
		connect();
		String newpo = null;

		try {

			String sql = "select create_prod_no(?) as pno from dual";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			newpo = rs.getString("pno");

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			disconnect();
		}
		return newpo;

	}// end of createProdNo

	public boolean insertGood(GoodsDO gds) {

		GoodsDAO newg = new GoodsDAO();
		String newpno = newg.createProdNo(gds.getProd_category());
		System.out.println(newpno);

		connect();

		try {
			
			String sql = "insert into goods values(?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			// pstmt.setString(1, gds.getProd_no());
			pstmt.setString(1, newpno);
			pstmt.setString(2, gds.getProd_name());
			pstmt.setString(3, gds.getProd_content());
			pstmt.setInt(4, gds.getOnhand_qty());
			pstmt.setInt(5, gds.getProd_price());
			pstmt.setInt(6, gds.getOff_price());
			pstmt.setString(7, gds.getProd_category());
			pstmt.setString(8, gds.getUseyn());
			pstmt.setString(9, null);

			pstmt.executeUpdate();
			System.out.println("insertGood");
			return true;

		} catch (Exception e) {
			e.printStackTrace();
			return false;

		} finally {
			disconnect();

		}

	}// end of insertGood

	public ArrayList<GoodsDO> selectAll() {
		connect();
		ArrayList<GoodsDO> gdsdao = new ArrayList<GoodsDO>();
		GoodsDO gds = null;

		try {
			String sql = "select * from goods order by prod_no";
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				gds = new GoodsDO();

				gds.setProd_no(rs.getString("prod_no"));
				gds.setProd_name(rs.getString("prod_name"));
				gds.setProd_content(rs.getString("prod_content"));
				gds.setOnhand_qty(rs.getInt("onhand_qty"));
				gds.setProd_price(rs.getInt("prod_price"));
				gds.setOff_price(rs.getInt("off_price"));
				gds.setProd_category(rs.getString("prod_category"));
				gds.setUseyn(rs.getString("useyn"));

				gdsdao.add(gds);

			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			disconnect();
		}
		System.out.println("selectAll");

		return gdsdao;
	}

	public GoodsDO selectOne(String prod_no) {

		connect();
		GoodsDO gds = null;

		try {
			// 1.단계: 드라이버 로딩, 2.단계: DB연결
			// 3.단계 sql실행
			String sql = "select * from goods where prod_no = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prod_no);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				gds = new GoodsDO();

				gds.setProd_no(rs.getString("prod_no"));
				gds.setProd_name(rs.getString("prod_name"));
				gds.setProd_content(rs.getString("prod_content"));
				gds.setOnhand_qty(rs.getInt("onhand_qty"));
				gds.setProd_price(rs.getInt("prod_price"));
				gds.setOff_price(rs.getInt("off_price"));
				gds.setProd_category(rs.getString("prod_category"));
				gds.setUseyn(rs.getString("useyn"));
				System.out.println("selectone");
			}

		} catch (Exception e) {
			System.out.println("selectOne error");
			e.printStackTrace();

		} finally {
			disconnect();

		}
		return gds;
	}// end of selectOne

}
