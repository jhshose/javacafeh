<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>java menu</title>
<link rel="stylesheet" href="../common/members.css" type="text/css"
	media="screen" />
</head>

<body>
	<ul>
		<li><a href="../members/index.jsp">홈화면</a></li>
		<li><a href="../members/login.jsp">로그인</a></li>
		<li><a href="../members/userRegister.jsp">회원가입</a></li>
		<li><a href="../members/userSearch.jsp">회원조회</a></li>
		<li><a href="../members/userAll.jsp">회원전체리스트</a></li>
		<hr>
		<li><a href="../goods/GoodsServlet?action=goodsList">상품list</a></li>
		<li><a href="../goods/GoodsServlet?action=goodsConfirm">주문확인</a></li>
		<li><a href="../goods/GoodsServlet?action=cartCheck">장바구니</a></li>
		<hr>
		<li><a href="#">게시판</a></li>
		<hr>
	</ul>
		<li><a href="../products/prodAll.jsp">관리자상품리스트</a></li>
	<ul>
		
	</ul>
</body>
</html>