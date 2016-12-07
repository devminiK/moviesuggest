<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
request.setCharacterEncoding("euc-kr");
Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://127.0.0.1:3306/moviesuggest";
String id = "root";
String pass = "root";
String password = null;
String passw = request.getParameter("password");

try{
	Connection conn = DriverManager.getConnection(url,id,pass);
	Statement stmt = conn.createStatement();
	
	String sql = "SELECT join_db.user_password , write_db.write_num FROM join_db, write_db WHERE write_num";
	ResultSet rs = stmt.executeQuery(sql);
	int idx =0;
	 if(rs.next()){
			password = rs.getString("join_db.user_password");
			idx = Integer.parseInt(rs.getString("write_db.write_num"));
	 }
	 if(password.equals(passw)) {
		sql = "DELETE FROM write_db WHERE write_num=" + idx;	
		stmt.executeUpdate(sql);	 
%>  			<script language=javascript>
   				self.window.alert("해당 글을 삭제하였습니다.");
   				location.href="list.jsp";
  			</script>
<%
		rs.close();
		stmt.close();
		conn.close();
		 } else { 
%>
			<script language=javascript>
			 self.window.alert("비밀번호가 틀렸습니다");
				location.href="javascript:history.back()";
			</script>
<%		
		 }
 	} catch(SQLException e) {
		out.println( e.toString() );
	}
%>