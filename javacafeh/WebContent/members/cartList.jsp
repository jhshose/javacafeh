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
	MembersDO abc = (MembersDO) session.getAttribute("userno");

	CartDAO cdao = new CartDAO();
	ArrayList<CartsDO> clist = cdao.selectAll(abc.getUser_no());
	request.setAttribute("list", clist);
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
				<input type="hidden" name="action" value="cart">
				<table border="1">
					<tr>
						<td colspan="3" align="center">상품정보</td>
					</tr>
					<tr>
						<td align="center">상품번호</td>
						<td align="center">상품이름</td>
						<td align="center">합계금액</td>
					</tr>
					<c:forEach items="${list}" var="i" varStatus="st">
						<option value="${i.prod_no}">${i.prod_name}</option>
						<tr>
							<td>상품번호1</td>
							<td>상품이름 <br> 상품수량:10개 | 상품금액
							</td>
							<td>합계금액</td>
						</tr>
					</c:forEach>
					<tr>
						<td>상품번호2</td>
						<td>상품이름 <br> 상품수량:10개 | 상품금액
						</td>
						<td>합계금액</td>
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