<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>goodsList.jsp(상품 목록 화면)</title>
<link rel="stylesheet" href="../common/members.css" type="text/css"	media="screen"/>
<link rel="stylesheet" type="text/css" media="all" href="css/styles.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="js/jquery-1.11.1.min.js"></script>

<style>
#menu {
  display: block;
  position: relative;
  z-index: 99;
  
}

#menu li {
  display: block;
  float: left;
  
}
#menu li a {
  display: block;
  position: relative;
  float: left;
  padding: 0 35px;
  font-size: 1.5em;
  line-height: 70px;
  font-weight: bold;
  text-decoration: none;
  color: #f5f5f5;
}
#menu li a:hover, #menu li a.active {
  background: #fff;
  color: #2c343b;
}

#menu li ul {
  display: none;
  position: absolute;
  top: 70px;
  width: 200px;
  background: #fff;
  z-index: -1;
  -webkit-box-shadow: 0 2px 7px rgba(0,0,0,0.45);
  -moz-box-shadow: 0 2px 7px rgba(0,0,0,0.45);
  box-shadow: 0 2px 7px rgba(0,0,0,0.45);
}
#menu li ul li {
  display: block;
  width: 200px;
}
#menu li ul li a {
  display: block;
  float: none;
  color: #4e5b67;
  font-size: 1.35em;
  line-height: 50px;
  padding: 0 15px;
}
#menu li ul li a:hover {
  background: #384958;
  color: #fff;
}

#menu li ul.expanded {
  width: 400px;
}
#menu li ul.expanded li { margin-right: 200px; }



#menu li ul li ul {
  display: none;
  position: absolute;
  left: 200px;
  top: 0;
  height: 100%;
  background: none;
  -webkit-box-shadow: none;
  -moz-box-shadow: none;
  box-shadow: none;
}
#menu li ul li ul li a { color: #fff; }
#menu li ul li ul li a:hover { text-decoration: underline; }

#menu li ul li.purple a:hover, #menu li ul li.purple a.active { background: #4f4c83; color: #fff; }
#menu li ul li.purple ul { background: #4f4c83; }

#menu li ul li.green a:hover, #menu li ul li.green a.active { background: #65834c; color: #fff; }
#menu li ul li.green ul { background: #65834c; }

#menu li ul li.aqua a:hover, #menu li ul li.aqua a.active { background: #4c7983; color: #fff; }
#menu li ul li.aqua ul { background: #4c7983; color: #fff; }

#menu li ul li.red a:hover, #menu li ul li.red a.active { background: #834c4c; color: #fff; }
#menu li ul li.red ul { background: #834c4c; }

#menu li ul li.blue a:hover, #menu li ul li.blue a.active { background: #4d6899; color: #fff; }
#menu li ul li.blue ul { background: #4d6899; }

#menu li ul li.gold a:hover, #menu li ul li.gold a.active { background: #97944c; color: #fff; }
#menu li ul li.gold ul { background: #97944c; }
</style>

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

<div style="background-color:green;">
<div class="wrapper">
	
	<ul id="menu" class="clearfix">
		<li h3 a href="../goods/GoodsServlet?action=goodsList">all</a></li> &nbsp;&nbsp;&nbsp;
		
		<li a href="../goods/GoodsServlet?action=goodsList&prod_category=BEANS">beans</a></li> &nbsp;&nbsp;&nbsp;
			<ul>
				<li><a href="#">브라질</a></li>
				<li><a href="#">에티오피아</a></li>
				<li><a href="#">이과체프</a></li>
			</ul>	
		<li a href="../goods/GoodsServlet?action=goodsList&prod_category=DUTCH">dutch</a></li> &nbsp;&nbsp;&nbsp;
			<ul>
				<li><a href="#">단품</a></li>
				<li><a href="#">세트</a></li>
			</ul>
		<li a href="../goods/GoodsServlet?action=goodsList&prod_category=BEVERAGE">beverage</a></li> &nbsp;&nbsp;&nbsp;
			<ul>
				<li><a href="#">사과식초</a></li>
				<li><a href="#">살구식초</a></li>
			</ul>
		<li a href="../goods/GoodsServlet?action=goodsList&prod_category=FOOD">food</a></li> &nbsp;&nbsp;&nbsp;
		<li a href="../goods/GoodsServlet?action=goodsList&prod_category=CUP">cup</a></li> &nbsp;&nbsp;&nbsp;
		
		


	</ul>
</div>	
</div>	

<script type="text/javascript">
	$(function(){
	  $('a[href="#"]').on('click', function(e){
	    e.preventDefault();
	  });
	  
	  $('#menu > li').on('mouseover', function(e){
	    $(this).find("ul:first").show();
	    $(this).find('> a').addClass('active');
	  }).on('mouseout', function(e){
	    $(this).find("ul:first").hide();
	    $(this).find('> a').removeClass('active');
	  });
	  
	  $('#menu li li').on('mouseover',function(e){
	    if($(this).has('ul').length) {
	      $(this).parent().addClass('expanded');
	    }
	    $('ul:first',this).parent().find('> a').addClass('active');
	    $('ul:first',this).show();
	  }).on('mouseout',function(e){
	    $(this).parent().removeClass('expanded');
	    $('ul:first',this).parent().find('> a').removeClass('active');
	    $('ul:first',this).hide();
	  });
	});
</script>

	
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