<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"
	import="java.sql.*, moviesuggest.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MovieSuggest</title>

<style type="text/css">

input {
	height : 23px;
}

</style>
</head>
<body>
<%-- 	<%@ include file="/Eunji/header.jsp"%> --%>



	<div align=center>
		<H1>회원 정보</H1>
		<HR>

		<%
			//ArrayList<String> user = new ArrayList<String>();
			String user_id2 = (String) session.getAttribute("user_id");
			boolean same = false;

			
			for (Join join : (ArrayList<Join>) datas) {
				out.println(join.getUser_id());
				String cmp_user = null;
				same = false;
				
				//user.add(join.getUser_id());
				cmp_user = join.getUser_id();
				//out.println(user_id2);
				//out.println(join.getUser_id());
				if(cmp_user.equals(user_id2)){
					same = true;
				} 
				
				if (same) {
		%>

		<form action="../Eunji/join_control.jsp?action=update" method="post" name="form2">
			<table border=1 align=center width=500 height=400>
				<tr>
					<th colspan="3">
						<h3>User Information</h3>
					</th>
				</tr>
				<tr>
					<th class="var" colspon=1>Name</th>
					<td><input value=<%=join.getUser_name()%> size="35" name="user_name" type="text" /></td>
				</tr>
				<tr>
					<th class="var">ID</th>
					<td><input value=<%=join.getUser_id() %> size="35" name="user_id" type="hidden" /><%=join.getUser_id() %></td>
				</tr>
				<tr>
					<th class="var">PASS</th>
					<td><input value=<%=join.getUser_password() %> size="35" name="user_password" type="password" /></td>
				</tr>
				<tr>
					<th class="var">E-Mail</th>
					<td><input value=<%=join.getUser_email() %> size="35" name="user_email" type="email" /></td>
				</tr>
				<tr>
					<th class="var">Tel</th>
					<td><input value=<%=join.getUser_tel() %> size="35" name="user_tel" type="tel" /></td>
				</tr>

			</table>
			<input type="submit" value="확인" />
			<button type="button" onclick="location.href='../Eunji/index.jsp'">홈으로</button>
		</form>
	</div>

	<%
		}
		}
	%>


</body>
</html>