<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="moviesuggest.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="joinbean" class="moviesuggest.JoinBean" />
<jsp:useBean id="join" class="moviesuggest.Join" />
<jsp:setProperty name="join" property="*" />

<% 
	String action = request.getParameter("action");

	if(action.equals("main")) {
		pageContext.forward("index.jsp");
	}
	
	else if(action.equals("insert")) {		
		if(joinbean.insertDB(join)) {
			response.sendRedirect("join_control.jsp?action=main");
		}
		else
			throw new Exception("DB 입력오류");
	}
	
	else if(action.equals("edit")) {
		Join join2 = joinbean.getDB(join);
		if(!request.getParameter("user_passwd").equals("root")) {
			out.println("<script>alert('비밀번호가 틀렸습니다.!!');history.go(-1);</script>");
		}
		else {
			request.setAttribute("joinbean",join2);
		//	pageContext.forward("addrbook_edit_form.jsp");
		}
	}
	
	else if(action.equals("update")) {
			if(joinbean.updateDB(join)) {
				String user_id = request.getParameter("user_id");
				session.setAttribute("user_id",user_id);
				
				response.sendRedirect("../Sungmin/mypage_detail.jsp");
			}
			else
				throw new Exception("DB 갱신오류");
	}
	
	else if(action.equals("delete")) {
		if(joinbean.deleteDB(join)) {
			response.sendRedirect("join_control.jsp?action=main");
		}
		else
			throw new Exception("DB 삭제 오류");
	}
	
	else if(action.equals("login")){
		String user_id = request.getParameter("user_id");
		String user_password = request.getParameter("user_password");
		String result = joinbean.checkUser(user_id,user_password);
		
		if(result != null){
			if(result != "password"){
				session.setAttribute("user_id",user_id);
				
				response.sendRedirect("join_control.jsp?action=main");
			}
			else out.println("<script>alert('비밀번호가 틀렸습니다.!!');history.go(-1);</script>");
		} 
	}
	
	else if(action.equals("list")) {
		ArrayList<Join> datas = joinbean.getDBList();
		request.setAttribute("datas", datas);
		pageContext.forward("../Sungmin/mypage_detail.jsp");
	}
	
	else {
		out.println("<script>alert('action 파라미터를 확인해 주세요!!!')</script>");
	}
	
%>