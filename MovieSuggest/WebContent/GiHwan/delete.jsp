<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*, java.util.*, java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>게시판</title>
 <script language = "javascript">  // 자바 스크립트 시작
function deleteCheck(){
   var form = document.deleteform;
   if( !form.password.value )
   {
    alert( "비밀번호를 적어주세요" );
    form.password.focus();
    return;
   }
   form.submit();
  }
 </script>
 <style type="text/css">/* 스타일 시트 */
	body {
       font-size : 14px; 
	   font-family:"돋움";
	}
	/* ID = view_title (가로 100%, 세로 35px, 세로 높이지정 : 30px, 테두리 둥글게 5px, 테두리굵기 [ 2px 기본 선 색상지정 ] */
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
		Connection conn = DriverManager.getConnection(url,id,pass);	//DB연결
		Statement stmt = conn.createStatement();

		String sqlList = "SELECT * FROM write_db" ;	// DB내의 자료개수를 찾는 SQL문
		ResultSet rs = stmt.executeQuery(sqlList);		// DB실행
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
      <td>삭제</td>
   <table>
     <tr>
      <td>&nbsp;</td>
      <td>비밀번호</td>
      <td><input name="password" type="password" size="25" maxlength="20"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2">
      	<input type="submit" value="삭제" OnClick="javascript:deleteCheck();">
        <input type=button value="취소" OnClick="window.location='list.jsp'">
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