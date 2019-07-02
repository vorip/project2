<%@page import="bean.ResaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	ResaDAO dao = new ResaDAO();
	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
	String address = request.getParameter("address");
	String doctor = request.getParameter("doctor");
	dao.update(name, pw, address, doctor);
	out.write(doctor);
%>

</body>
</html>