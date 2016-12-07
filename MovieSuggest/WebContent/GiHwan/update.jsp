<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8" import="java.sql.*, java.util.*, java.text.*"%>

<script language = "javascript">  // 자바 스크립트 시작

function updateCheck(){
   var form = document.updateform;
   
  if( !form.title.value )
   {
    alert( "제목을 적어주세요" );
    form.title.focus();
    return;
   }
 
  if( !form.memo.value )
   {
    alert( "내용을 적어주세요" );
    form.memo.focus();
    return;
   }  
   form.submit();
} 
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>게시판</title>
 <style type="text/css">/* 스타일 시트 */

	body {
       font-size : 10px; 
	   font-family:"돋움";
	}
	/* ID = view_title (가로 100%, 세로 35px, 세로 높이지정 : 30px, 테두리 둥글게 5px, 테두리굵기 [ 2px 기본 선 색상지정 ] */
	#update_title{font-size : 14px; 
	   font-family:"돋움";width:100%; 
	   height:35px; line-height:40px;
	    border-radius:7px; border:2px solid #009688;}
</style>
 </head>
 <body>
 <%
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://127.0.0.1:3306/moviesuggest";
	String id = "root";
	String pass = "root";
	int idx = Integer.parseInt(request.getParameter("idx"));
	out.println(idx);
	String user_id = (String) session.getAttribute("user_id");
	try {
		
		Connection conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT * FROM write_db WHERE write_num=" + idx;
		ResultSet rs = stmt.executeQuery(sql);
		
		 if(rs.next()){
				String title = rs.getString(2);
				String user = rs.getString(3);
				int evaluate = rs.getInt(5);
				String reson = rs.getString(6);
				
%>
<table width="80%" align="center">
<form name=updateform method=post action="update_ok.jsp">
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr align="center">
      <td><div id="update_title">수    정</div></td>
     </tr>
    </table>
   <table>
     <tr>
      <td>&nbsp;</td>
      <td align="center" width="76">제  목</td>
      <td><input name="title" size="50" maxlength="50" value="<%=title%>"></td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center" width="76">이   름</td>
	  <td width="319"> <% out.println(" "+user_id); %></td>
    </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    
    </table>
    <table>
      <tr>&nbsp;</tr>
      <tr>
       <td>&nbsp;&nbsp;&nbsp;</td>
       <td align="center">평점 </td>
       <td><input type="radio" name="evaluate" value="1"/>1</td>
       <td><input type="radio" name="evaluate" value="2"/>2</td>
       <td><input type="radio" name="evaluate" value="3"/>3</td>
       <td><input type="radio" name="evaluate" value="4"/>4</td>
       <td><input type="radio" name="evaluate" value="5"/>5</td> 
    	</tr>
      </tr>  </table>
      <table>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td>내  용</td>
      <td>
      <textarea name="memo" cols="50" rows="13"><%=reson%></textarea></td>
      <td>&nbsp;</td>
      <% 
        }
			rs.close();
			stmt.close();
			conn.close();
		}catch(SQLException e) {
			out.println( e.toString() );
		}
	%>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2">
      <input type=submit value="수정">
      <input type=button value="취소" OnClick="window.location='list.jsp'">
      <td>&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
  </form>
 </table>
</body> 
</html>