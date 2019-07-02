<%@page import="bean.MemberDAO"%>
<%@page import="bean.ResaDTO"%>
<%@page import="bean.ResaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="main.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
		var comArray = [];
		var comNameArray = [];
		var comTimeArray = [];
<%
	String name = (String)session.getAttribute("name");
String nonum = "";
%>
	$(function(){
		//댓글 불러오는 ajax
		var alComment = $("#alComment").val().split(":");
		var alCommentName = $("#alCommentName").val().split(":");
		var alCommentTime = $("#alCommentTime").val().split(":");
		var count = 0;
		$("#count").val(count+"");
		for (var i = 0; i < alComment.length; i++) {
			if(i!=0){
			$("#commentUl").append('<li style = "padding-top : 15px; padding-bottom: 10px;" class="deleteCom"><table><tr><td class="cName">'+alCommentName[i]+'</td><td class="cTime">'+alCommentTime[i]+'</td><td><input type = "hidden" class="index" value="'+count+""+'"><button type="button" class="exBtn">삭제</button></td></tr><tr><td class="cCom">'+alComment[i]+'</td></tr></table></li>');
			count++;
			}
		}
			$("#commentVal").val($("#alComment").val());
			$("#commentN").val($("#alCommentName").val());
			$("#commentT").val($("#alCommentTime").val());
			comArray = $("#commentVal").val().split(":");
			comNameArray = $("#commentN").val().split(":");
			comTimeArray = $("#commentT").val().split(":");
		//댓글 추가하는 이벤트와 메소드
		$("#comment").click(function (){
			var myName = '<%= name %>';
			if(myName!="null"){
				//댓글 달았을 떄의 시간
				var date = new Date();
				var toMonth = date.getMonth()+1;
				if(toMonth<10){
					toMonth= "0"+toMonth;
				}else{
					toMonth +="";
				}
				var comTi = (date.getFullYear()+"").substring(2)+"."+toMonth+"."+date.getDate()+". "+date.getHours()+"."+date.getMinutes();
				//--
				var com = $("#commentCon").val();
				var com1 = $("#commentVal").val();
				var com2 = $("#commentN").val();
				var com3 = $("#commentT").val();
				if(com!=""){
					$("#commentUl").append('<li style = "padding-top : 15px; padding-bottom: 10px;" class="deleteCom"><table><tr><td class="cName">'+myName+'</td><td class="cTime">'+comTi+'</td><td><input type = "hidden" class="index" value="'+count+""+'"><button type = "button" class="exBtn">삭제</button></td></tr><tr><td class="cCom">'+com+'</td></tr></table></li>');
					count++;
					$("#count").val(count+"");
					if(com1!=""){
						$("#commentVal").val(com1+":"+com);
						$("#commentN").val(com2+":"+myName);
						$("#commentT").val(com3+":"+comTi);
						$(document).ready();
					}else{
						$("#commentVal").val(com);
						$("#commentN").val(myName);
						$("#commentT").val(comTi);
						$(document).ready();
					}
					var comment = $("#commentVal").val();
					var commentName = $("#commentN").val();
					var commentTime = $("#commentT").val();
					comArray = comment.split(":");
					comNameArray = commentName.split(":");
					comTimeArray = commentTime.split(":");
					var content = $("#content").text();
					var time = $("#time").text();
					var name = $("#name").text();
					var title = $("#title").text();
					var infoS = $("#infoS").val();
					var nonum = <%= nonum %>
						$.ajax({
						url : "commentAdd.jsp",
						data :{
							"info" : infoS,
							"comment" : comment,
							"commentName" : commentName,
							"commentTime" : commentTime,
							"nonum" : nonum
						},
						success:function (result){
							$("#commentCon").val("");
							location.href="post2.jsp?info="+result;
						}
					})
				}
			
			}else{
				alert("로그인을 해주세요");
				$("#commentCon").val("");
			}
		});
		$(".exBtn").click(function() {
			$(this).each(function() {
			var index = $(this).prev().val()*1;
			var cName = comNameArray[index+1]; //작성자 배열
			var name123 = '<%=name%>'
			if(name123== cName){
			/* alert($("#commentVal").val());//현재 달려있는 전체 댓글의 내용
			alert($("#commentN").val());//현재 달려있는 전체 댓글의 작성자
			alert($("#commentT").val());//현재 달려있는 전체 댓글의 시간 */	
			var cCom = comArray[index+1]; //+1이 임의로 넣은값 다음부터 내용배열
			var cTime = comTimeArray[index+1]; //작성날짜 배열
			var comment = $("#commentVal").val().substring(6); //전체 댓글내용에서 nocom:를 뺀 나머지 댓글을 저장
			var commentName = $("#commentN").val().substring(9);//전체 댓글내용에서 testuser:를 뺀 나머지 댓글 저장
			var commentTime = $("#commentT").val().substring(6);//전체 댓글내용에서 today:를 뺀 나머지 댓글을 저장
			var commentA = comment.split(":");
			var commentB = commentName.split(":");
			var commentC = commentTime.split(":");
			var commentD = "";
			var commentE = "";
			var commentF = "";
			if(commentA.length==1){
				commentD="noCom";
				commentE="testuser";
				commentF="today";
			}else if(commentA.length>1){
				for(var i = 0;i<=commentA.length;i++){
					if(i==0){//첫번째
						commentD ="noCom:";
						commentE ="testuser:";
						commentF ="today:";
					}else if(1<=i&&i<commentA.length){//중간
						if(index+1==i){
							continue;
						}else{
							commentD +=commentA[i-1]+":";
							commentE +=commentB[i-1]+":";
							commentF +=commentC[i-1]+":";
						}
					}else{//마지막
						if(index+1==i){
							commentD = commentD.substring(0,commentD.length-1);						
							commentE = commentE.substring(0,commentE.length-1);				
							commentF = commentF.substring(0,commentF.length-1);
						}else{
							commentD += commentA[i-1];
							commentE += commentB[i-1];
							commentF += commentC[i-1];
						}
					}
				}
			}
			comment = commentD;
			commentName = commentE;
			commentTime = commentF;
			var content = $("#content").text();
			var time = $("#time").text();
			var name = $("#name").text();
			var title = $("#title").text();
			var infoS = $("#infoS").val();
			var nonum = <%= nonum%>
			$.ajax({
				url : "commentAdd.jsp",
				data : {
					"info" : infoS,
					"comment" : comment,
					"commentName" : commentName,
					"commentTime" : commentTime,
					"nonum" : nonum
				},
				success:function(result){
					location.href="post2.jsp?info="+result;
				}
			})
			 }else{
				alert("본인이 작성한 댓글만 삭제 할 수 있습니다!")
			} 
			})
		})  
	});
