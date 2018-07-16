<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="myHeader.jsp" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* #mon,#tue,#wen,#thu,#fri,#sat,#sun { 	
	background-color: white; 
	color: black; 
	border: 2px solid black;
}  <!-- 버튼 테두리 지정 --> */
h2{ 
	text-align: center;
	background: #00006D; 
	color: white;
	margin-bottom: 30px;
}

.simple_table {
    width: 60%;
    border: none;
    border-collapse: separate;
    border-spacing: 2px;
}
 
.simple_table th {
    padding: 15px;
    border: none;
    /* border-left: 5px solid #C03; */
    /* border-left: 10px solid #7E7E7E; */
    border-left: 10px solid #00006D;
    border-bottom: 1px solid #FFF;
    /* background: #C6C6C6; */
    background: #342FC7; 
    font-weight: normal;
    text-align:center;
    text-shadow: 0 1px #FFF;
    vertical-align: middle;
    color: white;
}
 
.simple_table td {
    padding: 15px;
    border: none;
    border-bottom: 1px solid #D8D8D8;
    text-align: left;
    vertical-align: baseline;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript">
 	// 요일 버튼 클릭 이벤트
	 $(document).ready(function() {
		$("#mon").click(function () {
			$("#mon").css('backgroundColor', 'blue' );
			$("#mon").css('color', 'white' );
			$("#mon").val($(this).attr('value'));
			//alert($(this).attr('value'));
		});
	}); 
	 
	 function checkRqDate(){

		 var now = new Date();
		 year = now.getYear();          // 현재 년도 가져오기
		 month = now.getMonth()+1;        // 현재 월 가져오기 (+1)
		 if((month+"").length < 2){         //월이 '7'로 찍히지 않고 '07'로 찍히도록 길이를 받아온다
		      month = "0" +month;         //길이가 1이라면 앞에 0을 붙여서 '07'형태로 나오게 한다
		 }
		date = now.getDate();       // 현재 날짜 가져오기
		 if((date+"").length < 2){         //일이 '7'로 찍히지 않고 '07'로 찍히도록 길이를 받아온다
		  date = "0" +date;           //길이가 1이라면 앞에 0을 붙여서 '07'형태로 나오게 한다
		 }
		 today = year +""+ month +""+ date ;           //오늘 날짜 ex) 20080801

		 

		 var InputDate = document.frmWork.s_name.value;    //입력된 날짜 받아오기
		 var dateSplit = InputDate.split("-");         //입력값을 '-'을 기준으로 나누어 배열에 저장해 주는 함수 split

		 

		 year = dateSplit[0];      //첫번째 배열은 년
		 month = dateSplit[1];  //월
		 day = dateSplit[2];   //일

		 InputDate = year +""+ month +""+ day;       //입력된 값을 더해준다.

		 

		 if (parseInt(InputDate) < parseInt(today) ){          //int형으로 변환하여 비교한다
		      alert("오늘 날짜보다 이전 날짜입니다.");
		      document.frmWork.s_name.value = "";         //이전 날짜라면 입력폼 리셋처리
		 }

		}

	
	
</script>
</head>

<body>
	<h2>스터디 개설하기</h2>

<form action="openStudy.do" method="POST">
	<input type="hidden" name="s_subject" value="${s_subject }">
	<input type="hidden" name="m_id" value="${m_id }">
	<table class="simple_table" style="margin: auto;">
	<tbody>
		<tr>
			<th scope="row">스터디 이름</th>
			<td><input type="text" name="s_name" maxlength="20" required="required"></td>
		</tr>
		<tr>
			<th scope="row">시작 날짜</th>
			<td><input type="date" name="s_date" required="required" onchange="javascript:checkRqDate(this);">~<input type="date" name="s_date2" required="required"></td>
		</tr>
		
		<tr>
			<th scope="row">모임 요일</th>
			<td>
				<label><input type="checkbox" name="s_meetday" id="mon" value="월">월</label>
				<label><input type="checkbox" name="s_meetday" id="tue" value="화">화</label>
				<label><input type="checkbox" name="s_meetday" id="wen" value="수">수</label>
				<label><input type="checkbox" name="s_meetday" id="thu" value="목">목</label>
				<label><input type="checkbox" name="s_meetday" id="fri" value="금">금</label>
				<label><input type="checkbox" name="s_meetday" id="fri" value="토">토</label>
				<label><input type="checkbox" name="s_meetday" id="fri" value="일">일</label>
				<!-- <button type="button" value="월" name="s_meetday" id="mon">월</button>
			    <button type="button" value="화" name="s_meetday" id="tue" onclick="btn2()">화</button>
				<button type="button" value="수" name="s_meetday" id="wen" onclick="btn3()">수</button>
				<button type="button" value="목" name="s_meetday" id="thu" onclick="btn4()">목</button>
				<button type="button" value="금" name="s_meetday" id="fri" onclick="btn5()">금</button>
				<button type="button" value="토" name="s_meetday" id="sat" onclick="btn6()">토</button>
				<button type="button" value="일" name="s_meetday" id="sun" onclick="btn7()">일</button> -->
				<br>
			</td>
		</tr>
		<tr>
			<th scope="row">모임 시간</th>
			<td><input type="text" name="s_meethour" placeholder="오전 10시 or 오후 2시"></td>
		</tr>
		<tr>
			<th scope="row">스터디 장소</th>
			<td><input type="text" name="s_place" required="required"></td>
		</tr>
		<tr>
			<th scope="row">스터디 인원</th>
			<td><input type="number" name="s_person" required="required"></td>
		</tr>
		<tr>	
			<th scope="row">스터디 설명</th>
			<td><textarea rows="5" cols="100" name="s_coment"></textarea></td>
		</tr>
		</tbody>
	</table>
	<input type="submit" value="개설하기" style="text-align: center; margin-left: 700px; border: none; background: #342FC7; color: white; padding: 8px; margin-top: 20px;">
</form>
<h2></h2>

</body>
</html>