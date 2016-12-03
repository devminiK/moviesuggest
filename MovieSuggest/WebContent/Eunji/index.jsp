<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> MovieSuggest </title>

<style type="text/css">
	@import url(style.css);	
</style>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="jquery.ulslide.js"></script>

<script type="text/javascript">
            $(function() {
                $('#main_bn').ulslide({
                    statusbar: true,
                    width: 850, 
                    height: 420, 
                    affect: 'slide', 
                    axis: 'x', 
                    navigator: '#main_bn_btn a',
                    duration: 400, 
                    autoslide: 3000 
                });
            });
</script>
</head>

<body>


<%@ include file="header.jsp" %>
	
<div id="wrap">
    	<div id="main_bn">
    		<li>
    			<img src="../img/picture1.jpg" alt="" />
    		</li>
    		<li>
    			<img src="../img/picture2.jpg" alt="" />
    		</li>
    		<li>
    			<img src="../img/picture3.jpg" alt="" />
    		</li>
    	<div align="center" style="width:100%;">
    		<div id="main_bn_btn" >
    		<ul>
    			<li><a href="#"><img src="../img/blt.png" /></a></li>
    			<li><a href="#"><img src="../img/blt.png" /></a></li>
    			<li><a href="#"><img src="../img/blt.png" /></a></li>
    		</ul>
    	</div>
    	</div>
    </div>
    </div>

	<div align="center">
		<table style="width:850px;">
			<tr>
				<td><a href="movie_list.jsp"> 한눈에보기 </a></td>
				<td><a href="../GiHwan/list.jsp"> 추천게시판 </a></td>
				<td><a href="../Sungmin/mypage.jsp"> 마이페이지 </a></td>
		</table>
	</div>

</body>
</html>