<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "infoCall.jsp",
			data : {
				"idx" : 0,
				"data" : $("#idnum").val()
			},
			dataType : "html",
			success : function(result) {
				$(".life").html(result);
			}
		})
		$(".btn").click(function() {
			location.href="homemain.jsp";
			var btn = $(this).val();
			var data = "";
			switch (btn) {
			case "life":
				idx = 0;
				data = $("#idnum").val();
				break;
			case "health":
				idx = 30;
				var ssss = $("#idnum").val().split(",");
				var intssss = [];
				for (var i = 0; i < ssss.length; i++) {
					intssss[i] = ssss[i] * 1 + idx;
					if (i == ssss.length - 1) {
						data += intssss[i];
					} else {
						data += intssss[i] + ",";
					}
				}
				break;
			case "doctor":
				idx = 60;
				var ssss = $("#idnum").val().split(",");
				var intssss = [];
				for (var i = 0; i < ssss.length; i++) {
					intssss[i] = ssss[i] * 1 + idx;
					if (i == ssss.length - 1) {
						data += intssss[i];
					} else {
						data += intssss[i] + ",";
					}
				}
				break;
			}
			$.ajax({
				url : "infoCall.jsp",
				data : {
					"data" : data
				},
				dataType : "html",
				success : function(result) {
					$(".life").html(result);
				}
			})
		})
	})
</script>
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
			String pw = (String)session.getAttribute("password");
			if(name == null){
		%>
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="login.jsp">로그인</a></li>
			<li class="nav-item"><a class="nav-link" href="signUp.jsp">회원가입</a></li>
		</ul>
		<%
			}else{
			%>
			<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="logout.jsp">로그아웃</a></li>
			</ul>
		<%	
			}
		%>
	</nav>

	<br>
	<%
		Random r = new Random();
		int index = 0;//랜덤으로 뽑힌 숫자가 들어가는 변수
		int i1 = 0;//배열의 인덱스가 될 변수
		boolean b = false;//중복체크를 하고 중복이 아닐경우 true ,중복이 false
		int[] rNum = new int[10];//랜덤으로 뽑힌 중복되지 않은 숫자들이 들어갈 배열
		while (true) {
			b = false;//중복체크가 끝나고 나서 다시 false로 초기화
			index = r.nextInt(30);
			if (i1 == 0) {//첫번째 인덱스이기 떄문에 중복체크를 하지 않는 조건식
				rNum[i1] = index;
				i1++;
			} else if (i1 == 10) {//배열이 다 채워졌을 때 반복문을 종료하는 조건식
				break;
			} else if (1 <= i1 && i1 < 10) {//두번째 인덱스부터 마지막 인덱스를 채울때까지의 중복을 체크하는 조건식
				rNum[i1] = index;
				for (int j = i1; j >= 0; j--) {//중복을 체크하는 반복문 j는 중복체크의 기준이 될 인덱스, k는 중복체크할 인덱스
					for (int k = i1; k >= 0; k--) {
						if (j != k) {//j와 k가 같으면 같은 인덱스의 값을 비교하기 때문에 같은 인덱스를 건너뜀
							if (rNum[j] != rNum[k]) {//중복체크
								b = true;//중복되지 않으면 true
							} else {//하나라도 중복일 경우 j와 k의 값을 0으로 만들어서 반복문 탈출 유도.
								b = false;
								j = 0;
								k = 0;
							}
						}
					}
				}
			}
			if (b) {//중복되지 않은 결과가 나왔을 때 인덱스를 증가시켜 다음 인덱스 비교 유도
				i1++;
			} else {
			}
		}
		//rNum을 스트링으로 바꿔서 넣을 변수
		String ssss = "";
		//rNum의 길이만큼 반복문의 범위
		for (int i = 0; i < rNum.length; i++) {
			//마지막에 ,안넣기 위한 조건식
			if (i == rNum.length - 1) {
				//스트링 배열에 rNum의 값 저장
				ssss += rNum[i];
			} else {
				//스트링 배열에 rNum의 값 저장
				ssss += rNum[i] + ",";
			}
		}
	%>


	<input type="hidden" id="idnum" value="<%=ssss%>" name="idnum">

	<div class="btnGroup">
		<button value="life" class="btn btn-outline-success">건강</button>
		<button value="health" class="btn btn-outline-success">운동</button>
		<button value="doctor" class="btn btn-outline-success">의료기술</button>
	</div>
	<!-- 정보 테이블 불러올 div -->
	<div class="life">
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