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
	<%
		String id = (String) session.getAttribute("name");
		MemberDAO dao = new MemberDAO();

		String[] param = new String[10];
		int[] list = new int[10];

		param[0] = request.getParameter("q1");
		param[1] = request.getParameter("q2");
		param[2] = request.getParameter("q3");
		param[3] = request.getParameter("q4");
		param[4] = request.getParameter("q5");
		param[5] = request.getParameter("q6");
		param[6] = request.getParameter("q7");
		param[7] = request.getParameter("q8");
		param[8] = request.getParameter("q9");
		param[9] = request.getParameter("q10");

		for (int i = 0; i < param.length; i++) {
			list[i] = Integer.parseInt(param[i]);
		}

		dao.Questioninsert(id, list);

		out.print("<script>alert('소중한 의견 감사합니다.');</script>");
	%>
	<script>
		location.replace("my.jsp");
	</script>

</body>
</html>