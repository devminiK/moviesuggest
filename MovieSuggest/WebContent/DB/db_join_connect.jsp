<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>

<html>
<body>

<%
//데이터베이스 연결관련 변수 선언
Connection conn = null;
PreparedStatement pstmt = null;


//데이터베이스 연결관련 정보를 문자열으로 선언 
String jdbc_driver = "com.mysql.jdbc.Driver";
String jdbc_url = "jdbc:mysql://127.0.0.1:3306/moviesuggest";
String user="root";
String password="root";


try{
	Class.forName(jdbc_driver);
	
	conn = DriverManager.getConnection(jdbc_url,user,password);
	
	String sql = "insert into join_db values(?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("user_name"));
	pstmt.setString(2, request.getParameter("user_id"));
	pstmt.setString(3, request.getParameter("user_password"));
	pstmt.setString(4, request.getParameter("user_email"));
	pstmt.setString(5, request.getParameter("user_tel"));
	
	if(request.getParameter("user_id") != null){
		pstmt.executeUpdate();
	}
}catch(Exception e){
	System.out.println(e);
}


%>
</body>
</html>