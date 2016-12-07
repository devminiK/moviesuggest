<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mypage</title>
</head>
<body>

<%@ include file="/Eunji/header.jsp" %>

<div align=center>
<h1>MY PAGE</h1>
<HR>

<br>
<br>
<br>
<Table border=0>
	<tr>
	<td><a href="../Eunji/join_control.jsp?action=list"><img src="../img/mypage_info.png" width="250" height="250" alt="" ></a></td>
	<td style="visibility:hidden"><img src="" width="100" height="250"/></td>
	<td><a href="../Eunji/movie_list_control.jsp?action=written"><img src="../img/mypage_written.png" width="250" height="250" alt="" ></a></td>
	</tr>
</Table>
</div>

</body>
</html>