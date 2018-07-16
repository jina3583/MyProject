<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ff233eff984c58609e08ddb80cdb3f42&libraries=services"></script>

<style type="text/css">

#top { 
	color:white;
	background-image: url('resources/image/back.JPG');
}
table {text-align: center;}
#content { margin-left: 200px;}
span {
    font-size: 0.8em;
    /* width: 1em;
    border-radius: 5em;
    padding: .1em  .2em;
    line-height: 1.25em; */
    height: 3em;
    width: 3em;
    border-radius: 1.5em;
    padding: .1em  .2em;
    line-height: 3em;
    border: 1px solid #00006D;
    background: #00006D;
    color: white;
    display: inline-block;
    text-align: center;
  }
</style>

<script type="text/javascript">
	 /* var apply;
	function apply() {
		apply=confirm("스터디 신청하겠습니까?");
		if(apply==true){
			location.href('apply.do?m_id=${m_id }&s_num=${list.s_num}&s_subject=${s_subject }');
			alert("스터디를 신청하였습니다.");
			//location.reload(true);
		}else{
			alert("취소되었습니다.");
			location.reload(true);
		}
		
	}  */
</script>


<script type="text/javascript">

function over() {
	
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 9 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

 
// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places(); 

// 키워드로 장소를 검색합니다
//ps.keywordSearch('강남역 토즈', placesSearchCB);
//ps.keywordSearch('강남역 토즈', placesSearchCB);

 var list= new Array();
<c:forEach items="${place_list}" var="place">
	list.push("${place.s_place}");
	console.log("${place.s_place}");
</c:forEach>

for(var i=0; i<list.length; i++){
	ps.keywordSearch(list[i], placesSearchCB);
}
 

/* ps.keywordSearch({'${place_list}': placesSearchCB}); 
var address='${place_list}';
ps.keywordSearch({address: placesSearchCB}); */


//키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new daum.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        //map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new daum.maps.Marker({
        map: map,
        position: new daum.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    daum.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
   }

}

</script>
</head>
<body>
<div id="top">

	<div style="float: right; margin-top: 30px; margin-right: 50px;">
		<a href="license.do?m_id=${m_id }&s_subject=자격증" style="text-decoration: none; color: white;">자격증</a>
		<a href="license.do?m_id=${m_id }&s_subject=면접" style="text-decoration: none; margin-left: 30px; color: white;">면접</a>
		<a href="license.do?m_id=${m_id }&s_subject=인적성" style="text-decoration: none; margin-left: 30px; color: white;">인적성</a><br>
	</div>
	<br>
	<div style="text-align: center; font-size: 55px; margin-top: 170px;">
		To join together to do <br> something with one heart.
	</div>
		<div id="map" onclick="over(); this.onclick=null;" style="opacity:0.8; width:100%; height:300px; text-align: center;">위치로 보기</div>

</div>
<div>
	<button type="button" onclick="location.href='openStudyForm.do?m_id=${m_id }&s_subject=${s_subject}'" style="margin-left: 700px; margin-top: 30px; border: none; background: #342FC7; color: white; padding: 8px;">스터디 개설하기</button>
	
	<form action="license.do">	
		<input type="hidden" name="s_subject" value="${s_subject }">
		<input type="text" name="keyword" placeholder=" 스터티명/스터디 장소를 입력하세요" style="margin-left: 1150px; width:230px; padding: 5px;">	
		<input type="submit" value="검색" style="padding: 6px; border: none; background: #342FC7; color: white; " >
	</form>
