<%@page import="bean.MemberDAO"%>
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
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

						// �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
						// �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
						var addr = ''; // �ּ� ����
						var extraAddr = ''; // �����׸� ����

						//����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
						if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
							addr = data.roadAddress;
						} else { // ����ڰ� ���� �ּҸ� �������� ���(J)
							addr = data.jibunAddress;
						}

						// ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����׸��� �����Ѵ�.
						if (data.userSelectedType === 'R') {
							// ���������� ���� ��� �߰��Ѵ�. (�������� ����)
							// �������� ��� ������ ���ڰ� "��/��/��"�� ������.
							if (data.bname !== ''
									&& /[��|��|��]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// ���յ� �����׸��� �ش� �ʵ忡 �ִ´�.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// ������ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
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

	<br>

	<!--마이페이지 탭-->
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
</div>

	<!-- ���� ������ ���� -->
	<%
		String id = (String) session.getAttribute("name");
		String pw2 = (String) session.getAttribute("password");

		MemberDAO dao = new MemberDAO();
		String info = dao.select(id, pw2);
		String[] infoArray = info.split(" ");
	%>

	<%-- 이름<%=infoArray[0]%>   비밀번호 <%=infoArray[1]%>  나이 <%=infoArray[2]%> umum <%=infoArray[3]%> 전화번호<%=infoArray[4]%> 주소 <%=infoArray[6]%> --%>
<div align="center" style="width: 600px; text-align: center; position: absolute;
	top: 50%;
	left: 35%;">
	<form action="memberDBChange.jsp">
		이름 : <input type="text" value="<%=infoArray[0]%>" readonly="readonly"
			id="name" name="name" class="form-control"> <br> 비밀번호 : <input type="text"
			value="<%=infoArray[1]%>" id="password" name="password" class="form-control"> <br>
		나이 : <input type="text" value="<%=infoArray[2]%>" id="age" name="age" class="form-control"><br>
		전화번호 : <input type="text" value="<%=infoArray[4]%>" id="tel"
			name="tel" class="form-control"> <br> 주소 : <input type="text"
			value="<%=infoArray[6]%>" id="addr" name="addr" class="form-control"><br> <input
			type="submit" value="수정완료" class="btn btn-outline-success">
	</form>
</div>
</body>
</html>