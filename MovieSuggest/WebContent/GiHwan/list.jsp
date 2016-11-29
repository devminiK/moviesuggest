<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <style type="text/css">/* 스타일 시트 */

	body {
       font-size : 13px; 
	   font-family:"돋움";
	}
	#sel_size {width:300px; height:15px;  padding-left:50%;}
	/* ID = write_title (가로 100%, 세로 35px, 세로 높이지정 : 30px, 테두리 둥글게 5px, 테두리굵기 [2px 기본 선 색상지정] */
	#write_title{width:100%; height:30px; margin-top:7px; padding-top:10px; border-radius:5px; border:2px solid #009688;}
</style>
 <title>게시판</title>
 </head>
 <body>
 <table align = "center">
 	<tr>
   	  <td>
   	  <select id="sel_size">
   	  	<option selected > 호  러 </option>
   	  	<option>  스릴러  </option>
   	  	<option>  로맨스  </option>
   	  	<option>  액 션  </option>
   	  </select>
   	  </td>
    </tr>
 </table>
<div id="write_title">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
   <tr height="5"><td width="5"></td></tr>
   <tr align="center"> 
   <td width="5"> </td>
   <td width="63">번호</td>
   <td width="360">제목</td>
   <td width="73">작성자</td>
   <td width="164">작성일</td>
   <td width="58">조회수</td>
   <td width="7"></td>
  </tr>
  <tr height="25" align="center"></tr>
  <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
  <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
 </table>
 </div>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr><td colspan="4" height="5"></td></tr>
  <tr align="right">
  <td><input type=button value="글쓰기" OnClick="window.location='write.jsp'"></td>
  </tr>
</table>
</body> 
</html>
