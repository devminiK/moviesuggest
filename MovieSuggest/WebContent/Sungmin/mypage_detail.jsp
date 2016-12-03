<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Detail</title>
</head>
<body>

<%@ include file="/Eunji/header.jsp" %>
<div align=center>
<H1>회원 정보</H1>
<HR>

<form action="mypage.jsp" method="post">
<table border=1 align=center width=500 height=400>
	<tr>
 		<th colspan="4">
  		<h3>User Information</h3></th>
	</tr>
	<tr>
 		<th class="var" colspon=1>Name</th>
 		<td colspon=3>-</td>
	</tr>
	<tr>
 		<th class="var">ID </th>
 		<td>-</td>
	</tr>
	</tr>
	<tr>
 		<th class="var">PASS </th>
 		<td>--------</td>
	</tr>
	<tr>
 		<th class="var">E-Mail</th>
 		<td>----------</td>
	</tr>
	<tr>
		 <th class="var">Tel</th>
		 <td>--------</td>
	</tr>
</table>
	<input type="submit" value="확인"/>
	<button type="button" onclick="location.href='../Eunji/index.jsp'">홈으로</button>
</form>
</div>
</body>
</html>