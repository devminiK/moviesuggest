<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="moviesuggest.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="writebean" class="moviesuggest.WriteBean" />
<jsp:useBean id="write" class="moviesuggest.Write" />
<jsp:setProperty name="write" property="*" />

<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" />

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

	<%@ include file="header.jsp"%>

	<%!
	ArrayList<String> movie;
	String[] movie_title = null;
	int i = 0;
	int count[] = { 0 }, rank[] = { 0 };%>

	<%
		for (Write wr : (ArrayList<Write>) datas) {
			movie_title[i] = wr.getWrite_title();
			i++;
		}

		for (int j = 0; j <= i; j++) {
			for (int n = 0; j <= i; n++) {
				if (movie_title[n].equals(movie_title[j]))
					count[j]++;
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

				out.println(rank[n]);
			}
		}
	%>

	<%-- <%

int i=0, j=0;

for(i=0; i<2; i++){
	
	out.println("<ul>");
	
	for(j=0; j<4; j++){
		out.println("<li>");
		
		if(i==1){
			j+=5;
		}else i+=1;
		
		out.println("No."+i);
	}
}

%> --%>

	<ul>
		<li>
			<div style="height: 400px; float: left; width: 25%;">
				<p>No.1</p>
				<img id="list_img" src="../img/picture1.jpg" />
				<p>제목제목</p>

			</div>
		</li>
		<li>
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
		</li>
	</ul>
</body>
</html>