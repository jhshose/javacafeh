<%@page import="jdbc.GoodsDO"%>
<%@page import="jdbc.GoodsDAO"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head><title>goodsForm.jsp(상품 상세화면)</title>

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
<form action="/prodAll.jsp">
	
	<table stlye=width:"500px" >
		<tr><td rowspan="8"><img src="../images/${goods.prod_image}" width="300" height="450"></td></tr>
		<tr><td>prod_name : ${goods.prod_name}</td></tr>
		<tr><td>prod_price : ${goods.prod_price}</td></tr>
		<tr><td>off_price : ${goods.off_price}</td></tr>
		<tr><td>onhand_qty : ${goods.onhand_qty}</td></tr>
		<tr><td id="shopProductQuantityDiv" class="row productQuantityDiv designSettingElement text-body ">
				<span class="text">qty</span>
				<input type="number" id="productQuantity" class="designSettingElement shape" value="1" min="1" data-initialQuantity="">
		</tr></td>
		
		<tr><td><a href="cartForm.jsp"><button type="button">cart</button></a></td></tr> <!-- 장바구니로 이동 -->
		<tr><td><button type="button">order</button></td></tr> <!-- 주문페이지로 이동 -->
	</table>		
	
	
		
	

</form>

</article>

		<!-- footer page -->
		<footer><%@ include file="../common/footer.jsp"%></footer>

	</div>
</body>
</html>