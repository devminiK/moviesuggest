<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내가 쓴글</title>
</head>
<body>

<%@ include file="/Eunji/header.jsp" %>

<div  align=center>
<H1>내가 쓴글</H1>
<HR>


<select name=type>
	<option selected>전체</option>
	<option>액션</option>
	<option>로맨스</option>
	<option>범죄 스릴러</option>
	<option>호러</option>
	<option>코메디</option>
</select>

<input type="submit" value="확인" /><br>
<button type="button" onclick="location.href='mypage.jsp'">이전페이지로</button>
</div>
</body>

</html>