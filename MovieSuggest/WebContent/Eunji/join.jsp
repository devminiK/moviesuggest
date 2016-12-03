<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% request.setCharacterEncoding("utf-8"); %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Moviesuggest</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>

<%@ include file="header.html" %>
<div align="center">
<h3> 회원가입 </h3>

<div>
<form action="join_control.jsp" name="join" method="post">
<input type=hidden name="action" value="insert">

<table id="join_table">
	<tr>
		<td id="join_col"> 이름 </td>
		<td><input type="text" name="user_name" placeholder="이름" size="45"/></td>
	</tr>
	<tr>
		<td id="join_col"> 아이디 </td>
		<td><input type="text" name="user_id" placeholder="아이디" size="45"/></td>
	</tr>
	<tr>
		<td id="join_col"> 비밀번호 </td>
		<td><input type="password" name="user_password" placeholder="비밀번호" size="45" /></td>
	</tr>
	<tr>
		<td id="join_col"> 이메일 </td>
		<td><input type="email" name="user_email" placeholder="aaa@naver.com" size="45" /></td>
	</tr>
	<tr style="border-bottom:1px solid #000">
		<td id="join_col"> 전화번호 </td>
		<td><input type="tel" name="user_tel" placeholder="031-000-0000" size="45" /></td>
	</tr>
</table>

	<button type="submit"> 완료 </button>
	<button type="reset" style="background:#fdfdfd"> 취소 </button>
	
</form>

</div>
</div>

</body>
</html>