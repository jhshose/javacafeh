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
<h1>게시글 상세보기</h1>
<table>
	<tr>
		<th>작성자</th>
		<td>${bbs.user_no }</td>
	</tr>	
	<tr>
		<th>작성일</th>
		<td>
			<fmt:formatDate value = "${bbs.write }" partten="yyyy-MM-dd H:mm:ss" />
		</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td>${bbs.readcount }</td>		
	</tr>
	<tr>
		<th>제목</th>
		<td colspan="3">${bbs.title }</td>		
	</tr>
	<tr>
		<th>내용</th>
		<td colspan="3"><pre>${bbs.contents }</td>		
	</tr>	
</table>

<form method="post" action="BBSServlet">
<input type="submit" name ="action" value="삭제">
<input type="submit" name ="action" value="수정">
<input type="submit" name ="action" value="목록">
<input type="submit" name ="action" value="등록">


</article>
		<!-- footer page -->
		<footer><%@ include file="../common/footer.jsp"%></footer>

	</div>

</body>
</html>