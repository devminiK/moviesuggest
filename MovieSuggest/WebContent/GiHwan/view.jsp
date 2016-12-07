<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, java.util.*, java.text.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://127.0.0.1:3306/moviesuggest";
	String id = "root";
	String pass = "root";
	int idx = Integer.parseInt(request.getParameter("idx"));
	java.util.Date d = new java.util.Date();				
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd"); 
	String day = (String)simpleDate.format(d);
	int hit=0;
	String a = request.getParameter("movietype");
	
	try {
		Connection conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT * FROM write_db WHERE write_num=" + idx;
		out.println(idx);
		ResultSet rs = stmt.executeQuery(sql);
		String user = (String) session.getAttribute("user_id");
		if(rs.next()){
				int num = rs.getInt(1);
				String title = rs.getString(2);
				int evaluate = rs.getInt(5);
				String reson = rs.getString(6);
				++hit;
%>
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
	#view_title{width:100%; height:35px; line-height:40px; border-radius:7px; border:2px solid #009688;}
</style>
 </head>
 <body>
 <%@ include file="/Eunji/header.jsp" %>
 <form name=viewform method=post action="list.jsp">
<table align="center">
  <tr>
   <td> 
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
       <tr align="center">
        <td><div id="view_title">내   용</div></td>
       </tr>
      </table>
   <table width="413">
     <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">글 번 호</td>
      <td width="319"><%= num %></td>
      <td width="0">&nbsp;</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">평     점</td>
      <td width="319"><%= evaluate %></td>
      <td width="0">&nbsp;</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
   	 <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">장     르</td>
      <td width="319"><%= a%></td>
      <td width="0">&nbsp;</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">이     름</td>
      <td width="319"><%= user %></td>
      <td width="0">&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">작 성 일</td>
      <td width="319"><%= day %></td>
      <td width="0">&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">제     목</td>
      <td width="319"><%= title %></td>
      <td width="0">&nbsp; </td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
     <tr>
       <td width="0">&nbsp;</td>
       <td align="center">내용</td>
       <td width="399" colspan="2" height="200"><%=reson %></td>
      </tr>
 <%
 	sql="UPDATE write_db SET write_hit="+ hit+1 +"where write_num=?";
 	stmt.executeUpdate(sql);
 	rs.close();
 	stmt.close();
 	conn.close();
	} 
	}catch(SQLException e) {
}
%> 
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
     <tr height="1" bgcolor="#009688"><td colspan="4" width="407"></td></tr>
     <tr align="center">
      <td width="0">&nbsp;</td>
      <td colspan="2" width="399">
      <input type=button value="글쓰기" OnClick="window.location='write.jsp'">
	<input type=button value="목록보러가기" OnClick="window.location='list.jsp'">
	<input type=button value="수정하기" OnClick="window.location='update.jsp?idx=<%=idx%>'">
	<input type=button value="삭제하기" OnClick="window.location='delete.jsp?'">
      <td width="0">&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
 </form>
</body>
 </html>