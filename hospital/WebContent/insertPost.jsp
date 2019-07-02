<%@page import="bean.MemberDTO"%>
<%@page import="bean.MemberDAO"%>
<%@page import="bean.ResaDAO"%>
<%@page import="bean.ResaDTO"%>
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
			if($("#title").val()==""){
				alert("제목을 입력해주세요");
				return false;
			}else if($("#content").val()==""){
				alert("내용을 입력해주세요");
				return false;
			}else{
				alert("글쓰기가 완료되었습니다.")
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
			String name = (String)session.getAttribute("name");
			String pw = (String)session.getAttribute("password");
			String num = (String)(session.getAttribute("unum")+"");
            
         
			if(session.getAttribute("name")==null){
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
		
		if (session.getAttribute("name")==null) {
			response.sendRedirect("login.jsp");
		}else{
	%>
	<!-- 글쓰기 -->
	<div class="notice_write">
		<h1 align="center">게시판 글쓰기</h1>
		<form method="get" action="insertPostRe.jsp">
			<center>
				제목: <input class="form-control" type="text" width="250" size="80"
					id="title" name="title" style="margin-bottom: 10px;"><br>
				<select id="font_familySel" name="font_family"
					style="margin-bottom: 10px;">
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
					<!-- 파일이름들어가는공간 -->
					<!-- <input type="hidden" value="" id="filename" name = "filename"> -->
				</select> <br>
				<textarea class="form-control" rows="20" cols="50"
					placeholder="내용을 입력해주세요." name="content" id="content"
					style="width: 773px; height: 566px;"></textarea>
				<!-- <div id="content"  contentEditable="true" style="text-align:left; overflow-x:auto; width:500px; height: 300px; border: solid; 1px; margin: 20px; line-height: 20px; "> </div> -->
				<!-- 넘길내용 -->
				<!-- <input type="hidden"name="content" id="content2"> -->
				<br>
				<%
					String s1 = request.getParameter("nullDoctor");
				%>
				<input id="nullDoctor" type="hidden" value="<%=s1%>">
		 	<%
		 	if(request.getParameter("nullDoctor").equals("false")){
			 	ResaDAO dao = new ResaDAO();
    	        ResaDTO dto = dao.select(name,pw);
    	        if(dto!=null){
		 	%>
				<div id="doctor" style="margin-bottom: 10px;">
              병원 : <%= dto.getHospital() %>
               <input type = "hidden" name="hospital" value="<%= dto.getHospital() %>">
               담당의 : <%= dto.getDoctor() %><br>
               <input type = "hidden" name="doctor" value="<%= dto.getDoctor() %>"><br> 
				</div>
				<%}} %>
				<button id="subBtn" type="submit" class="btn btn-success">글쓰기
					완료</button>
			</center>
			<input type="hidden" name="nameNum" value="<%= name+"," +num%>">
		</form>
	</div>
<%} %>
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