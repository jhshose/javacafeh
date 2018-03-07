<%@page import="java.util.ArrayList"%>
<%@page import="zjdbc.GoodsDO"%>
<%@page import="zjdbc.GoodsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>index page</title>
<link rel="stylesheet" href="../common/members.css" type="text/css"
	media="screen" />
</head>
<%
	GoodsDO gds = new GoodsDO();
	GoodsDAO gdsdao = new GoodsDAO();
	ArrayList<GoodsDO> glist = gdsdao.selectAll();
	request.setAttribute("list", glist);
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
			<h3>상품담기</h3>
			<form action="memberControl.jsp" method="post">
				<input type="hidden" name="action" value="cart">
				<table border="1">
					<tr>
						<td colspan="2" align="center">상품담기</td>
					</tr>
					<tr>
						<td>상품</td>
						<td><select type="text" name="prod_no">
								<c:forEach items="${list}" var="i" varStatus="st">
									<option value="${i.prod_no}">${i.prod_name}</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td>수량</td>
						<td><input type="text" name="sales_price"></td>
					</tr>
					<tr>
						<td>금액</td>
						<td><input type="text" name="order_qty"></td>
					</tr>
				</table>
				<input type="submit" value="Submit">
			</form>
		</article>

		<!-- footer page -->
		<footer><%@ include file="../common/footer.jsp"%></footer>

	</div>

</body>
</html>