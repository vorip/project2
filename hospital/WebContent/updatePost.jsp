<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	if ($("#nullDoctor").val() == "true") {
		$("#doctor").empty();
	} else {
	}
	$("#font_familySel").on("change", function() {
		$("textarea").css("font-family", $(this).val());
	})
	$("#font_size").on("change", function() {
		$("textarea").css("font-size", $(this).val());
	})
	$("#font_weight").on("change", function() {
		$("textarea").css("font-weight", $(this).val());
	})
	$("#font").on("change", function() {
		$("textarea").css("text-align", $(this).val());
	})
	$("#subBtn").click(function() {
		if($("#title").val().trim()!=""&& $("#content").text().trim()!=""){
			$("#update").submit();
			alert("수정이 완료되었습니다.");
			}else{
				alert("제목과 내용을 모두 채워주세요")
			}
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
		String info = "";
		String[] info2 = null;
		String[] fonts=null;
		String name="";
		if(session.getAttribute("name") == null){
			%>
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="login.jsp">로그인</a></li>
				<li class="nav-item"><a class="nav-link" href="signUp.jsp">회원가입</a></li>
			</ul>
			<%
				}else{
					info = request.getParameter("info");//선택한 게시물의 dto를 toString() 한것
					info2 = info.split(",");// title,content~ 등으로 나눈것
					fonts = info2[5].split(":"); //font를 나눈것
					name = (String)session.getAttribute("name");
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
		
		if (session.getAttribute("name")==null ) {
			response.sendRedirect("login.jsp");
		}else{
	%>
	<div class="notice_write">
		<h1>게시판 수정하기</h1>
		<form action="updatePostRe.jsp" id="update">
			제목: <input type="text" width="300" size="80" id="title" name="title" value="<%= info2[0]%>"><br>
			<input type = "hidden" name ="name" value="<%= info2[1] %>">
			<input type = "hidden" name ="time" value="<%= info2[3] %>">
			<input type = "hidden" name ="unum" value="<%= info2[4] %>">
			<input type = "hidden" name ="comment" value="<%= info2[6] %>">
			<input type = "hidden" name ="commentTime" value="<%= info2[7] %>">
			<input type = "hidden" name ="commentName" value="<%= info2[8] %>">
			<select id="font_familySel" name="font_family">
				<option value="dotum">글꼴</option>
				<option class="font_family" id="font_family1" value="dotum">돋움체</option>
				<option class="font_family" id="font_family2" value="궁서체">궁서체</option>
				<option class="font_family" id="font_family3" value="gulim">굴림체</option>
				<option class="font_family" id="font_family4" value="cursive">cursive</option>
				<option class="font_family" id="font_family5" value="arial">arial</option>
				<option class="font_family" id="font_family6" value="serif">serif</option>
			</select><select id="font_size" name="font_size">
				<option value="9px">크기</option>
				<option id="font_size1" value="9px">9pt</option>
				<option id="font_size2" value="12px">12pt</option>
				<option id="font_size3" value="18px">18pt</option>
				<option id="font_size4" value="24px">24pt</option>
			</select><select id="font_weight" name="font_weight">
				<option value="normal">굵기</option>
				<option value="normal">보통</option>
				<option id="font_weight1" value="bold">굵게</option>
			</select><select id="font" name="font">
				<option value="left">글꼴</option>
				<option value="left">왼쪽</option>
				<option value="center">가운데</option>
				<option value="right">오른쪽</option>
			</select> <br>
			<textarea rows="20" cols="50" placeholder="내용을 입력해주세요."
				name="content" id="content" style="width: 773px; height: 566px; font-family: <%=fonts[0]%>;font-size: <%=fonts[1]%>;font-weight: <%=fonts[2]%>;text-align: <%=fonts[3]%>;" ><%=info2[2] %></textarea>
			<br>
			<%
				String s1 = request.getParameter("nullDoctor");
			%>
			<input id="nullDoctor" type="hidden" value="<%= s1 %>">
		
			<div id="doctor">
			<%
				if(info2.length>11){
					
			%>
			<input type = "hidden" name ="nonum" value = "<%= info2[12]+"" %>">
			<input type = "hidden" name = "doctor" value="<%= info2[9] %>">
			<input type = "hidden" name = "hospital" value="<%= info2[10] %>">
			</div>
			<% }else{ %>
			<input type = "hidden" name ="nonum" value = "<%= info2[10]+"" %>"> <%} %>
			<button id="subBtn" type="button">수정완료</button>
			</form>
	</div>
	<%} %>
	
</body>
</html>