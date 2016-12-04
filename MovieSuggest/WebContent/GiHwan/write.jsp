<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글쓰기</title>

<style type="text/css">
	#list_title{
	width:100%; 
	height:35px;
	line-height:40px; 
	border-radius:7px; border:2px solid #009688;
	}
</style>
<script language = "javascript"> // 자바 스크립트 시작
function writeCheck(){
   var form = document.writeform;
   
   if( !form.title.value )   // form 에 있는 name 값이 없을 때
   {
    alert( "영화 제목을 적어주세요" ); // 경고창 띄움
    form.title.focus();     // form 에 있는 title 위치로 이동
    return;
   }
   
   if( !form.part.value )
   {
    alert( "장르를 적어주세요" );
    form.part.focus();
    return;
   }
   
  if( !form.memo.value )
  {
   alert( "내용을 적어주세요" );
   form.memo.focus();
   return;
  }
 
  form.submit();
}
 </script>
</head>
<body>

<% if(session.getAttribute("user_id")!=null){ %>

<%@ include file="/Eunji/header.jsp" %>
	<table align="center"> 
	  <form name=writeform method=post action="write_ok.jsp">	
      <tr>
        <td>
      <table width="100%" cellpadding="0" cellspacing="0" border="0">
       <tr align="center">
        <td><div id="list_title">글쓰기</div></td>
       </tr>
      </table>
      <table>
      <tr>&nbsp;</tr>
      <tr>
       <td>&nbsp;&nbsp;&nbsp;</td>
       <td align="center">평점 </td>
       <td><input type="radio" name="write_evaluate" value="1"/>1</td>
       <td><input type="radio" name="write_evaluate" value="2"/>2</td>
       <td><input type="radio" name="write_evaluate" value="3"/>3</td>
       <td><input type="radio" name="write_evaluate" value="4"/>4</td>
       <td><input type="radio" name="write_evaluate" value="5"/>5</td> 
    	</tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="10"></td></tr>
      </table>
   <table id="join">
     <tr id="join_col">
      <td>&nbsp;</td>
      <td align="center">영화제목</td>
      <td><input name="title" size="50" maxlength="100" placeholder="  ex) 럭키,닥터스트레인지" ></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="3"></td></tr>
     <tr>
       <td>&nbsp;</td>
       <td align="center">장르</td>
       <td> <% String a=request.getParameter("movietype");
       			out.print(a);%></td>
       <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="3"></td></tr>
     <tr>
       <td>&nbsp;</td>
       <td align="center"> 사용자 이름 </td>
       <td><font color="#757575" style="bold"> <% out.println(user_id); %></font></td>
       <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="3"></td></tr>
     
     <tr>
       <td>&nbsp;</td>
       <td align="center">내용</td>
       <td><textarea name="memo" cols="50" rows="13" placeholder=" ####이곳에 글을 입력해주세요####" ></textarea></td>
       <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="3"></td></tr>
     <tr height="1" bgcolor="#009688"><td colspan="3"></td></tr>
     <tr align="center">
       <td>&nbsp;</td>
       <td colspan="3">
         <input type="submit" value="등록" OnClick="javascript:writeCheck();"> 
         <input type=button value="취소" OnClick="location.href='list.jsp'">
         <input type=reset value="초기화">
       <td>&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
  </form>
 </table>
 
 <% } else {
	 	out.println("<script>alert('로그인을 해주세요.');history.go(-1);</script>");
 }
	 %>
</body>
</html>