</div>		
<%-- 		<span style="margin-left: 1200px; "><input type="button" value="개설하기" onclick="location.href='openStudyForm.do?m_id=${m_id }&s_subject=${s_subject}'"><br></span>	
 --%>	
	
	
	<br>
	<div id="content">
		<c:if test="${keyword!=null }">
			<c:if test="${empty study_list2 }">
				<h2><p style="margin-left: 370px;">검색결과가 없습니다.</p></h2>
			</c:if>
			<c:forEach var="list2" items="${study_list2 }">
			<table id="tb" style="float: left; margin-left: 100px;" >
				<tr>	
					<td>${list2.s_leader }</td>
				</tr>
				<tr>
					<td>${list2.s_date }</td>
				</tr>
				<tr>
					<td>${list2.s_place }</td>
				</tr>
				<tr>
					<td>${list2.s_name }</td>
				</tr>
				<tr>
					<td>${list2.s_coment }</td>
				</tr>
				<%-- <tr>
					<td>인원 ${list.s_person }</td>
				</tr> --%>
				<tr>
					<td>신청현황 ${list2.s_limit}/${list2.s_person }</td>
				</tr>
				<tr>
					<!-- <td><input type="button" onclick="apply();" value="신청하기" ></td> -->
					<td>
						<c:if test="${list2.s_person==list2.s_limit }">
							<input type="button" value="신청마감" disabled="disabled" style="border: none; background: #8C8C8C; color: white; padding: 5px;">
						</c:if>
						<c:if test="${list2.s_person!=list2.s_limit }">
							<input type="button" onclick="location.href='apply.do?m_id=${m_id }&s_num=${list2.s_num}&s_subject=${s_subject }'" value="신청하기" style="border: none; background: #342FC7; color: white; padding: 5px;">
						</c:if>
					</td>
				</tr>
			</table>
			
		</c:forEach>
		</c:if>
		
			
		<c:forEach var="list" items="${study_list }"> 
		<%-- <c:forEach var="list" items="${study_list2 }"> --%>
			<table id="tb" style=" border: 1px solid #00006D; float: left; margin-left: 100px;" >
				<tr>	
					<td><h2 style="text-align: center; background: #342FC7; color: white;">${list.s_name }</h2></td>
				</tr>
				<tr>
					<td># ${list.s_date.substring(0,10)} ~ ${list.s_date2.substring(0,10) }</td>
				</tr>
				<tr>
					<td>#
						<c:forEach var="day" items="${list.s_meetday }">
							 ${day }
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td># ${list.s_meethour }</td>
				</tr>
				<tr>
					<td>#인원 ${list.s_person } 명</td>
				</tr>
				<tr>
					<td># ${list.s_place }</td>
				</tr>
				<tr>
					<td>${list.s_coment }</td>
				</tr>
				<tr>
					<td>
						<c:if test="${list.s_person==list.s_limit }">
							<span>${list.s_leader }</span><input type="button" value="신청마감" disabled="disabled" style="border: none; background: #8C8C8C; color: white; padding: 5px; margin-left:30px;">
						</c:if>
						<c:if test="${list.s_person!=list.s_limit }">
							<span>${list.s_leader }</span><input type="button" value="신청하기" style="border: none; background: #342FC7; color: white; padding: 5px; margin-left:30px;" onclick="location.href='apply.do?m_id=${m_id }&s_num=${list.s_num}&s_subject=${s_subject}'">
						</c:if>
					</td>
				</tr>
			</table>
		</c:forEach>
		
		<%-- <c:forEach var="list" items="${study_list }"> 
		<c:forEach var="list" items="${study_list2 }">
			<table id="tb" style="float: left; margin-left: 100px;" >
				<tr>	
					<td>${list.s_leader }</td>
				</tr>
				<tr>
					<td>${list.s_date.substring(0,10)} ~ ${list.s_date2.substring(0,10) }</td>
				</tr>
				<tr>
					<td>
						<c:forEach var="day" items="${list.s_meetday }">
							${day }
						</c:forEach>
						| ${list.s_meethour }
					</td>
				</tr>
				<tr>
					<td>${list.s_meethour }</td>
				</tr>
				<tr>
					<td>${list.s_place }</td>
				</tr>
				<tr>
					<td>${list.s_name }</td>
				</tr>
				<tr>
					<td>${list.s_coment }</td>
				</tr>
				<tr>
					<td>인원 ${list.s_person }</td>
				</tr>
				<tr>
					<td>신청현황 ${list.s_limit}/${list.s_person }</td>
				</tr>
				<tr>
					<td>
						<c:if test="${list.s_person==list.s_limit }">
							<input type="button" value="신청마감" disabled="disabled" style="border: none; background: #8C8C8C; color: white; padding: 5px;">
						</c:if>
						<c:if test="${list.s_person!=list.s_limit }">
							<input type="button" value="신청하기" style="border: none; background: #342FC7; color: white; padding: 5px;" onclick="location.href='apply.do?m_id=${m_id }&s_num=${list.s_num}&s_subject=${s_subject}'">
						</c:if>
					</td>
				</tr>
			</table>
		</c:forEach>
		 --%>
		
		<%-- <table style="border: 2px solid #A09BFF;">
			<tr>
				<td><h3 style="text-align: center;">정보처리기사 실기</h3></td>
			</tr>
			<tr>
				<td># 2018.02.02 ~ 2018.03.01</td>
			</tr>
			<tr>
				<td># 토 일</td>
			</tr>
			<tr>
				<td># 오후 1시 ~ 3시</td>
			</tr>
			<tr>
				<td># 천천동 스타벅스</td>
			</tr>
			<tr>
				<td>실기 같이 준비해요!!</td>
			</tr>
			<tr>
				<td>
				<span>장진아</span>
				<input type="button" value="신청하기" style="margin-left:15px; border: none; background: #342FC7; color: white; padding: 5px;" onclick="location.href='apply.do?m_id=${m_id }&s_num=${list.s_num}&s_subject=${s_subject}'">
				</td>
			</tr>
			
		</table> --%>
		
	</div>
	

</body>
</html>