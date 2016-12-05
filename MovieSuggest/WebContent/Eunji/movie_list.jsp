<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="moviesuggest.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />

<html>
<head>
<title>MovieSuggest</title>

<style type="text/css">
@import url(style.css);

body {
	padding: 0px;
	margin: 0px;
}

img {
	width: 95%;
	height: 300px;
}

div {
	text-align: center;
}
</style>

</head>
<body>

	<%-- <%@ include file="header.jsp"%> --%>

	<%!
	ArrayList<String> movie_title = new ArrayList<String>();
	
	int i = 0;
	int count[] = {0,0,0,0,0,0,0,0,0,0}, rank[] = {0,0,0,0,0,0,0,0,0,0};
	%>

	<%
		for (Write wr : (ArrayList<Write>) datas) {
			
			movie_title.add(wr.getWrite_title());
			out.println(movie_title.get(i));
			i++;
			
		}

		for (int j = 0; j < i; j++) {
			for (int n = 0; n < i; n++) {
				if ((movie_title.get(n)).equals(movie_title.get(j)))
					count[j]+=1;
			}
			rank[j] = count[j];
		}

		// rank[i] -> count의 숫자를 내림차순으로 정렬.
		for (int n = 0; n < rank.length; n++) {
			for (int j = n + 1; j < rank.length; j++) {
				if (rank[n] < rank[j]) {
					int tmep = rank[n];
					rank[n] = rank[j];
					rank[j] = tmep;
				}

				
			}out.println(rank[n]);
		} 
	%>
	

	 <ul>
	 
	 <%
	
	for(i=0; rank[i] != 0; i++){
	
	%>
	 
		<li>
			<div style="height: 400px; float: left; width: 25%;">
				<p>No.<%=i+1 %></p>
				<img id="list_img" src="../img/picture1.jpg" />
				<p><%=movie_title.get(rank[0]) %></p>

			</div>
		</li>
		
		<%
		}
		%>
		<!-- <li>
			<div style="height: 400px; float: left; width: 25%;">
				<p>No.2</p>
				<img id="list_img" src="../img/picture1.jpg" />
				<p>제목제목</p>
			</div>
		</li>
		<li>
			<div style="height: 400px; float: left; width: 25%;">
				<p>No.3</p>
				<img id="list_img" src="../img/picture1.jpg" />
				<p>제목제목</p>
			</div>
		</li>
		<li>
			<div style="height: 400px; float: left; width: 25%;">
				<p>No.4</p>
				<img id="list_img" src="../img/picture1.jpg" />
				<p>제목제목</p>
			</div>
		</li>
	</ul>
	<ul>
		<li>
			<div style="height: 400px; float: left; width: 25%;">
				<p>No.5</p>
				<img id="list_img" src="../img/picture1.jpg" />
				<p>제목제목</p>
			</div>
		</li>
		<li>
			<div style="height: 400px; float: left; width: 25%;">
				<p>No.6</p>
				<img id="list_img" src="../img/picture1.jpg" />
				<p>제목제목</p>
			</div>
		</li>
		<li>
			<div style="height: 400px; float: left; width: 25%;">
				<p>No.7</p>
				<img id="list_img" src="../img/picture1.jpg" />
				<p>제목제목</p>
			</div>
		</li>
		<li>
			<div style="height: 400px; float: left; width: 25%;">
				<p>No.8</p>
				<img id="list_img" src="../img/picture1.jpg" />
				<p>제목제목</p>

			</div>
		</li> -->
	</ul>
</body>
</html>