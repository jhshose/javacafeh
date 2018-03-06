<%@page import="jdbc.GoodsDO"%>
<%@page import="jdbc.GoodsDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<title>goods_form.jsp(상품 화면구현)</title></head>

<body>
<form action="empReg.jsp">
	
	<tr>
		<td>상품번호<input type="text" name="prod_no" id="prod_no"/><br></td>
		<td>상품명<input type="text" name="prod_name" id="prod_name"/><br></td>
		<td>상품 상세내용<input type="file" name="prod_content" id="prod_content"/><br></td>
		<td>재고량<input type="text" name="onhand_qty" id="onhand_qty"/><br></td>
		<td>상품가격<input type="text" name="prod_price" id="prod_price"/><br></td>
		<td>할인가격<input type="text" name="prod_price" id="prod_price"/><br></td>
		<td>상품목록<select name="off_price" id="off_price"></select></td>
	</tr>
		
	

</form>

</body>
</html>