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
<script src="//code.jquery.com/jquery.min.js"></script>
<script>
$(function(){
	$(document).mouseup(function(e) {
		if ($(e.target).parents('.zeta-menu').length == 0) {
			$('.zeta-menu li').removeClass('expand');
			$('.zeta-menu ul').hide();
		}
	});
	$(".zeta-menu>li:has(ul)>a").each( function() {
		$(this).html( $(this).html()+' &or;' );
	});
	$(".zeta-menu ul li:has(ul)")
		.find("a:first")
		.append("<p style='float:right;margin:-3px'>&#9656;</p>");

	$(".zeta-menu li>a").click(function(){
		var li = $(this).parent();
		var ul = li.parent()
		ul.find('li').removeClass('expand');
		ul.find('ul').not(li.find('ul')).hide();
		li.children('ul').toggle();
		if( li.children('ul').is(':visible') || li.has('ul')) {
			li.addClass('expand');
		}
	});
});
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

<div style="background-color:lime;">
<div class='zeta-menu-bar'>
	
	<ul class="zeta-menu">
		<li h3 a href="../goods/GoodsServlet?action=goodsList">all</a> &nbsp;&nbsp;&nbsp;
		
		<li a href="../goods/GoodsServlet?action=goodsList&prod_category=BEANS">beans</a> &nbsp;&nbsp;&nbsp;
			<ul>
				<li><a href="#">brazil</a></li>
				<li><a href="#">brazil</a></li>
				<li><a href="#">brazil</a></li>
			</ul>	
		<li a href="../goods/GoodsServlet?action=goodsList&prod_category=DUTCH">dutch</a> &nbsp;&nbsp;&nbsp;
			<ul>
				<li><a href="#">just 1</a></li>
				<li><a href="#">3 set</a></li>
			</ul>
		<li a href="../goods/GoodsServlet?action=goodsList&prod_category=BEVERAGE">beverage</a> &nbsp;&nbsp;&nbsp;
			<ul>
				<li><a href="#">apple</a></li>
				<a href="#">bbb</a></li>
			</ul>
		<li a href="../goods/GoodsServlet?action=goodsList&prod_category=FOOD">food</a> &nbsp;&nbsp;&nbsp;
		<li a href="../goods/GoodsServlet?action=goodsList&prod_category=CUP">cup</a> &nbsp;&nbsp;&nbsp;
		
</div>	
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