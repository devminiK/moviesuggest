<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="moviesuggest.*"%>
	
<jsp:useBean id="login" class="moviesuggest.JoinBean" scope="session" />
<jsp:setProperty name="login" property="*" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#login {
	display: block;
	position: absolute;
	right: 30px;
	top: 0;
}


a, a:hover, a:visited { 
	text-decoration:none;
	color : #000;
}

</style>
</head>
<body style="margin-top: 50px; height: 100px;">

	

	<%!%>
	<%
		String url2 = request.getServletPath();
		String result;
		String user_id = (String) session.getAttribute("user_id");
		String url3 = request.getContextPath();

		%>
		
		
		<h2 align="center">
		<% if(url3.equals("/Eunji")) { %>
		<a href="index.jsp" >
		<% } else {%>
		<a href="../Eunji/index.jsp" > <% } %>
			Movie Suggestion</a></h2>
		<div id="login">
		<%
		if (url2.equals("/Eunji/login.jsp")) {

		}
		
		else if(url2.equals("/Sungmin/mypage.jsp") || url2.equals("/Sungmin/mypage_detail.jsp")){
			%>
			
			<p>
			<%=user_id%>
			님 &nbsp <a href="../Eunji/join_control.jsp?action=delete&user_id=<%=user_id%>"> 탈퇴하기 </a>
		</p>
			
			<%
		}
		
		else {
	%>
	
	

		<%
			if (user_id != null) {
				if(url3.equals("/Eunji")){
		%>

		<p>
			<%=user_id%>
			님 &nbsp <a href="logout.jsp"> 로그아웃 </a>
		</p>

		<%
				}else {
		%>
		<p>
			<%=user_id%>
			님 &nbsp <a href="../Eunji/logout.jsp"> 로그아웃 </a>
		</p>
		<% 
				}}
				else {
					if(session != null) session.invalidate();
					if(url3.equals("/Eunji")){
				%>
		<p>
			<a href="login.jsp"> login </a> &nbsp <a href="join.jsp"> 회원가입 </a>
		</p>
		<%
				}
					else{
						%>
		<p>
			<a href="../Eunji/login.jsp"> login </a> &nbsp <a href="../Eunji/join.jsp"> 회원가입 </a>
		</p>
		<% 
					}
				}
	
			}
		%>

	</div>
	<hr>

</body>
</html>