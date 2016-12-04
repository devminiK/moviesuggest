<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="moviesuggest.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="joinbean" class="moviesuggest.JoinBean" />
<jsp:useBean id="join" class="moviesuggest.Join" />
<jsp:setProperty name="join" property="*" />

<% 
	// 컨트롤러 요청 파라미터
	String action = request.getParameter("action");

	// 파라미터에 따른 요청 처리
	// 주소록 목록 요청인 경우

	if(action.equals("main")) {
		ArrayList<Join> datas = joinbean.getDBList();
		request.setAttribute("datas", datas);
		pageContext.forward("index.jsp");
	}
	
	// 주소록 등록 요청인 경우
	else if(action.equals("insert")) {		
		if(joinbean.insertDB(join)) {
			response.sendRedirect("join_control.jsp?action=main");
		}
		else
			throw new Exception("DB 입력오류");
	}
	
	// 주소록 수정 페이지 요청인 경우
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
	// 주소록 수정 등록 요청인 경우
	else if(action.equals("update")) {
			if(joinbean.updateDB(join)) {
				response.sendRedirect("join_control.jsp?action=main");
			}
			else
				throw new Exception("DB 갱신오류");
	}
	// 주소록 삭제 요청인 경우
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
		
		session.setAttribute("id",user_id);
		
		if(joinbean.checkUser(user_id,user_password) != null){
			response.sendRedirect("join_control.jsp?action=main");			
		} 
	}
	else {
		out.println("<script>alert('action 파라미터를 확인해 주세요!!!')</script>");
	}
	
%>