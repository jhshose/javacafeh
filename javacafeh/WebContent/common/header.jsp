<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>java header</title>
</head>
<body>
	<h1>자바카페</h1>
	<div align="right" color="blue">자바의 향기를 느끼다.</div>
	<div align="left">
		<c:if test="${empty sessionScope.userno}">
			<a href="login.jsp">로그인</a>|
			<!-- comment for line-->
			<a href="userRegister.jsp">회원가입</a>|
		</c:if>
		<c:if test="${not empty sessionScope.userno}">
			<a href="login.jsp">로그아웃</a>|
		</c:if>
		<!-- comment for line-->
		<a href="logout.jsp">상품화면</a>|
		<!-- comment for line-->
		<a href="home.jsp">홈화면</a>
	</div>
	${userno}
</body>
</html>