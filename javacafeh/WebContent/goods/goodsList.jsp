<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>goodsList.jsp(상품 목록 화면)</title>
<link rel="stylesheet" href="../common/members.css" type="text/css"	media="screen" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
  $( function() {
    $( "#accordion" ).accordion();
  } );
  </script>
  
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

<div style="background-color:lime;" height:"25">
	
		<tr><td>
		<h3 a href="../goods/GoodsServlet?action=goodsList">all</a> &nbsp;&nbsp;&nbsp;
		<a href="../goods/GoodsServlet?action=goodsList&prod_category=BEANS">beans</a> &nbsp;&nbsp;&nbsp;
		<a href="../goods/GoodsServlet?action=goodsList&prod_category=DUTCH">dutch</a> &nbsp;&nbsp;&nbsp;
		<a href="../goods/GoodsServlet?action=goodsList&prod_category=BEVERAGE">beverage</a> &nbsp;&nbsp;&nbsp;
		<a href="../goods/GoodsServlet?action=goodsList&prod_category=FOOD">food</a> &nbsp;&nbsp;&nbsp;
		<a href="../goods/GoodsServlet?action=goodsList&prod_category=CUP">cup</a> &nbsp;&nbsp;&nbsp;
		</td></tr>
	
</div>	

	
	<c:forEach items="${datas}" var="goods">
	
	
		<div onclick="location.href='../goods/GoodsServlet?action=goodsForm&prod_no=${goods.prod_no}';" style="cursor:pointer"> 
		 	<span>${goods.prod_no} 
		 		<img src="../images/${goods.prod_image}" width="250" height="250">
		 	</span> 
		 	
		 	<span>${goods.prod_name} </span> 
		 	<span>${goods.prod_content} </span>
		 	<span>${goods.onhand_qty} </span>
		 	<span>${goods.prod_price} </span>
		 	<span>${goods.prod_content} </span>
    	</div>

    </c:forEach>	

</article>

		<!-- footer page -->
		<footer><%@ include file="../common/footer.jsp"%></footer>

	</div>

</body>