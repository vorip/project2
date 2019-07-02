<%@page import="bean.InfoDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="bean.DBConnectionMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
/* 건강정보 넣기 */
	$(function() {
		$.ajax({
					url : "https://api.rss2json.com/v1/api.json?rss_url=http://health.chosun.com/rss/column.xml&api_key=bz2svcxkn5d3bta7sty7cwzi0cdinpnomn9o5nle",
					dataType : "json",
					data : {
						url : "http://health.chosun.com/rss/column.xml",
						api_key : "bz2svcxkn5d3bta7sty7cwzi0cdinpnomn9o5nle",
						count : 30
					},
					success : function(result) {
						for (var i = 0; i < 30; i++) {
							var title = result.items[i].title;
							var link = result.items[i].link;
							var img = result.items[i].thumbnail;
							$.ajax({
								url : "infoInsertLife.jsp",
								data : {
									"title" : title,
									"link" : link
								},
								success : function() {
									alert("성공");
								}
							})
						}
					}
				})
	})
</script>
</head>
<body>
	<jsp:useBean id="dto" class="bean.InfoDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="dto" />
	<%
		InfoDAO dao = new InfoDAO();
		dao.insert(dto);
	%>
</body>
</html>