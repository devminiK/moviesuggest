<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*, java.util.*, java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>�Խ���</title>
 <script language = "javascript">  // �ڹ� ��ũ��Ʈ ����
function deleteCheck(){
   var form = document.deleteform;
   if( !form.password.value )
   {
    alert( "��й�ȣ�� �����ּ���" );
    form.password.focus();
    return;
   }
   form.submit();
  }
 </script>
 <style type="text/css">/* ��Ÿ�� ��Ʈ */
	body {
       font-size : 14px; 
	   font-family:"����";
	}
	/* ID = view_title (���� 100%, ���� 35px, ���� �������� : 30px, �׵θ� �ձ۰� 5px, �׵θ����� [ 2px �⺻ �� �������� ] */
	#delete_title{width:75%; height:35px; line-height:40px; border-radius:7px; border:2px solid #009688;}
</style>
 </head>
 <body>
 <div id ="delete_title">
<table align = "center">
 <%
    Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://127.0.0.1:3306/moviesuggest";
	String id = "root";
	String pass = "root";
	
	try {
		Connection conn = DriverManager.getConnection(url,id,pass);	//DB����
		Statement stmt = conn.createStatement();

		String sqlList = "SELECT * FROM write_db" ;	// DB���� �ڷᰳ���� ã�� SQL��
		ResultSet rs = stmt.executeQuery(sqlList);		// DB����
	 	while(rs.next()){
			int idx = rs.getInt(1);
	
 %>
 <form name=deleteform method=post action="delete_ok.jsp?idx=<%=idx%>">
<%
	 	}
	 	rs.close();
		stmt.close();
	}catch(SQLException e){
		out.println(e.toString());
	}
%>
  <tr>
   <td>
      <td>����</td>
   <table>
     <tr>
      <td>&nbsp;</td>
      <td>��й�ȣ</td>
      <td><input name="password" type="password" size="25" maxlength="20"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2">
      	<input type="submit" value="����" OnClick="javascript:deleteCheck();">
        <input type=button value="���" OnClick="window.location='list.jsp'">
      <td>&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
 </div>
 </form>
</body> 
</html>