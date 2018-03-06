<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head><title>goodsList.jsp</title></head>

<body>
<!--${datas}-->


<div style="background-color:lime;">
	<table>
	<tr> 
		<td>beans</td> 
		<td>dutch</td> 
		<td>beverage</td>
		<td>food</td>
		<td>cup</td>
	</tr>
	</table>
</div>	

	<table>
	<c:forEach items="${datas}" var="goods">
	
	
		<tr> 
		 	<td>${goods.prod_no} 
		 		<img src="../images/${goods.prod_image}" width="250" height="250"
		 		img onclick="javascript:location.href='goods_form.jsp';" style="cursor:pointer">
		 	</td> 
		 	
		 	<td>${goods.prod_name} </td> 
		 	<td>${goods.prod_content} </td>
		 	<td>${goods.onhand_qty} </td>
		 	<td>${goods.prod_price} </td>
		 	<td>${goods.prod_content} </td>
    	</tr>

    </c:forEach>	
    
</table>


</body>
</html>