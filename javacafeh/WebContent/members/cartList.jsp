<%@page import="jdbc.MembersDO"%>
<%@page import="jdbc.CartsDO"%>
<%@page import="jdbc.CartDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jdbc.GoodsDO"%>
<%@page import="jdbc.GoodsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>cart list</title>
<link rel="stylesheet" href="../common/members.css" type="text/css"
	media="screen" />
</head>
<%
	//MembersDO abc = (MembersDO) session.getAttribute("userno");

	//CartDAO cdao = new CartDAO();
	//ArrayList<CartsDO> clist = cdao.selectAll(abc.getUser_no());
	//request.setAttribute("clist", clist);
%>
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
			<h3>장바구니</h3>
			<form action="memberControl.jsp" method="post">
			<input type="hidden" name="action" value="cart2order">
				<table border="1">
					<tr>
						<td colspan="6" align="center">상품정보</td>
					</tr>
					<tr>
						<td align="center">선택</td>
						<td align="center">상품번호</td>
						<td align="center">상품이름</td>
						<td align="center">판매금액(원)</td>
						<td align="center">수량(개)</td>
						<td align="center">합계금액(원)</td>
					</tr>
					<c:forEach items="${clist}" var="i" varStatus="st">
						<tr>
							<td><input type="checkbox" name="detail_no" /></td>
							<td>${i.prod_no}</td>
							<td>${i.prod_name}</td>
							<td align="right">${i.sales_price}</td>
							<td align="right">${i.order_qty}</td>
							<td align="right">${i.order_qty * i.sales_price}</td>
						</tr>
					</c:forEach>
					</tr>
				</table>
				<input type="submit" value="주문하기">
			</form>
		</article>

		<!-- footer page -->
		<footer><%@ include file="../common/footer.jsp"%></footer>

	</div>

</body>
</html>