<%@page import="bean.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.NoticeDAO"%>
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
	<br>

	<jsp:useBean id="dto" class="bean.NoticeDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="dto" />

	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<form action="insertPost.jsp">
					<button type="submit" style="float: left" class="btn btn-outline-success">글 작성</button>
					<br>
					<br> <input type="hidden" name="nullDoctor" value="false">
				</form>
				<ul class="list-group list-group-flush">
					<li class="list-group-item"
						style="padding-bottom: 3px; padding-top: 3px;">
						<table>
							<tr>
								<td
									style="font: 12px 굴림; font-weight: bold; padding-left: 200px;">제목</td>
								<td
									style="font: 12px 굴림; font-weight: bold; padding-left: 230px;">작성자</td>
								<td
									style="font: 12px 굴림; font-weight: bold; padding-left: 100px;">시간</td>
							</tr>
						</table>
					</li>
					<%!int i;%>
					<%
						NoticeDAO dao = new NoticeDAO();
						ArrayList<NoticeDTO> list = dao.noticeAll();
						i = Integer.parseInt(request.getParameter("index"));
						NoticeDTO dto2 = null;
						while (i < list.size()) {
							dto2 = list.get(i);
							String info = dto2.toString2();
							
					%>

					<li class="list-group-item"
						style="padding-bottom: 5px; padding-top: 5px;">
						<table>
							<tr>
								<td style="font: 12px 굴림; font-weight: bold; width: 100px"><%=i + 1%></td>
								<td style="font: 12px 굴림; font-weight: bold; width: 350px;">
									<a href="post2.jsp?info=<%=info%>"><%=dto2.getTitle()%></a>
								</td>
								<td style="font: 12px 굴림; font-weight: bold; width: 130px;"><%=dto2.getName()%></td>
								<td style="font: 12px 굴림; font-weight: bold;"><%=dto2.getTime()%></td>
							</tr>
						</table>
					</li>

					<%
						i++;
							if (i % 10 == 0 && i != 0) {
								break;
							}
						}
					%>

				</ul>
				<div class="col-lg-4 col-md-10 mx-auto">
					<ul class="pagination pagination-sm">
						<li class="page-item"><a class="page-link" href="">Previous</a></li>
						<li class="page-item"><a class="page-link"
							href="notice.jsp?index=0">1</a></li>
						<%
							if (list.size() % 10 != 0 && list.size() != 0 && list.size() > 10) {
								int pageNum = list.size() / 10;
								int index;
								for (index = 1; index <= pageNum; index++) {
						%>
						<li class="page-item"><a class="page-link"
							href="notice.jsp?index=<%=index * 10%>"><%=index + 1%></a></li>
						<%
							}
							}
						%>
						<li class="page-item"><a class="page-link" href="">Next</a></li>
					</ul>
				</div>
			</div>
		</div>
		<hr>

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