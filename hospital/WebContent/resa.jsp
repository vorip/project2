<%@page import="bean.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>키워드로 장소검색하기</title>
<link rel="stylesheet" type="text/css" href="map.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="main.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">
	var markers = [];//버튼 클릭시마다 먼저 마커를 제거하기 위해 마커가 생성될 때 마다 마커를 저장시키기 위해 생성한 배열
	//지도 위에 표시되고 있는 마커를 모두 제거합니다, 검색 이후 먼저 지도에 존재하는 마커들을 지우기 위해 사용하는 메서드
	var hos = "병원";
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}

<%String userName = (String) session.getAttribute("name");
			String userPw = (String) session.getAttribute("password");

			MemberDAO dao = new MemberDAO();
			String address = dao.getAddr(userName, userPw);%>
		var userAddr = "인천광역시 계양구 도두리로52";
	$(function(){
		if('<%=userName%>' != 'null'){
			userAddr = '<%=address%>';
			ps.keywordSearch(userAddr+" 병원", placesSearchCB);
		}else{}
	})
	$(function() {
		$("button").click(function() {
			$(this).each(function() {
				removeMarker();
				markers = [];//마커의 배열 초기화
				
				hos = $(this).val();
				
				var search = userAddr+" "+hos;
				
				ps.keywordSearch(search, placesSearchCB);
				
				alert($(this).text()+"검색 완료!");
			})
		})
	});
	function yeyak() {
		$(function(){
			$(document).ready();
			var data = $("#name").text()+","+$("#address").text()+","+$("#tel").text()+","+hos;
			/* $("#submitdata").val(data); */
			$(document).ready();
			location.href = "resa3.jsp?data="+data;
		});
	}
</script>
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
			String name = (String) session.getAttribute("name");
			String pw = (String) session.getAttribute("password");
			if (name == null) {
		%>
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="login.jsp">로그인</a></li>
			<li class="nav-item"><a class="nav-link" href="signUp.jsp">회원가입</a></li>
		</ul>
		<%
			} else {
		%>
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="logout.jsp">로그아웃</a></li>
		</ul>
		<%
			}
		%>
	</nav>
	<div style="position: absolute; top: 70%; left: 50%; transform: translate(-50%, -50%);">
	<h3 align="left" >예약병원 선택</h3>
	<!-- 지도를 표시할 div  -->
	<div id="map"
		style="width: 500px; height: 500px;"></div>
</div>
	<!-- 검색 키워드를 다르게 하기 위한 버튼 만들기 -->
	<div style="height:100px; margin-top:50px; position: absolute; top: 100%; left: 50%; transform: translate(-50%, -50%);">
	<button type="button" class="btn btn-outline-success" value="정형외과">정형외과</button>
	<button type="button" class="btn btn-outline-success" value="내과">내과</button>
	<button type="button" class="btn btn-outline-success" value="이비인후과">이비인후과</button>
	<button type="button" class="btn btn-outline-success" value="치과">치과</button>
	<button type="button" class="btn btn-outline-success" value="피부과">피부과</button>
	<button type="button" class="btn btn-outline-success" value="병원">종합병원</button>
</div>
	<!-- 지도 스크립트  시작-->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=73c7dffaba233eab31cd664273039896&libraries=services"></script>
	<script>
		//커스텀오버레이 객체생성
		var customOverlay = new kakao.maps.CustomOverlay({
		    map: map,
		    clickable: true,
		});
	
		//장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();
<!-- 1. 지도 생성 부분 -->


		var mapContainer = document.getElementById('map'), // mapContainer 변수에 body안의 id가 map인 div의 엘리먼트 저장
		
		mapOption = {//지도의 설정
		    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		    draggable: false,//지도의 이동을 막기 위한 옵션값
		    level: 3 // 지도의 확대 레벨
		};
		
		//map이라는 이름의 변수를 만들어 지도 객체 생성 파라미터로 지도를 넣을 div의 엘리먼트와 지도의 값을 넣는다.
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		
<!-- 1. 지도 생성 부분 -->




<!-- 2. 지도의 초기 중심좌표값을 받아온 주소를 통해 변경 -->




		var geocoder = new kakao.maps.services.Geocoder();//주소를 좌표로 변환하기 위한 객체 생성

		// 주소로 좌표를 검색하기 위한 메소드
		geocoder.addressSearch(userAddr, function(result, status) {//메소드 안에 익명함수 선언과 동시에 실행

		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {

		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    


		
		
<!-- 2. 지도의 초기 중심좌표값을  받아온 주소를 통해 변경 -->




<!-- 3. 예약 화면에 들어갔을 때 처음에 전체 병원검색이 되도록 수정  -->

	
		 
		
		
		// 키워드로 장소를 검색합니다
		ps.keywordSearch(userAddr+" "+hos, placesSearchCB);//초기에는 집 근처의 모든 병원 검색을 위해
		
		// 키워드 검색 완료시 호출됨
		function placesSearchCB (data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        var bounds = new kakao.maps.LatLngBounds();

		        for (var i=0; i<data.length; i++) {
		            displayMarker(data[i]);//마커생성메소드    
		          	//지도범위 재설정을 위해 bounds에 좌표값 저장
		            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
		        }       

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		        map.setBounds(bounds);
		    } 
		}
		


<!-- 3. 예약 화면에 들어갔을 때 처음에 전체 병원검색이 되도록 수정  -->








<!-- 5. 마커 생성과 지도에 마커 표시  -->
		

		//지도에 마커를 표시하는 함수입니다

		function displayMarker(place) {
    
    		// 마커를 생성하고 지도에 표시합니다
   			var marker = new kakao.maps.Marker({
        		map: map,//마커가 추가될 지도 지정
        		position: new kakao.maps.LatLng(place.y, place.x)//마커의 위치.
    		});
    		markers.push(marker);//마커의 배열에 생성한 마커의 정보를 저장. push메소드는 배열의 맨 끝에 파라미터 값을 저장하는 메소드
   		    kakao.maps.event.addListener(marker, 'click', function() {
   		    	<!-- 4. 인포윈도우 대신 정보를 띄워줄  커스텀 오버레이 생성  -->
   		    	var content = '<div class="placeinfo">' +
                '   <a onclick = "yeyak()" id="name" class="title" ' + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

				if (place.road_address_name) {//주소값을 판별하는 조건식
				    content += '    <span id="address" title="' + place.road_address_name + '>' + place.road_address_name + '</span>' +
				                '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
				}  else {
				    content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
				}                
				
				content += '    <span class="tel" id="tel">' + place.phone + '</span>' + 
				            '</div>' + 
				            '<div class="after"></div>';//content는 커스텀오버레이에 들어갈 정보들
				customOverlay.setContent(content);//커스텀오버레이에 컨텐츠 추가
				customOverlay.setPosition(new daum.maps.LatLng(place.y+10, place.x));//커스텀 오버레이의 위치값 지정
				customOverlay.setMap(map);
   		   		
   		   		<!-- 4. 인포윈도우 대신 정보를 띄워줄  커스텀 오버레이 생성  -->
   		    });

		}
		



<!-- 5. 마커 생성과 지도에 마커 표시  -->

	</script>
	<!-- 지도 스크립트 끝 -->
		
</body>
</html>