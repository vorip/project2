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
			String name = request.getParameter("name");
			String pw = request.getParameter("pw");

			boolean check = dao.loginCheck(name, pw);

			if (check == true) {
		session.setAttribute("name", name);
		session.setAttribute("password", pw);
		int unum = dao.getUnum(name, pw);
		session.setAttribute("unum", unum);
		response.sendRedirect("homemain.jsp");
			} else {
		response.sendRedirect("login.jsp");
			}
	%>

</body>
</html>