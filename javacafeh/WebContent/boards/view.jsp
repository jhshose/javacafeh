<%@page import="bbs.BBS"%>
<%@page import="bbs.BBSDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>index page</title>
<link rel="stylesheet" href="../css/common.css" type="text/css"
	media="screen" />
<!-- <script type="text/javascript">
        function changeView(value)
        {
            if(value == 0)    location.href="BBSServlet?action=${bbs.bbsnum}&page=${page}";
            else if(value == 1){
                location.href='BBSServlet?action=${bbs.bbsnum}&page=${page}';
            }
                
        }
    </script> -->
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
 
 <div id="wrap">
    <br><br>
    <div id="board">
        <table id="detailBoard" width="800" border="3" bordercolor="lightgray">        
            <tr>
                <td id="title">작성일</td>
                <td>${bbs.reg_date}</td>
            </tr>
            <tr>
                <td id="title">작성자</td>
                <td>${bbs.user_no}</td>
            </tr>
            <tr>
                <td id="title">
                    제 목
                </td>
                <td>
                    ${bbs.title}
                </td>        
            </tr>
            <tr>
                <td id="title">
                    내 용
                </td>
                <td>
                    ${bbs.contents}
                </td>        
            </tr> 
      
        <a href="<c:url value='BBSServlet?action=edit&bbsnum=${bbs.bbsnum}'/>">수정</a>
        <a href="<c:url value='BBSServlet?action=delete&bbsnum=${bbs.bbsnum}'/>">삭제</a>
        <a href="<c:url value='reply.jsp?ref=${bbs.bbsnum}&re_step=${bbs.re_step}&ref_lev=${bbs.ref_lev}'/>">답글</a>
        <a href="<c:url value='BBSServlet?action=list&bbsnum=${bbs.bbsnum}'/>">목록</a>
        
    </div>
      </table>
      </div>
      </div>  
            
</article>
		<!-- footer page -->
		<footer><%@ include file="../common/footer.jsp"%></footer>

	</div>

</body>
</html>