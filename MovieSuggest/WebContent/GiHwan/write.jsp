<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글쓰기</title>
<style type="text/css">/* 스타일 시트 */

	body {
       font-size : 14px; 
	   font-family:"돋움";
	}
	/* ID = write_title (가로 100%, 세로 35px, 세로 높이지정 : 30px, 테두리 둥글게 5px, 테두리굵기 [ 2px 기본 선 색상지정 ] */
	#write_title{width:100%; height:35px; line-height:30px; border-radius:5px; border:2px solid #009688;}
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
   
  if( !form.name.value )
   {
    alert( "사용자의 이름을 적어주세요" );
    form.name.focus();
    return;
   }
 
  if( !form.password.value )
   {
    alert( "비밀번호를 적어주세요" );
    form.password.focus();
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
	<table>
	  <form name=writeform method=post action="write_ok.jsp">	
      <tr>
        <td>
      <table width="100%" cellpadding="0" cellspacing="0" border="0">
       <tr align="center">
        <td><div id="write_title">글쓰기</div></td>
       </tr>
      </table>
      <table>
      <tr>
       <td>&nbsp;</td>
       <td align="center">평점 </td>
       <td><input type="checkbox" name="score1" value="1"/>1</td>
       <td><input type="checkbox" name="score2" value="2"/>2</td>
       <td><input type="checkbox" name="score3" value="3"/>3</td>
       <td><input type="checkbox" name="score4" value="4"/>4</td>
       <td><input type="checkbox" name="score5" value="5"/>5</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan=""></td></tr>
      </table>
   <table>
     <tr>
      <td>&nbsp;</td>
      <td align="center">영화제목</td>
      <td><input name="title" size="50" maxlength="100"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="3"></td></tr>
     <tr>
       <td>&nbsp;</td>
       <td align="center">장르</td>
       <td><input name="ganre" size="50" maxlength="50"></td>
       <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="3"></td></tr>
     <tr>
       <td>&nbsp;</td>
       <td align="center">사용자 이름</td>
       <td><input name="name" size="50" maxlength="50"></td>
       <td>&nbsp;</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="3"></td></tr>
	 <tr>
       <td>&nbsp;</td>
       <td align="center">비밀번호</td>
       <td><input type="password" name="password" size="50" maxlength="8"></td>
       <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="3"></td></tr>
     <tr>
       <td>&nbsp;</td>
       <td align="center">내용</td>
       <td><textarea name="memo" cols="50" rows="13"></textarea></td>
       <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="3"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="3"></td></tr>
     <tr align="center">
       <td>&nbsp;</td>
       <td colspan="3">
         <input type=button value="등록" OnClick="javascript:writeCheck();"> 
         <input type=button value="취소" OnClick="javascript:history.back(-1)">
         <input type=reset value="초기화">
       <td>&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
  </form>
 </table>
</body>
</html>