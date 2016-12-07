<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<%@ include file = "/GiHwan/update.jsp" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	
	//String url = "jdbc:mysql://127.0.0.1:3306/moviesuggest";
	//String id = "root";
	//String pass = "root";
	
	String title = request.getParameter("title"); //update.jsp에서 name에 입력한 데이터값   , 영화제목
	int evaluate = Integer.parseInt(request.getParameter("evaluate"));
	String memo = request.getParameter("memo"); //update.jsp에서 memo에 입력한 데이터값 , 내용
	
	try {
		Connection conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();
		request.setCharacterEncoding("euc-kr"); //받아오는 값들을 한글로 인코딩합니다.
		String sql = "SELECT * FROM write_db WHERE write_num ="+idx;
		ResultSet rs = stmt.executeQuery(sql);
		
		conn = DriverManager.getConnection(url,id,pass);
		sql = "UPDATE write_db SET write_title='"+title+"',write_evaluate="+evaluate+" ,write_reson='"+memo+"' "+"WHERE write_num="+idx;
		stmt.executeUpdate(sql);
%>
	 <script language=javascript>
	 	self.window.alert("글이 수정되었습니다.");
	 	location.href="list.jsp";
	 </script>
<%
	rs.close();
	stmt.close();
	conn.close();
	} catch(SQLException e) {
	out.println( e.toString() );
} 
%>
<script language=javascript>
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href="list.jsp"; 
</script>
