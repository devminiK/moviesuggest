<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>게시판</title>
 </head>
 <body>
 <table width="30%" align = "center">
 	<tr width="30">
   	  <td>
   	  <select align = "center">
   	  	<option selected>호러</option>
   	  	<option>스릴러</option>
   	  	<option>로맨스</option>
   	  	<option>액션</option>
   	  </select>
   	  </td>
    </tr>
 </table>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	
  <tr height="5"><td width="5"></td></tr>
  <tr style="background:url('./img/table_mid.gif') repeat-x; text-align:center;">
   <td width="5"><img src="./img/table_left.gif" width="5" height="30" /></td>
   <td width="63">번호</td>
   <td width="360">제목</td>
   <td width="73">작성자</td>
   <td width="164">작성일</td>
   <td width="58">조회수</td>
   <td width="7"><img src="./img/table_right.gif" width="5" height="30" /></td>
  </tr>
  <tr height="25" align="center"></tr>
  <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
  <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
 </table>
 
<table width="80%" cellpadding="0" cellspacing="0" border="0">
  <tr><td colspan="4" height="5"></td></tr>
  <tr align="right">
  <td><input type=button value="글쓰기" OnClick="window.location='write.jsp'"></td>
  </tr>
</table>
</body> 
</html>
