<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>java menu</title>
</head>
<body>
	<ul>
		<li><a href="../members/index.jsp">홈화면</a></li>
		<li><a href="../members/login.jsp">로그인</a></li>
		<li><a href="../members/userRegister.jsp">회원가입</a></li>
		<li><a href="../members/userSearch.jsp">회원조회</a></li>
		<li><a href="../members/userAll.jsp">회원전체리스트</a></li>
		<hr>
		<li><a href="../goods/GoodsServlet?action=selectAll">상품list</a></li>
		<li><a href="../goods/goods_form.jsp">상품조회</a></li>
		<li><a href="../products/prodRegister.jsp">상품등록</a></li>
		<hr>
		<li><a href="#">게시판</a></li>
		<hr>
	</ul>
</body>
</html>