</script>
<link href="bootstrap.min.css" rel="stylesheet">
</head>
<body>

<a href="homemain.jsp"><img src="img/logo.jpeg"
		style="width: 300px; height: 150px; text-align: center; display: block; margin: 0px auto;"></a>
	<!-- 상단 메뉴바 -->
	<div id="top">
		<nav id="topMenu">
			<ul>
				<li><a href="homemain.jsp" id="menuLink"><img
						src="img/home2.png" onmouseover="this.src='img/home.png'"
						onmouseout="this.src='img/home2.png'"></a></li>
				<li><a href="my.jsp" id="menuLink"><img src="img/my2.png"
						onmouseover="this.src='img/my.png'"
						onmouseout="this.src='img/my2.png'"></a></li>
				<li><a href="resa.jsp" id="menuLink"><img
						src="img/resa2.png" onmouseover="this.src='img/resa.png'"
						onmouseout="this.src='img/resa2.png'"></a></li>
				<li><a href="notice.jsp?index=0" id="menuLink"><img
						src="img/notice2.png" onmouseover="this.src='img/notice.png'"
						onmouseout="this.src='img/notice2.png'"></a></li>
				<li><a href="notice2.jsp?index=0 " id="menuLink"><img
						src="img/contact2.png" onmouseover="this.src='img/contact.png'"
						onmouseout="this.src='img/contact2.png'"></a></li>
				<li><a href="chart.jsp" id="menuLink"><img
						src="img/chart2.png" onmouseover="this.src='img/chart.jpg'"
						onmouseout="this.src='img/chart2.png'"></a></li>
			</ul>
		</nav>
	</div>
	<br>
	<br>
	<br>
	<br>
	<!-- 로그인 nav바 -->
	<nav
		class="navbar navbar-expand-sm bg-success navbar-dark justify-content-center">
		<%
			String name1 = (String)session.getAttribute("name");
			String pw = (String)session.getAttribute("password");
			if(session.getAttribute("name") == null){
		%>
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="login.jsp">로그인</a></li>
			<li class="nav-item"><a class="nav-link" href="signUp.jsp">회원가입</a></li>
		</ul>
		<%
			}else{
			%>
			<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="logout.jsp">로그아웃</a></li>
			</ul>
		<%	
			}
		%>
	</nav>

		


