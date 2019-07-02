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
		boolean check = dao.QuestionCheck(id);

		if (check == true) {

			out.print("<script>alert('이미 설문조사를 진행하셨습니다. 감사합니다.'); </script>");
	%>
	<script>
		location.replace("my.jsp");
	</script>
	<%
		} else if (check == false) {
	%>

	<h1>홈페이지 이용자 만족도 설문조사</h1>

	<form action="questionPage2.jsp">
		<table>
			<tr>
				<td>1. keldoc은 이용하기 편리했다.</td>
				<td><input type="radio" name="q1" value="1">매우 아니다 <input
					type="radio" name="q1" value="2">아니다 <input type="radio"
					name="q1" value="3">보통이다 <input type="radio" name="q1"
					value="4">그렇다 <input type="radio" name="q1" value="5">매우
					그렇다</td>
			</tr>

			<tr>
				<td>2. keldoc의 기능들은 직관적으로 찾을 수 있었다.</td>
				<td><input type="radio" name="q2" value="1">매우 아니다 <input
					type="radio" name="q2" value="2">아니다 <input type="radio"
					name="q2" value="3">보통이다 <input type="radio" name="q2"
					value="4">그렇다 <input type="radio" name="q2" value="5">매우
					그렇다</td>
			</tr>

			<tr>
				<td>3. keldoc은 페이지들 간에 잘 연결이 되어 있었다.</td>
				<td><input type="radio" name="q3" value="1">매우 아니다 <input
					type="radio" name="q3" value="2">아니다 <input type="radio"
					name="q3" value="3">보통이다 <input type="radio" name="q3"
					value="4">그렇다 <input type="radio" name="q3" value="5">매우
					그렇다</td>
			</tr>

			<tr>
				<td>4. keldoc은 디자인이 깔끔했다.</td>
				<td><input type="radio" name="q4" value="1">매우 아니다 <input
					type="radio" name="q4" value="2">아니다 <input type="radio"
					name="q4" value="3">보통이다 <input type="radio" name="q4"
					value="4">그렇다 <input type="radio" name="q4" value="5">매우
					그렇다</td>
			</tr>

			<tr>
				<td>5. keldoc의 레이아웃은 실용적이다.</td>
				<td><input type="radio" name="q5" value="1">매우 아니다 <input
					type="radio" name="q5" value="2">아니다 <input type="radio"
					name="q5" value="3">보통이다 <input type="radio" name="q5"
					value="4">그렇다 <input type="radio" name="q5" value="5">매우
					그렇다</td>
			</tr>

			<tr>
				<td>6. keldoc의 기능들은 유용했다.</td>
				<td><input type="radio" name="q6" value="1">매우 아니다 <input
					type="radio" name="q6" value="2">아니다 <input type="radio"
					name="q6" value="3">보통이다 <input type="radio" name="q6"
					value="4">그렇다 <input type="radio" name="q6" value="5">매우
					그렇다</td>
			</tr>

			<tr>
				<td>7. keldoc의 기능은 이용이 간편했다.</td>
				<td><input type="radio" name="q7" value="1">매우 아니다 <input
					type="radio" name="q7" value="2">아니다 <input type="radio"
					name="q7" value="3">보통이다 <input type="radio" name="q7"
					value="4">그렇다 <input type="radio" name="q7" value="5">매우
					그렇다</td>
			</tr>

			<tr>
				<td>8. keldoc의 기능들은 만족스러웠다.</td>
				<td><input type="radio" name="q8" value="1">매우 아니다 <input
					type="radio" name="q8" value="2">아니다 <input type="radio"
					name="q8" value="3">보통이다 <input type="radio" name="q8"
					value="4">그렇다 <input type="radio" name="q8" value="5">매우
					그렇다</td>
			</tr>

			<tr>
				<td>9. keldoc은 필요한 기능을 모두 갖추고 있다.</td>
				<td><input type="radio" name="q9" value="1">매우 아니다 <input
					type="radio" name="q9" value="2">아니다 <input type="radio"
					name="q9" value="3">보통이다 <input type="radio" name="q9"
					value="4">그렇다 <input type="radio" name="q9" value="5">매우
					그렇다</td>
			</tr>

			<tr>
				<td>10. keldoc을 다시 사용 할 것이다.</td>
				<td><input type="radio" name="q10" value="1">매우 아니다 <input
					type="radio" name="q10" value="2">아니다 <input type="radio"
					name="q10" value="3">보통이다 <input type="radio" name="q10"
					value="4">그렇다 <input type="radio" name="q10" value="5">매우
					그렇다</td>
			</tr>
			<tr>
				<td><input type="text" name="id" value="<%=id%>"
					readonly="readonly"></td>
				<td colspan="1"><input type="submit" value="완료"></td>
			</tr>

		</table>
	</form>


	<%
		}
	%>
</body>
</html>