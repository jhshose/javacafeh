<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>java menu</title>
</head>
<body>
	<ul>
		<c:if test="${empty sessionScope.userno.grade}">
			<li>회원등급: 손님</li>
		</c:if>
		<c:if test="${!empty sessionScope.userno.grade}">
			<li>회원등급: ${sessionScope.userno.grade}</li>
		</c:if>
		<li><a href="../members/main.jsp">홈화면</a></li>
		<c:if test="${empty sessionScope.userno}">
			<li><a href="../members/login.jsp">로그인</a></li>
			<li><a href="../members/userRegister.jsp">회원가입</a></li>
		</c:if>
		<c:if test="${!empty sessionScope.userno}">
			<li><a href="../members/memberControl.jsp?action=logout">로그아웃</a></li>
		</c:if>
		<c:if test="${sessionScope.userno.grade=='R'}">
			<li><a href="../members/memberControl.jsp?action=find">회원조회</a></li>
			<li><a href="../members/memberControl.jsp?action=select">회원전체리스트</a></li>
			<hr>
			<li><a href="../members/memberControl.jsp?action=find">장바구니test</a></li>
			<li><a href="../members/memberControl.jsp?action=find">주문정호test</a></li>
			<hr>
			<li><a href="../goods/GoodsServlet?action=selectAll">상품list</a></li>
			<li><a href="../goods/goods_form.jsp">상품조회</a></li>
			<li><a href="../products/prodRegister.jsp">상품등록</a></li>
		</c:if>
		<hr>
		<li><a href="#">게시판</a></li>
		<hr>
	</ul>
</body>
</html>