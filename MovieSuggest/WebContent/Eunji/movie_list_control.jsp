<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="moviesuggest.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="writebean" class="moviesuggest.WriteBean" />
<jsp:useBean id="write" class="moviesuggest.Write" />
<jsp:setProperty name="write" property="*" />

<% 
	String action = request.getParameter("action");

	if(action.equals("list")) {
		ArrayList<Write> datas = writebean.getDBList();
		request.setAttribute("datas", datas);
		pageContext.forward("movie_list.jsp");
	}
	
	else if(action.equals("written")) {
		ArrayList<Write> datas = writebean.getDBList();
		request.setAttribute("datas", datas);
		pageContext.forward("../Sungmin/mypage_written.jsp");
	}
	
%>