<%@page import="bbs.BBS"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>index page</title>
<link rel="stylesheet" href="../common/members.css" type="text/css"
	media="screen" />
</head>

<jsp:useBean id="datas" class="bbs.BBSDAO" />
<jsp:useBean id="data" class="bbs.BBS" />
<jsp:setProperty name="data" property="*" />

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
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr height="5">
					<td width="5"></td>
				</tr>
				<tr>
					<td width="5"></td>
					<td width="73">번호</td>
					<td width="379">제목</td>
					<td width="73">작성자</td>
					<td width="164">작성일</td>
					<td width="58">조회수</td>
					<td width="7"></td>
				</tr>
				<tr height="25" align="center">
				</tr>
				<tr height="1" bgcolor="#D2D2D2">
					<td colspan="6"></td>
				</tr>

				<tr height="1" bgcolor="#82B5DF">
					<td colspan="6" width="752"></td>
				</tr>
				<%
					for (BBS b : datas.selectAll()) {
				%>
				<tr>
					<td width="5"></td>
					<td width="73"><%=b.getBbsnum()%></td>
					<td width="379"><%=b.getTitle()%></td>
					<td width="73">작성자</td>
					</td>

				</tr>
				<%
					}
				%>
			</table>

			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td colspan="4" height="5"></td>
				</tr>
				<tr align="center">
					<td><input type=button value="글쓰기"
						onclick="window.location='write.jsp'">
						<input type=button value="답글">
						<input type=button value="목록"
						OnClick="window.location='list.jsp'">
						<input type=button
						value="수정"> <input type=button value="삭제"></td>
				</tr>
			</table>
		</article>

		<!-- footer page -->
		<footer><%@ include file="../common/footer.jsp"%></footer>

	</div>

</body>
</html>