<%@page import="bean.MemberDAO"%>
<%@page import="bean.ResaDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="main.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">	
	 var doctorArr = ["Dr.Choi","Dr.Lee","Dr.Park","Dr.Jung","Dr.Min","Dr.Hong","Dr.Jun"];
	 var date = new Date();
	 $(function(){
		$("#resaDel").click(function(){
			var name = $("#name").text();
			var pw = $("#pw").text();
			var address = $("#address").text();
			$.ajax({
				url : "resaDelete.jsp",
				data : {
					"name" : name,
					"pw" : pw,
				},
				success : function() {
					alert("예약 정보가 삭제되었습니다.")
					location.href = "my.jsp"; 
				} 
			})
		}) 
	}) 
</script>	
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
				<li><a href="notice2.jsp?index=0" id="menuLink"><img
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

	<br>
	<br>

	<div class="my">
		<h1>마이페이지</h1>
		<!-- session 로그인 시 name을 기준으로 모든 회원 정보를 DB에서 긁어옴 -->

		<jsp:useBean id="dto" class="bean.MemberDTO"></jsp:useBean>
		<jsp:setProperty property="*" name="dto" />

		<%
			String id = (String) session.getAttribute("name");
			String pw2 = (String) session.getAttribute("password");

			if (id == null && pw2 == null) {
				response.sendRedirect("login.jsp");
			}

			MemberDAO dao = new MemberDAO();
			String info = dao.select(id, pw);
			String[] infoArray = info.split(" ");

			ResaDTO dto2 = dao.resacall(id, pw2);
		%>
		<!-- name + " " + pw + " " + age + " " + gender + " " + tel + " " + unum + " " + addr -->
		
		<table class="table table-striped">
			<tr>
				<td>이름</td>
				<td id = "name"><%=infoArray[0]%></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td id = "pw"><%=infoArray[1]%></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><%=infoArray[2]%></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><%=infoArray[3]%></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><%=infoArray[4]%></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><%=infoArray[6]%></td>
			</tr>
		</table>


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
		<hr>

		<br> <br>
		<%
			for (int i = 0; i < 1; i++) {
				if (dto2 != null) {
		%>
		<div class="resa">
			<h1>예약정보</h1>
			<table class="table table-striped">
				<tr>
					<td>병원명</td>
					<td><%=dto2.getHospital()%></td>
				</tr>
				<tr>
					<td>주소</td>
					<td id = "address"><%=dto2.getAddress()%></td>
				</tr>
				<tr>
					<td>부위</td>
					<td><%=dto2.getBody()%></td>
				</tr>
				<tr>
					<td>담당의<input type = "hidden" value="false" id = "key"></td>
					<td id="doctor"><%=dto2.getDoctor()%></td>
				</tr>
				<tr>
					<td>예약 날짜 및 시간</td>
					<%
					
					 String[] reDate = dto2.getDate().split(":"); 
					String myDate = reDate[0] + "년" +
					 reDate[1] + "월"+reDate[2]+"일"+reDate[3]+"시";
					
					%>
					<td><%=myDate%></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><%=dto2.getPrice()%></td>
				</tr>
			</table>
			<!-- 예약수정버튼 -->
			<button type="button" class="btn btn-light" id ="resaUp" style="color:green;">
				예약수정</button>
			<script>
			$("#resaUp").click(function() {//예약정보 수정(담당의만)
				if($("#key").val()=="false"){//true일때 의사정보를 수정할 수 있도록
					alert("담당의를 변경 후 다시 수정 버튼을 눌러주세요.")
					$("#key").val("true");
					$("#doctor").empty();
					$("#doctor").append("<select id = doctorList></select>");
					for(var i=0;i<doctorArr.length;i++){
						if(date.getDay()==i){
							continue;
						}else{
							$("#doctorList").append('<option value='+doctorArr[i]+'>'+doctorArr[i]+'</option>');
							console.log(i+1+"번째");
						}
					}
				}else if($("#key").val()=="true"){
					var name =  $("#name").text();
					var pw = $("#pw").text();
					var doctor = $("#doctorList").val();
					var address = $("#address").text();
					$.ajax({
						url : "resaUpdate.jsp",
						data : {
							"name" : name,
							"address" : address,
							"doctor" : doctor,
							"pw" : pw
						},
						success : function(result) {
							$("#doctor").empty();
							$("#key").val("false");
							$("#doctor").append(result);
							alert("수정이 완료되었습니다.")
						}
					})
				}
			})
			</script>
			<button type="button" class="btn btn-light" id="resaDel" style="color: green;">
				예약삭제</button>
			<%
				} else {
			%>
			<table>
				<tr>
					<td><h3>예약 정보가 없습니다.</h3></td>
				</tr>
			</table>
			
			
			<%
				}
				}
			%>
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