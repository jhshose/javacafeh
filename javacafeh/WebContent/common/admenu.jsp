<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>java menu</title>
<link rel="stylesheet" href="../common/members.css" type="text/css"
	media="screen" />
</head>

<body>
	<ul>
		<!-- 손님화면메뉴 -->
		<c:if test="${empty sessionScope.userno}">
			<li>회원등급:손님</li>
		</c:if>
		<c:if test="${!empty sessionScope.userno}">
			<li>회원등급:${sessionScope.userno.grade}</li>
		</c:if>

		<c:if test="${empty sessionScope.userno}">
			<li><a href="../members/main.jsp">홈화면</a></li>
			<li><a href="../members/login.jsp">로그인</a></li>
			<li><a href="../members/userRegister.jsp">회원가입</a></li>
		</c:if>
		<!-- 일반회원메뉴 -->
		<c:if test="${!empty sessionScope.userno}">
			<li><a href="../members/memberControl.jsp?action=logout">로그아웃</a></li>
		</c:if>
		<!-- 관리자메뉴 -->
		<c:if test="${sessionScope.userno.grade=='R'}">
			<li><a href="../members/userSearch.jsp">회원조회</a></li>
			<li><a href="../members/userAll.jsp">회원전체리스트</a></li>
			<hr>
		</c:if>
		<hr>
		<li><a href="#">게시판</a></li>
		<!-- 호섭작업메뉴 -->
		<hr>
		<hr>
		<li>↓↓호섭작업메뉴↓↓</li>
		<li><a href="../goods/GoodsServlet?action=goodsList">상품list</a></li>
		<li><a href="../goods/GoodsServlet?action=goodsConfirm">주문확인</a></li>
		<li><a href="../goods/GoodsServlet?action=cartCheck">장바구니</a></li>
		<hr>
		<li><a href="../products/prodAll.jsp">관리자상품리스트</a></li>
	</ul>
</body>
</html>