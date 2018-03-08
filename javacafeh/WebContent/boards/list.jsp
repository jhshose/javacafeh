<%@page import="bbs.BBS"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
< %>	
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
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr height="5">
					<td width="5"></td>
				</tr>						
				
					 <tr>
					
					<th width="73">번호</th>				
					<th width="379">제목</th>
					<th width="73">작성자</th>
					<th width="164">작성일</th>
					<th width="58">조회수</th>
				
				</tr>
				
				
						
							
				<tr height="25" align="center">
				</tr>
				<tr height="1" bgcolor="#D2D2D2">
					<td colspan="6"></td>
				</tr>

				<tr height="1" bgcolor="#82B5DF">
					<td colspan="6" width="752"></td>
				</tr>				
								
								
				<c:forEach items="${datas}" var="b">
				
				<tr>					
					
					<td width="73">${b.bbsnum }</td>
					<td><a href="BBSServlet?action=selectOne&bbsnum=${b.bbsnum}">${b.title}</a></td>
					<td width="73">${b.user_no }</td>
					<td width="164">${b.reg_date}</td> 
					<td width="58">${b.readcount}</td>
					
				</tr>
				 </c:forEach>					
								
			 </table>
			 
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td colspan="4" height="5"></td>
				</tr>
				<tr align="center">
					<td><input type=button value="글쓰기"
						onclick="window.location='write.jsp'">			
				</tr>
			</table>  
			
		</article>

		<!-- footer page -->
		<footer><%@ include file="../common/footer.jsp"%></footer>

	</div>

</body>
</html>