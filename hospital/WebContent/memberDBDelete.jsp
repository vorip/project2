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
		String id = (String) session.getAttribute("name");
		String password = (String) session.getAttribute("password");

		String name = request.getParameter("name");
		String pw = request.getParameter("pw");

		if (name.equals(id) && pw.equals(password)) {
			dao.delete(dto);
			session.removeAttribute("name");
			session.removeAttribute("password");
			out.print("<script>alert('탈퇴가 진행되었습니다. 이용해주셔서 감사합니다.'); </script>");
	%>
	<script>
		location.replace("homemain.jsp");
	</script>
	<%
		} else {
			out.print("<script>alert('잘못된 이름과 비밀번호입니다.');</script>");
	%>
	<script>
		location.replace("myDelete.jsp");
	</script>
	<%
		}
	%>

</body>
</html>