<!-- 게시글 불러오기  -->
	<%
		String info = request.getParameter("info");
		String[] info2 = info.split(",");
		String[] fonts = info2[5].split(":");
		String any = "";
		if(info2.length>11){
			ResaDAO dao = new ResaDAO();
			nonum = info2[12];
			MemberDAO dao2= new MemberDAO();
			String password = dao2.selectPw(info2[1]); 
			ResaDTO dto = dao.select(info2[1],password);
			if(dto.getDoctor()!=null){
			any = dto.getHospital() + "  |  " + dto.getDoctor();
			}
		}else{
			nonum = info2[10];
			any = "■ 건의사항";
		}
		
	%>
	<input id="infoS" type="hidden" value="<%=info%>">
	<div class = "container" style="display: block; margin-left: auto;margin-right: auto;">
		<div class="row" style="">
        	<div class="col-lg-8 col-md-10 mx-auto">	
				<ul class="list-group list-group-flush">
					 <li class="list-group-item" style="padding-top: 9px; padding-bottom : 9px;">
							<table>
			 					<tr>
			 						<td id = "title" style="font: 17px 굴림; font-weight: bold;"><%= info2[0] %></td>
			 						<td style="padding-left: 10px; padding-right: 10px; font:15px 굴림; color: #a1a1a1;">|</td>
			 						<td style="font: 15px 굴림; padding-left: 10px;"><a style="color: #a1a1a1;" href = "notice2.jsp?index=0"><%= any %></a></td>
			 					</tr>
			 				</table>
					 </li>
					 <li class="list-group-item" style="padding-top: 7px; padding-bottom : 7px;">
			 			<table>
			 				<tr>
			 					<td style="font-size: 13px; padding-right: 10px;">작성자 :</td>
			 					<td id = "name" style="padding: 0px; font-size : 14px"><%= info2[1] %></td>
			 					<td style="font-size: 12px; padding-right: 12px; padding-left: 12px; color: #a1a1a1;">|</td>
			 					<td style="font-size: 13px;padding-right: 20px;">날짜 :</td>
			 					<td id = "time"style="font-size: 14px;"><%= info2[3] %></td>
			 				</tr>
			 			</table>
					 </li>
					 <li class="list-group-item">
					 	<table>
					 		<tr>
					 			<td id = "content"height = "250" style='font-size: <%= fonts[1] %>; font-family: <%= fonts[0] %>;font-weight: <%= fonts[2] %>; text-align: <%= fonts[3] %>;'><%= info2[2] %></td>
					 		</tr>
					 	</table>
					 </li>
				</ul>
				<br>
				<div id="commentDiv"style="padding-top: 20px; padding-bottom: 20px; background: gray; border: 2px; width: 800px; position: relative;">
					<div id = cmtConDiv>
						<ul id="commentUl" type="none">
						</ul>
					</div>
						<input id="commentCon" type ="text" style="width: 600px; height: 60px; margin-left: 60px;">
						<input id="commentVal" type="hidden" value="">
						<input id="commentN" type="hidden" value="">
						<input id="commentT" type="hidden" value="">
						<input type ="hidden" value = "0" id = "count">
						<button id = "comment" style = "height: 60px;">작성완료</button>
						<input id="alComment" type="hidden" value="<%= info2[6] %>">
						<input id="alCommentName" type="hidden" value="<%= info2[7] %>">
						<input id="alCommentTime" type="hidden" value="<%= info2[8] %>">
				</div>
				<form action = "deletePost.jsp">
					<input type = "hidden" name="info" value = "<%= info %>">
					<button type = "submit" class="btn btn-outline-success">삭제</button>
				</form>
				<form action ="updatePost.jsp">
					<input type = "hidden" name ="info"  value="<%= info %>" >
					<button type = "submit" class="btn btn-outline-success">수정</button>
				</form>
			</div>
		</div>
	</div>

</body>
</html>