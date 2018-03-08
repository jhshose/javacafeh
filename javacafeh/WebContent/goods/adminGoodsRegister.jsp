<%@page import="jdbc.CategoryDO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>Product Register</title>
<link rel="stylesheet" href="../common/members.css" type="text/css"
	media="screen" />

<script src="../ckeditor/ckeditor.js"></script>
<script>
	window.onload = function() {
		CKEDITOR.replace("prod_content", {
			filebrowserUploadUrl : '../ckeditor/fileUpload.jsp',
			customConfig : '../ckeditor/config.js'
		});
	}

	function return_check() {
		// document.getElementById("contents").value;
		var data = CKEDITOR.instances.contents.getData();
		//console(data);
		if (data == '') {
			alert("input editor..");
			return false;
		}
		return true;
	}
	
	function file_open(){
		window.open("upload.jsp", "upload", "width=300 height=200 left=300 top=30");
	}
</script>

</head>
<!--  다른 방식으로 받아오는것. 미리 다 넣어놓는것. -->
<jsp:useBean id="goods" class="jdbc.GoodsDO" />
<jsp:setProperty name="ctr" property="*" />
<jsp:useBean id="goodsdao" class="jdbc.GoodsDAO" />
<jsp:setProperty name="ctrdao" property="*" />

<body>
상품등록(관리자)
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
			<!--  start page -->
			<form name="frm1" action="prodControl.jsp" method="post">
				<input type="hidden" name="action" value="insert">
				<table border="1" width="700" cellpadding="2" cellspacing="1" bgcolor=#777777>
					<tr>
						<td height=20 align=center bgcolor=#999999><font color=white><B>상품등록</B></font></td>
					</tr>
					<!-- 입력 부분 -->
					<tr>
						<td bgcolor=white>&nbsp;
							<table border="1">
								<tr>
									<td width="130" align="center">상품번호</td>
									<td><input type="text" name="prod_no" value="${goods.prod_no }" /></td>
								</tr>
								<tr>
									<td align="center">상품명</td>
									<td ><input type="text" name="prod_name" value="${goods.prod_name }" /></td>
								</tr>
								<tr>
									<td align="center">상품설명</td>
									<td><textarea name="prod_content" cols=70 rows=15>${goods.prod_content }</textarea></td>
								</tr>
								<tr>
									<td align="center">상품재고량</td>
									<td><input type="text" name="onhand_qty" value="${goods.onhand_qty }" /></td>
								</tr>
								<tr>
									<td align="center">상품판매가</td>
									<td><input type="text" name="prod_price" value="${goods.prod_price }" /></td>
								</tr>
								<tr>
									<td align="center">상품할인가</td>
									<td><input type="text" name="off_price" value="${goods.off_price }" /></td>
								</tr>
								<tr>
									<td align="center">상품카테고리</td>
									<td><select name="prod_category" value="${goods.prod_category }">
										<c:forEach items="${goods}" var="gds">
											<option value="${gds.prod_category}"> ${gds.prod_category}</option>
										</c:forEach>
									</select></td>
								</tr>
								<tr>
									<td align="center">상품사용여부</td>
									<td><input type="text" name="useyn" value="Y" /></td>
								</tr>
								<tr align="center">
									<td colspan="2"><input type="submit" value="저장"></td>
								</tr>
							</table>
						</td>
					</tr>
					<!-- 입력 부분 끝 -->
				</table>
			</form>
			<!--  end   page -->
		</article>

		<!-- footer page -->
		<footer><%@ include file="../common/footer.jsp"%></footer>

	</div>

</body>
</html>
