<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#yeyakButton").click(function() {//예약 정보 중 날짜와 시간과 담당의를 모두 선택해서 예약버튼을 누르도록 유도하는 메서드
		if($("#yeyakDay").val()=="날짜"){
			alert("날짜를 선택해주세요!!")
			return false;
		}else{
			if($("#yeyakHour").val()=="시간"){
				alert("시간를 선택해주세요!!")
				return false;
			}else{
				if($("#doctor").val()=="담당의"){
					alert("담당의를 선택해주세요!!")
					return false;
				}else{
					alert("예약에 성공하셨습니다.");
				}
			}
		}
	})
})
</script>
<style type="text/css">
#div {
	position: relative;
	left: 455px;
	top: -46px;
	font-size: 12px;
}

#png5 {
	position: relative;
	left: -243px;
	top: -83px;
}

#top10 {
	position: relative;
	left: 110px;
	top: -20px;
}

#top10_0 {
	position: relative;
	left: 110px;
	top: -10px;
}

#top10_1 {
	position: relative;
	top: 7px;
	left: 110px;
}

.top10_2 {
	position: relative;
	top: 19px;
	left: 110px;
}

#top10_2 {
	left: 110px;
}

#top10_3 {
	position: relative;
	top: -87px;
	left: 110px;
}
</style>
</head>

<body>
	<%
		String[] hospitalInfo = request.getParameter("data").split(",");
		String address = hospitalInfo[1].substring(5, hospitalInfo[1].length() - 1);
		String hosType = hospitalInfo[3];
		String[] doctors = {"Dr.Choi","Dr.Lee","Dr.Park","Dr.Jung","Dr.Min","Dr.Hong","Dr.Jun"};
		Calendar cal = Calendar.getInstance();
		String today;
		String str = (cal.get(Calendar.YEAR) + "");
		today = str + "." + (cal.get(Calendar.MONTH) + 1) + "." + cal.get(Calendar.DATE);
		int day = cal.get(Calendar.DATE);
		int endDay = 0;
		switch (cal.get(Calendar.MONTH)) {
		case 3:
		case 5:
		case 8:
		case 10:
			endDay = 30;
			break;
		case 1:
			endDay = 28;
			break;
		default:
			endDay = 31;
			break;
		}
		int[] yeyakDay = new int[endDay - day];
		int[] yeyakHour = { 9, 10, 11, 12, 13, 14, 15, 16, 17 };
		boolean key = true;
		if(session.getAttribute("name")==null){
			key = false;
		}else{
			key = true;
		}
	%>
	<div
		style="display: block; margin-left: auto; margin-right: auto; width: 750px; height: 1000px; margin-top: 140px;">
		<div
			style="width: 750px; height: 240px; padding-top: 50px; padding-bottom: 10px;">
			<h1 align="center" style="padding-top: 30px;"><%=hospitalInfo[0]%></h1>
			<div style="background: white;">
				<center>
					<table>
						<tr>
							<td align="center">정형외과</td>
							<td align="center" style="padding-left: 8px; padding-right: 8px;">|</td>
							<td align="center">평점</td>
							<td align="center" style="padding-left: 8px; padding-right: 8px;">|</td>
							<td align="center">리뷰</td>
						</tr>
					</table>
				</center>
				<center>
					<table style="padding-top: 15px;">
						<tr>
							<td align="center"><a href=""><img src="yeyakimg/1.png"></a></td>
							<td align="center"
								style="padding-left: 25px; padding-right: 25px;"><a href=""><img
									src="yeyakimg/2.png"></a></td>
							<td align="center"><a href=""><img src="yeyakimg/3.png"></a></td>
							<td align="center" style="padding-left: 25px;"><a href=""><img
									src="yeyakimg/4.png"></a></td>
						</tr>
					</table>
				</center>
			</div>
			<hr color="gray">
			<div style="height: 258px;">

				<h3 id="top10_0" style="padding-top: 35px;">상세정보</h3>
				<div id="div" style="color: gray;">
					<span>업데이트 <%=today%></span><span
						style="padding-left: 7px; padding-right: 7px;">|</span><span><a
						style="color: gray;" href="">틀린정보 신고</a></span>
				</div>
				<span id="top10"><%=address%></span><br> <a id="top10_1"
					href="http://mgr.kgitbank.com">http://mgr.kgitbank.com</a><br>
				<span class="top10_2"><%=hospitalInfo[2]%></span><span
					class="top10_2" style="color: gray; padding-left: 8px;"
					id="top10_2">대표번호</span><br> <span id="top10_3">깨끗한 시설과
					국내 최고의 의료진 상시 대기</span> <a href="" id="png5"><img src="yeyakimg/5.png"></a>
			</div>
			<hr color="gray">
			<center>
				<div>
					<form action="yeyak.jsp">
						<%
						if(key){ %>
						
						<h3>예약</h3>
						<span>예약자 : <%= (String)session.getAttribute("name") %></span>
						<input id="name" name="name" type="hidden" value = "<%= (String)session.getAttribute("name") %>"><br> 
						<span>병원 : <%= hospitalInfo[0] %></span> 
						<input id="hospital" name="hospital" type="hidden" value="<%=hospitalInfo[0]%>" ><br>
						<span>주소 : <%= address %></span>
						<input id="address" name="address" type="hidden"	value="<%= address %>" ><br>
						<% if(hosType.equals("병원")||hosType.equals("종합병원")){
							%>
						진료과목 : 
							<select name = "body">
								<option>정형외과</option>
								<option>내과</option>
								<option>피부과</option>
								<option>이비인후과</option>
								<option>치과</option>
							</select><br>
						
						<% }else{%>
						
						<span>진료과목 : <%= hosType %> </span> 
						<input id="body" name="body" type="hidden" value="<%= hosType %>" ><br>
						<% } %>
						담당의 : <select id="doctor" name="doctor">
							<option>담당의</option>
							<%
								for(int i=0;i<doctors.length;i++){
									if(i==cal.get(Calendar.DAY_OF_WEEK)-1){
										continue;
									}else{%>
										<option value="<%= doctors[i] %>"><%= doctors[i] %></option>
									<%}
								}
							%>
						</select><br>
						날짜 : <select id="yeyakDay" name="day">
							<option>날짜</option>
							<%
								for (int i = 0; i < yeyakDay.length; i++) {
										yeyakDay[i] = day + i + 1;
							%>
							<option value="<%=yeyakDay[i]%>"><%=yeyakDay[i]%>일
							</option>
							<%
								}
							%>
						</select><br>
						 시간 : <select id="yeyakHour" name="hour"><br>
							<option>시간</option>
							<%
								for (int i = 0; i < yeyakHour.length; i++) {
							%>
							<option value="<%=yeyakHour[i]%>"><%=yeyakHour[i]%>시
							</option>
							<%
								}
						%>
						</select><br>
						 가격 : <input id="price" name="price" type="text" value="5000" readonly="readonly"><br>
						<input type = "hidden" value="<%= (String)session.getAttribute("password") %>" name = "pw" readonly="readonly">
						<button id="yeyakButton" type="submit">예약</button>
						<% }else{
							%>
							<h3>예약을 위해서는 로그인이 필요합니다.</h3>
							<%} %>
					</form>
				</div>
			</center>
		</div>
	</div>

</body>

</html>