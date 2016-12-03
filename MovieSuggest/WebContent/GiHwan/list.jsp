<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <style type="text/css">/* 스타일 시트 */

	body {
       font-size : 15px; 
	   font-family:"돋움";
	}
	#sel_size {width:300px; height:25px;  padding-left:50%;}
	/* ID = write_title (가로 100%, 세로 35px, 세로 높이지정 : 30px, 테두리 둥글게 5px, 테두리굵기 [2px 기본 선 색상지정] */
	#write_title{width:100%; height:30px; margin-top:7px; padding-top:10px; border-radius:5px; border:2px solid #009688;}
</style>


 <title>게시판</title>
 </head>
 <body>
 <%
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://127.0.0.1:3306/moviesuggest";
	String id = "root";
	String pass = "root";
	int total = 0;				//총 게시물을 숫자로 확인하기 위한 변수
	
	try {
		Connection conn = DriverManager.getConnection(url,id,pass);	//DB연결
		Statement stmt = conn.createStatement();	

		String sqlCount = "SELECT COUNT(*) FROM write_db";	// DB내의 자료개수를 찾는 SQL문
		ResultSet rs = stmt.executeQuery(sqlCount);		// DB실행
		
		if(rs.next()){	// rs.next()의 찾는결과가 있으면 true
			total = rs.getInt(1);   // SELECT문의 첫번째 필드 여기선 COUNT(*)
		}
		rs.close();
		out.print("총 게시물 : " + total + "개");
		
		String sqlList = "SELECT write_num, write_title from write_db order by write_num DESC";
		rs = stmt.executeQuery(sqlList);    // DB실행
		
%>
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
   <td width="40">번호</td>
   <td width="320">제목</td>
   <td width="73">작성자</td>
   <td width="164">작성일</td>
   <td width="60">조회수</td>
   <td width="7"></td> </tr>
  
<%
	if(total==0) {		// total 즉, 자료가 없다면 
%>
	<tr align="center" bgcolor="#FFFFFF" height="20">
	  <td colspan="6">등록된 글이 없습니다.</td>
	  </tr>
<%
	 	} else {		 // total이 0이 아닌 즉 자료가 1개이상 있다면
	 		
		while(rs.next()) {			
			int idx = rs.getInt(1);		// 1은 첫번째 즉 write_num값을 idx라는 변수에 대입
			String name = rs.getString(2);		// write_title
			String title = rs.getString(3);		// write_ganre
			String time = rs.getString(4);
			int hit = rs.getInt(5);
		
%>
  <tr height="25" align="center"></tr>
  <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
  <% 
		}
	} 
	rs.close();
	stmt.close();
	conn.close();
} catch(SQLException e) {
	out.println( e.toString() );
}
%>
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
