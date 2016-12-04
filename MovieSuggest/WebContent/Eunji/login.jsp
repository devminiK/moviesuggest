<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MovieSuggest</title>

<style type="text/css">
	@import url(style.css);
	
	td {
		padding : 5px 8px;
		width : 100px;
	}

	a {
		text-decoration : underline;
	}
</style></head>
<body>

<%@ include file="header.jsp" %>

<div align="center">

<h3> 로그인 </h3>

<form method="post" action="join_control.jsp" name="login_form">
<input type=hidden name="action" value="login">
	<table>
		<tr>
			<td id="login_col"> 아이디 </td>
			<td><input type="text" size=30 name="user_id" /></td>
		</tr>
		<tr>
			<td id="login_col"> 패스워드 </td>
			<td><input type="password" size=30 name="user_password" /></td>
		</tr>
	</table>
	<button type="submit"> 로그인 </button>
	<button type="reset" style="background:#fdfdfd"> 취소 </button>
	
	<div style="padding-top : 20px;">
	<a href="join.jsp"> 회원가입 </a>
	</div>
</form>
</div>

</body>
</html>