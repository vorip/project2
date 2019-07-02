<%@page import="sun.nio.cs.HistoricallyNamedCharset"%>
<%@page import="bean.NoticeDAO"%>
<%@page import="bean.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert("글이 삭제되었습니다.");
</script>
</head>
<body>
	<%
		String info1 = request.getParameter("info");
		String[] info = info1.split(",");
		NoticeDTO dto = new NoticeDTO();
		dto.setName(info[1]);
		if(dto.getName().equals(session.getAttribute("name"))){
			NoticeDAO dao = new NoticeDAO();
			//notice2와 1으로 이동하는 조건 걸기
			if(info.length>11){
				dto.setNonum(Integer.parseInt(info[12]));
				dao.delete(dto);
				response.sendRedirect("notice.jsp?index=0");
			}else{
				dto.setNonum(Integer.parseInt(info[10]));
				dao.delete(dto);
				response.sendRedirect("notice2.jsp?index=0");
			}
		}else{
			if(info.length>11){
				response.sendRedirect("notice.jsp?index=0");
			}else{
				response.sendRedirect("notice2.jsp?index=0");
			}
			
		}
	%>

</body>
