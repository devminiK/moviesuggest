<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, java.text.*" import="java.util.*"%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	request.setCharacterEncoding("euc-kr"); //받아오는 값들을 한글로 인코딩합니다.
	
	Class.forName("com.mysql.jdbc.Driver");
	
	String url = "jdbc:mysql://127.0.0.1:3306/moviesuggest";
	String id = "root";
	String pass = "root";

	String title = request.getParameter("title"); //write.jsp에서 name에 입력한 데이터값   , 영화제목
	String ganre = request.getParameter("ganre"); //write.jsp에서 title에 입력한 데이터값  , 영화장르
	String memo = request.getParameter("memo"); //write.jsp에서 memo에 입력한 데이터값 , 내용
	int evaluate = Integer.parseInt(request.getParameter("write_evaluate")); 	//평점을 받는다..
	String user = (String) session.getAttribute("user_id");	
	
	try {	
		conn = DriverManager.getConnection(url,id,pass);
		
		String sql = "INSERT INTO write_db(write_evaluate,write_title,write_user,write_ganre,write_reson) VALUES(?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, evaluate);
		pstmt.setString(2, title);
		pstmt.setString(3, user);
		pstmt.setString(4, ganre);
		pstmt.setString(5, memo);
		//stmt.setString(5, year);
		
		pstmt.executeUpdate();
		pstmt.close();
		
		conn.close();
} catch(SQLException e) {
	out.println( e.toString() );
} 
%>
<script language=javascript>
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href="list.jsp"; 
</script>
