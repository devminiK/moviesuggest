<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="login" class="moviesuggest.LoginBean" scope="session"/> 
<jsp:setProperty name="login" property="*" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#login {
	display : block;
	position : absolute;
	right : 30px;
	top : 0;
}
</style>
</head>
<body style="margin-top : 50px; height : 100px;">

<h2 align="center"> Movie Suggestion </h2>
	
	
	<%
		String url2 = request.getServletPath();
		String result;

		if(url2.equals("/Eunji/login.jsp")){
			
			%>
			
			<div id="login">
			
			
			</div>
			
			<% 
			
			
		}
		else{
			/* if(login.checkUser(request.getParameter("user_id"))){
				result = login.getResult();
				
			} */
				
	
	%>
	
	<div id="login">
		<p><a href="login.jsp"> login </a></p>
	</div>
	<% } %>
	<hr>

</body>
</html>