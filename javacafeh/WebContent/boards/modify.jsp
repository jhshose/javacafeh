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
 <form action="BBSServlet" method="post">
 <input type="hidden" name = "action"  value="modify">
 
        <div>번호: </div> 
        <div><input name="bbsnum" value="${bbs.bbsnum}" type="text" readonly="readonly"/></div>
        <!-- <div>비밀번호확인: </div>
        <div><input name="boardPw" id="boardPw" type="password"/></div> -->
        <div>제목  </div>
        <div><input name="title" value="${bbs.title}" id="Title" type="text"/></div>
        <div>내용  </div>
        <div><textarea name="contents" id="contents" rows="5" cols="50">${bbs.contents}</textarea></div>
        <div>
            <input type="submit" value="글수정"/>
            <input type="reset" value="초기화"/>
         </div>
         </form>   
</article>
		<!-- footer page -->
		<footer><%@ include file="../common/footer.jsp"%></footer>

	</div>

</body>
</html>