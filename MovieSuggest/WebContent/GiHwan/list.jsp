<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.sql.*,java.text.*,java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
<link rel="stylesheet" type="text/css" href="style2.css" />
 <title>게시판</title>
 </head>
 <body>

 <%@ include file="/Eunji/header.jsp" %>

 <%
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://127.0.0.1:3306/moviesuggest";
	String id = "root";
	String pass = "root";
	int total = 0;				//총 게시물을 숫자로 확인하기 위한 변수

	try {
		Connection conn = DriverManager.getConnection(url,id,pass);	//DB연결
		Statement stmt = conn.createStatement();

		String sqlCount = "SELECT COUNT(*) FROM write_db order by write_num DESC";	// DB내의 자료개수를 찾는 SQL문
		ResultSet rs = stmt.executeQuery(sqlCount);		// DB실행

		if(rs.next()){	// rs.next()의 찾는결과가 있으면 true
			total = rs.getInt(1);   // SELECT문의 첫번째 필드 여기선 COUNT(*)
		}
		rs.close();
		out.print("총 게시물 : " + total + "개");

		String sqlList = "SELECT * from write_db";
		rs = stmt.executeQuery(sqlList);    // DB실행

%>
<form action = "write.jsp">
 <table align = "center">
 	<tr>
   	  <td>
   	  <select id="sel_size" name = "movietype">
   	  	<option selected> 호  러 </option>
   	  	<option >  스릴러  </option>
   	  	<option>  로맨스  </option>
   	  	<option>  액 션  </option>
   	  </select>
   	  </td>
    </tr>
 </table>
<div id="write_title">
<table width="100%" cellpadding="0" cellspacing="0" border="0" id="tables">
   <tr height="5"><td width="5"></td></tr>
   <tr align="center">
   <td width="5"> </td>
   <td width="40">번호</td>
   <td width="320">제목</td>
   <td width="73">작성자</td>
   <td width="164">작성일</td>
   <td width="60">조회수</td>
   <td width="7"></td> </tr>
</table>
<table width="100%" cellpadding="0" cellspacing="0" border="0" id= bodys>
<%
	Date d = new Date();				
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd"); 
	String day = (String)simpleDate.format(d);
	if(total==0) {		// total 즉, 자료가 없다면
%>
	 <tr align="center" bgcolor="#FFFFFF" height="30">
	 	 <td colspan="6">등록된 글이 없습니다.</td>
	 </tr>
<%
	 	} else {		 // total이 0이 아닌 즉 자료가 1개이상 있다면
		while(rs.next()) {
			int idx = rs.getInt(1) ;	     	// 1은 첫번째 즉 write_num값을 idx라는 변수에 대입
			String title = rs.getString(2);		// write_title
			String user = rs.getString(3);		// write_user
			int hit = rs.getInt(8);				// write_hit
			
%>
	<tr height="25" align="left">
		<td id="tdpadding" width="40"><%=idx %></td>
		<td width="320"> <a href="view.jsp?idx=<%=idx%>"/> <%= title %></td>
		<td width="73"><%= user %></td>
		<td width="164"><%= day %></td>
		<td width="60"><%=hit %></td>
	</tr>
	  <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
	  <%
			}
		}
		rs.close();			//rs객체 반환
		stmt.close();		// stmt객체 반환
		conn.close();		// conn객체 반환
	} catch(SQLException e) {
		out.println(e.toString());		//에러 날경우 에러출력
	}
	%>
 <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
  <tr>
  <td colspan=5 id=write_btn>
  <input type="submit" value="글쓰기" ></td>
  </tr>
 </table>
 </div><p>
</form>


</body>
</html>