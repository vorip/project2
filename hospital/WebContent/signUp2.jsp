<%@page import="bean.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="dto" class="bean.MemberDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="dto" />
	<%
		MemberDAO dao = new MemberDAO();
			dao.insert(dto);
	%>
	<p>회원 가입이 완료되었습니다. 로그인 해주세요.</p>
	<a href="login.jsp"><input type="button" value="메인으로"></a>
</body>
</html>