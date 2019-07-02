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
		String id = request.getParameter("name");
		String pw = request.getParameter("password");
		int age = Integer.parseInt(request.getParameter("age"));
		String tel = request.getParameter("tel");
		String addr = request.getParameter("addr");

		dao.update(id, age, tel, addr, pw);
		session.setAttribute("password", pw);
		response.sendRedirect("myUpdate.jsp");
	%>
</body>
</html>