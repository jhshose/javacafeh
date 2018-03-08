<%@page import="bbs.BBS"%>
<%@page import="bbs.BBSDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>index page</title>
<link rel="stylesheet" href="../common/members.css" type="text/css"
	media="screen" />
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
 <div>bbsnum :</div>
    <div>${bbs.bbsnum}</div>
    <div>title :</div>
    <div>${bbs.title}</div>
    <div>contents :</div>
    <div>${bbs.contents}</div>
    <div>user :</div>
    <div>${bbs.user_no}</div>
    <div>date :</div>
    <div>${bbs.reg_date}</div>
    <div>
        <a href="<c:url value='BBSServlet?action=edit&bbsnum=${bbs.bbsnum}'/>">수정</a>
        <a href="<c:url value='BBSServlet?action=delete&bbsnum=${bbs.bbsnum}'/>">삭제</a>
        <a href="<c:url value='BBSServlet?action=list&bbsnum=${bbs.bbsnum}'/>">목록</a>
    </div>
            
</article>
		<!-- footer page -->
		<footer><%@ include file="../common/footer.jsp"%></footer>

	</div>

</body>
</html>