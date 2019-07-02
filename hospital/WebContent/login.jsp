<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="main.css">
</head>
<body>
	<a href="homemain.jsp"><img src="img/logo.jpeg"
		style="width: 300px; height: 150px; text-align: center; display: block; margin: 0px auto;"></a>
	<!-- 상단 메뉴바 -->
	<div id="top">
		<nav id="topMenu">
			<ul>
				<li><a href="homemain.jsp" id="menuLink"><img
						src="img/home2.png" onmouseover="this.src='img/home.png'"
						onmouseout="this.src='img/home2.png'"></a></li>
				<li><a href="my.jsp" id="menuLink"><img src="img/my2.png"
						onmouseover="this.src='img/my.png'"
						onmouseout="this.src='img/my2.png'"></a></li>
				<li><a href="resa.jsp" id="menuLink"><img
						src="img/resa2.png" onmouseover="this.src='img/resa.png'"
						onmouseout="this.src='img/resa2.png'"></a></li>
				<li><a href="notice.jsp?index=0" id="menuLink"><img
						src="img/notice2.png" onmouseover="this.src='img/notice.png'"
						onmouseout="this.src='img/notice2.png'"></a></li>
				<li><a href="notice2.jsp?index=0 " id="menuLink"><img
						src="img/contact2.png" onmouseover="this.src='img/contact.png'"
						onmouseout="this.src='img/contact2.png'"></a></li>
				<li><a href="chart.jsp" id="menuLink"><img
						src="img/chart2.png" onmouseover="this.src='img/chart.jpg'"
						onmouseout="this.src='img/chart2.png'"></a></li>
			</ul>
		</nav>
	</div>
	<br>
	<br>
	<br>
	<br>
	<!-- 로그인 nav바 -->
	<nav
		class="navbar navbar-expand-sm bg-success navbar-dark justify-content-center">
		<%
			String name = (String)session.getAttribute("name");
			if(name == null){
		%>
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="login.jsp">로그인</a></li>
			<li class="nav-item"><a class="nav-link" href="signUp.jsp">회원가입</a></li>
		</ul>
		<%
			}		
		%>
	</nav>
	<br>
	<!-- 로그인 폼 -->
	<div id="login">
		<h1>로그인</h1>
		<h4>홈페이지의 다양한 정보와 맞춤 서비스를 이용하시려면 로그인이 필요합니다.</h4>
		<div id="loginForm">
			<form action="login2.jsp">
				Name: <input type="text" class="form-control" id="name" name="name">
				PW: <input type="password" class="form-control" id="pw" name="pw"
					style="margin-bottom: 20px">
				<button type="submit" class="btn btn-outline-success"
					style="margin-left: 10px">로그인</button>
			</form>
		</div>
	</div>
	<!-- 챗봇 -->
	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) {
				return;
			}
			js = d.createElement(s);
			js.id = id;
			js.src = "https:\/\/danbee.ai/js/plugins/frogue-embed/frogue-embed.min.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'frogue-embed'));
	</script>

	<div id="frogue-container" class="position-right-bottom"
		data-chatbot="dfe8c896-af87-4447-882e-bf1e2383f8ba" data-user="사용자ID"
		data-init-key="value"></div>

</body>
</html>
