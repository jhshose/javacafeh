package members;

import java.sql.CallableStatement;
import java.sql.ResultSet;

import common.DAO;

public class OrdersDAO extends DAO {

	public void selectAll(String p_order_no) {
		connect();
		try {
			String sql = "select * from oe_details where order_no = ? order by detail_no ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_order_no);
			
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			disconnect();
		}
	}

	public String createOrderHeader(String p_user_no, String[] p_cart_no) {
		connect();
		String orderHeaderNo = null;
		// 헤더정보 하나 생성하고 그 헤더번호를 받아와서 라인정보에서 넣어줄때 사용.
		CallableStatement cstmt = null;
		try {
			connect();
			conn.setAutoCommit(false); // 트랜잭션 처리
			cstmt = conn.prepareCall("{call order_header(?,?)}");
			cstmt.setString(1, p_user_no);
			cstmt.registerOutParameter(2, java.sql.Types.VARCHAR);
			cstmt.executeUpdate();
			conn.commit(); // 커밋
			orderHeaderNo = cstmt.getString(2);

			for (int i = 0; i < p_cart_no.length; i++) {
				// for cart에 들어있는 cart_no 를 찾아서 값을 가져와서 넣어준다.
				String carts = "select detail_no, user_no, prod_no, sales_price, order_qty from cart_details where user_no = ? and detail_no = ? ";
				pstmt = conn.prepareStatement(carts);
				pstmt.setString(1, p_user_no);
				pstmt.setString(2, p_cart_no[i]);
				ResultSet rs = pstmt.executeQuery();
				String detailNo = null;
				String prodNo = null;
				Integer salesPrice = null;
				Integer orderQty = null;
				if (rs.next()) {
					detailNo = rs.getString("detail_no");
					prodNo = rs.getString("prod_no");
					salesPrice = rs.getInt("sales_price");
					orderQty = rs.getInt("order_qty");
					// System.out.println(detailNo + " " + prodNo + salesPrice + " "+orderQty);
					String sql = "INSERT INTO oe_details (detail_no, order_no, prod_no, sale_price, order_qty, cart_detailno, flag)"
							+ " values(ORDERS_SEQ.Nextval ,?,?,?,?,?,'N')";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, orderHeaderNo);
					pstmt.setString(2, prodNo);
					pstmt.setInt(3, salesPrice);
					pstmt.setInt(4, orderQty);
					pstmt.setString(5, detailNo);
					int rtn = pstmt.executeUpdate();
					System.out.println(rtn + " order insert.");
				}
			}
			conn.commit();

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			disconnect();
		}
		return orderHeaderNo;

	}// end of createHeaderOrder()
}
