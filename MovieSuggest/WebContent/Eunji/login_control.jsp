<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="moviesuggest.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="loginbean" class="moviesuggest.JoinBean" />
<jsp:useBean id="login" class="moviesuggest.Join" />
<jsp:setProperty name="login" property="*" />

<% 
	String user_id = request.getParameter("user_id");
	String user_password = request.getParameter("user_password");
	String index = "index.jsp";
	
	if(loginbean.checkUser(user_id,user_password) != null){
		response.sendRedirect(index);
	}
	
	out.println(loginbean.checkUser(user_id, user_password));

%>