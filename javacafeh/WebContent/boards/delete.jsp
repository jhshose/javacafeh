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
  
      <form method="post" action="BBSServlet">
	  <input type="hidden" name ="action" value="delete">	  
       <input name="bbsnum" value="${param.boardNo}" type="hidden"/>
        <div>비밀번호확인 :</div>
        <div><input name="boardPw" type="password"></div>
        <div>
            <input type="submit" value="삭제"/>
            <input type="reset" value="초기화"/>
        </div>
    </form>   
</article>

		<!-- footer page -->
		<footer><%@ include file="../common/footer.jsp"%></footer>

	</div>
</body>
</html>