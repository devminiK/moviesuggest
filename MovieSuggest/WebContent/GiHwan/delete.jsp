<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
 	int idx = Integer.parseInt(request.getParameter("idx")); 
%>
<script language = "javascript">  // 자바 스크립트 시작
function deleteCheck(){
   var form = document.deleteform;
   if( !form.password.value ){
    alert( "비밀번호를 적어주세요" );
    form.password.focus();
    return;
   }
 	form.submit();
  } 
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>게시판</title>
 <style type="text/css">/* 스타일 시트 */

	body {
       font-size : 14px; 
	   font-family:"돋움";
	}
	/* ID = view_title (가로 100%, 세로 35px, 세로 높이지정 : 30px, 테두리 둥글게 5px, 테두리굵기 [ 2px 기본 선 색상지정 ] */
	#delete_title{width:100%; height:35px; line-height:40px; border-radius:7px; border:2px solid #009688;}
</style>
 </head>
 <body>
<table>
	<form name=deleteform method=post action="delete_ok.jsp?idx=<%=idx%>">
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr>
      <td width="5"></td>
      <td><div id ="delete_title">삭제</td>
      <td width="5"></td>
     </tr>
    </table>
   <table>
     <tr>
      <td>&nbsp;</td>
      <td align="center">비밀번호</div></td>
      <td><input name="password" type="password" size="50" maxlength="100"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input type=button value="삭제" OnClick="javascript:deleteCheck();">
       <input type=button value="취소" OnClick="javascript:history.back(-1)">
      <td>&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
</body> 
</html>