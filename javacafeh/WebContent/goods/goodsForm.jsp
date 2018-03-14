<%@page import="jdbc.GoodsDO"%>
<%@page import="jdbc.GoodsDAO"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>goodsForm.jsp(상품 상세화면)</title>
<link rel="stylesheet" href="../common/members.css" type="text/css"
	media="screen" />
</head>
<body>
	<div class="container">
		<!-- header page -->
		<header>
			<%@ include file="../common/header.jsp"%>
		</header>
		<!-- menu page -->
		<nav>
			<%@ include file="../common/menu.jsp"%>
		</nav>
		<!-- article page -->
		<article>
			<div align="center">
				<h3>goodsForm</h3>
				<form action="../members/memberControl.jsp" method="post">
					<input type="hidden" name="action" value="cart"> <input
						type="hidden" name="user_no" value="${userno.user_no}"> <input
						type="hidden" name="prod_no" value="${goods.prod_no}" />
					<table width="500px">
						<tr>
							<td rowspan="8"><img src="../images/${goods.prod_image}"
								width="300" height="450"></td>
						</tr>
						<tr>
							<td>상품명 : ${goods.prod_name}</td>
						</tr>
						<tr>
							<td>판매가 : <input width="50" type="text" readonly="readonly"
								name="sales_price" value="${goods.prod_price}" /></td>
						</tr>
						<tr>
							<td>할인금액 : ${goods.off_price}</td>
						</tr>
						<tr>
							<td>재고량 : ${goods.onhand_qty}</td>
						</tr>
						<tr>
							<td id="shopProductQuantityDiv"
								class="row productQuantityDiv designSettingElement text-body ">
								<span class="text">선택수량</span> <input type="number"
								name="order_qty" id="productQuantity"
								class="designSettingElement shape" value="1" min="1"
								data-initialQuantity="">
							</td>
						</tr>
						<tr>
							<td><input type="submit" value="장바구니담기" /></td>
						</tr>
						<!-- 장바구니로 이동 -->
						<tr>
							<td><button type="button">주문하기</button></td>
						</tr>
						<!-- 주문페이지로 이동 -->
					</table>
				</form>
			</div>
		</article>

		<!-- footer page -->
		<footer><%@ include file="../common/footer.jsp"%></footer>

	</div>
</body>
</html>