<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>장애인 콜택시</h2>
<div id="map" style="width:40%;height:700px; float: left;"></div>
<br><br><br><br><br><br>
<h2>운행지역</h2>
<h2>
서울시 전역<br>
예외적 운행지역 : 서울시 인접 12개 市 및 인천국제공항<br>
※ 12개 市 : 부천, 김포, 양주, 고양, 의정부, 남양주, 구리, 하남, 과천, 안양, 광명, 성남<br>
서울시 인접 12개시 외 수도권지역은 진료 및 치료목적으로 이동하는 경우만 이용이 가능하며, 진료예약증, 입원예정서(입원확인서) 등 사전에 콜센터 승인 필요
</h2>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ff233eff984c58609e08ddb80cdb3f42"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(37.5665350, 126.9779690), // 지도의 중심좌표
        level: 10 // 지도의 확대 레벨
    };

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new daum.maps.Map(mapContainer, mapOption); 

//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
var positions = [
    {
        content: '<div>서울 전지역</div>', 
        latlng: new daum.maps.LatLng(37.5665350, 126.9779690)
    },
    {
        content: '<div>부천</div>', 
        latlng: new daum.maps.LatLng(37.5034140, 126.7660310)
    },
    {
        content: '<div>김포</div>', 
        latlng: new daum.maps.LatLng(37.6152460, 126.7156320)
    },
    {
        content: '<div>양주</div>',
        latlng: new daum.maps.LatLng(37.7852880, 127.0458450)
    },
    {
        content: '<div>고양</div>', 
        latlng: new daum.maps.LatLng(37.6583600, 126.8320200)
    },
    {
        content: '<div>의정부</div>',
        latlng: new daum.maps.LatLng(37.7380980, 127.0336820)
    },
    {
        content: '<div>남양주</div>', 
        latlng: new daum.maps.LatLng(37.6360030, 127.2165280)
    },
    {
        content: '<div>구리</div>',
        latlng: new daum.maps.LatLng(37.5943120, 127.1295650)
    },
    {
        content: '<div>하남</div>', 
        latlng: new daum.maps.LatLng(37.5392650, 127.2148920)
    },
    {
        content: '<div>과천</div>',
        latlng: new daum.maps.LatLng(37.4292460, 126.9874450)
    },
    {
        content: '<div>안양</div>', 
        latlng: new daum.maps.LatLng(37.3942530, 126.9568210)
    },
    {
        content: '<div>광명</div>',
        latlng: new daum.maps.LatLng(37.4784880, 126.8642890)
    },
    {
        content: '<div>성남</div>',
        latlng: new daum.maps.LatLng(37.4449170, 127.1388680)
    }
];

for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new daum.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng // 마커의 위치
    });

    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new daum.maps.InfoWindow({
        content: positions[i].content // 인포윈도우에 표시할 내용
    });

    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    daum.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));
    daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
}

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}


</script>

<!-- 번역 코드 START-->
<div id="google_translate_element"></div><script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'ko', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
}
</script><script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
<!-- 번역 코드 END --> 

</body>
</html>