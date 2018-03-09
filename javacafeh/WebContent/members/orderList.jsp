<%@page import="jdbc.MembersDO"%>
<%@page import="jdbc.CartsDO"%>
<%@page import="jdbc.CartDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jdbc.GoodsDO"%>
<%@page import="jdbc.GoodsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>cart list</title>
<link rel="stylesheet" href="../common/members.css" type="text/css"
	media="screen" />
</head>
<%
	//MembersDO abc = (MembersDO) session.getAttribute("userno");

	//CartDAO cdao = new CartDAO();
	//ArrayList<CartsDO> clist = cdao.selectAll(abc.getUser_no());
	//request.setAttribute("clist", clist);
%>
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
			<table border="1">
				<tr>
					<td colspan="4" align="center">
						<h3>주문정보</h3> <br>주문번호:ID3-2018-0001
					</td>
				</tr>
				<tr>
					<td>배송주소</td>
					<td colspan="3">대구 중구 예담동 501호</td>
				</tr>
				<tr>
					<td>배송요청정보</td>
					<td colspan="3"><textarea cols="100" rows="10">부재시 경비실에 부탁합니다.</textarea></td>
				</tr>
				<tr>
					<td colspan="4" align="center">
						<h3>주문상세</h3>
					</td>
				</tr>
				<tr>
					<td>상품이름</td>
					<td>상품단가</td>
					<td>상품수량</td>
					<td>합계금액</td>
				</tr>
				<tr>
					<td>상품이름1</td>
					<td align="right">1000</td>
					<td align="right">15</td>
					<td align="right">15000</td>
				</tr>
				<tr>
					<td align="center" colspan="4"><input type="submit" value="결재하기" /></td>
				</tr>
			</table>
		</article>

		<!-- footer page -->
		<footer><%@ include file="../common/footer.jsp"%></footer>

	</div>

</body>
</html>