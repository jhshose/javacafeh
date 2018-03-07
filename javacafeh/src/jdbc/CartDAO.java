package jdbc;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import common.DAO;

public class CartDAO extends DAO {

	public ArrayList<CartsDO> selectAll(String p_cart_no) {
		connect();
		ArrayList<CartsDO> clist = new ArrayList<CartsDO>();
		CartsDO cdo = null;
		try {
			String sql = "select cart_no, detail_no, prod_no, sales_price, order_qty from cart_details where cart_no = ? order by prod_no";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_cart_no);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				cdo = new CartsDO();
				cdo.setCart_no(rs.getString("cart_no"));
				cdo.setDetail_no(rs.getString("detail_no"));
				cdo.setProd_no(rs.getString("prod_no"));
				cdo.setSales_price(rs.getInt("sales_price"));
				cdo.setOrder_qty(rs.getInt("order_qty"));
				clist.add(cdo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return clist;
	}// end of selectAll

	public HashMap<String, Object> insertProc(CartsDO bean) throws Exception {
		CallableStatement cstmt = null;
		int nextId = 0;
		try {
			connect();
			conn.setAutoCommit(false); // 트랜잭션 처리
			cstmt = conn.prepareCall("{call COMMENTS_INS(?,?,?,?,?)}");
			// cstmt.setString(1, bean.getName());
			// cstmt.setString(2, bean.getContent());
			cstmt.setString(3, "1");
			cstmt.registerOutParameter(4, java.sql.Types.NUMERIC);
			cstmt.registerOutParameter(5, java.sql.Types.VARCHAR);

			cstmt.executeUpdate();
			conn.commit(); // 커밋
			nextId = cstmt.getInt(4);
			String out_msg = cstmt.getString(5);
			System.out.println(out_msg);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", nextId);
			// map.put("name", bean.getName());
			// map.put(("content"), bean.getContent());
			return map;
		} catch (Throwable e) {
			try {
				conn.rollback(); // 롤백
			} catch (SQLException ex) {
			}
			throw new Exception(e.getMessage());
		}
	}// end of insertProc
}
