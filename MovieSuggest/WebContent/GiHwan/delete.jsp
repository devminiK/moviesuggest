<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
 	int idx = Integer.parseInt(request.getParameter("idx")); 
%>
<script language = "javascript">  // �ڹ� ��ũ��Ʈ ����
function deleteCheck(){
   var form = document.deleteform;
   if( !form.password.value ){
    alert( "��й�ȣ�� �����ּ���" );
    form.password.focus();
    return;
   }
 	form.submit();
  } 
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>�Խ���</title>
 <style type="text/css">/* ��Ÿ�� ��Ʈ */

	body {
       font-size : 14px; 
	   font-family:"����";
	}
	/* ID = view_title (���� 100%, ���� 35px, ���� �������� : 30px, �׵θ� �ձ۰� 5px, �׵θ����� [ 2px �⺻ �� �������� ] */
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
      <td><div id ="delete_title">����</td>
      <td width="5"></td>
     </tr>
    </table>
   <table>
     <tr>
      <td>&nbsp;</td>
      <td align="center">��й�ȣ</div></td>
      <td><input name="password" type="password" size="50" maxlength="100"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input type=button value="����" OnClick="javascript:deleteCheck();">
       <input type=button value="���" OnClick="javascript:history.back(-1)">
      <td>&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
</body> 
</html>