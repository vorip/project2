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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
			String name = (String) session.getAttribute("name");
			String pw = (String) session.getAttribute("password");
			if (name == null) {
		%>
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="login.jsp">로그인</a></li>
			<li class="nav-item"><a class="nav-link" href="signUp.jsp">회원가입</a></li>
		</ul>
		<%
			} else {
		%>
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="logout.jsp">로그아웃</a></li>
		</ul>
		<%
			}
		%>
	</nav>
<div align="center">
<button type="button" class="btn btn-light">
			<a href="my.jsp" style="color: green;">내 정보 보기</a>
		</button>
		<button type="button" class="btn btn-light">
			<a href="myUpdate.jsp" style="color: green">내 정보 수정</a>
		</button>
		<button type="button" class="btn btn-light">
			<a href="myDelete.jsp" style="color: green">회원 탈퇴</a>
		</button>
		<button type="button" class="btn btn-light">
			<a href="questionPage.jsp" style="color: green">이용자 만족도 평가</a>
		</button>
</div><br>
	<!-- 메인 컨텐츠 -->
	<div  style="text-align:center; width: 700px;position: absolute;
	top: 50%;
	left: 33%;">
		<H1>정말 삭제하시겠습니까?</H1>
		<h3>삭제를 원하시면 이름과 비밀번호를 입력해주세요</h3>
		<form action="memberDBDelete.jsp">
			이름 : <input type="text" name="name" id="name" class="form-control"> <br> 
			비밀번호: <input type="text" name="pw" id="pw" class="form-control"><br> <input
				type="submit" value="회원 탈퇴" class="btn btn-outline-success">
		</form>
	</div>
</body>
</html>