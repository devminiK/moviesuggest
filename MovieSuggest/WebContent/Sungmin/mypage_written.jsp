<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.util.*"
   import="java.sql.*, moviesuggest.*"%>
<!--수정중-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내가 쓴글</title>
</head>
<body>
   <div align=center>
      <H1>내가 쓴글</H1>
      <HR>
      <form name="form1" method="POST" action="../Sungmin/mypage_written.jsp">
         <select name=movietype>
            <option>호 러</option>
            <option>스릴러</option>
            <option>로맨스</option>
            <option>액 션</option>
         </select> 
         <input type="submit" value="확인" />
      </form>
   </div>
   
   <%
      ArrayList<Write> user = new ArrayList<Write>();
      Write user2 = new Write();
      String user_id = (String) session.getAttribute("user_id");//문제없음(확인)
      String user_ganre = request.getParameter("movietype");

      String write_user = null;
      String write_ganre = null;
      int Wnum = 1;

      for (Write info : (ArrayList<Write>) datas) {
         write_user = info.getWrite_user();
         //write_ganre = info.getWrite_ganre();

         if (user_id.equals(write_user)) {
           // if (user_ganre.equals(write_ganre)) {
   %>

   No.<%= Wnum %>
   <table border=1 width=100% height=200>
      <tr>
         <td height=15%>제목 : <%=info.getWrite_title()%>(<%=info.getWrite_ganre()%>)
         </td>
      </tr>
      <tr>
         <td><%=info.getWrite_reson()%></td>
      </tr>
   </table>
   <br>


   <%
      Wnum++;
            }
         //}
      }
   %>
   <div align=center>
      <button type="button" onclick="location.href='../Sungmin/mypage.jsp'">이전으로</button>
      <button type="button" onclick="location.href='../Eunji/index.jsp'">홈으로</button>
   </div>
</body>
</html>