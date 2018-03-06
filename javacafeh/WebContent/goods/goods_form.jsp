<%@page import="jdbc.GoodsDO"%>
<%@page import="jdbc.GoodsDAO"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head><title>goods_form.jsp(상품 목록)</title></head>

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
<form action="/prodAll.jsp">
	
	<table>
		<tr><td rowspan="7"><img src="../images/${goods.prod_image}" width="300" height="450"></td></tr>
		<tr><td>${goods.prod_name}</td></tr>
		<tr><td>${goods.prod_price}</td></tr>
		<tr><td>${goods.off_price}</td></tr>
		<tr><td>${goods.onhand_qty}</td></tr>
		<tr><td><button type="button">장바구니</button></td></tr>
		<tr><td><button type="button">구매하기</button></td></tr>
	</table>		
		
	

</form>

</article>

		<!-- footer page -->
		<footer><%@ include file="../common/footer.jsp"%></footer>

	</div>
</body>
</html>