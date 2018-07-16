<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#title {color: red;}
	h2 {text-align: center;}
</style>
</head>
<body>
	<h2><u>공지사항</u></h2>
	<br>
	<span style="color: gray;">
	공고 및 공지는 서울주택도시공사에서 시행하는 
	각종 분양, 임대, 청약, 보상, 이주, 설계 등의 대내외 공개가 필요한 사항들에 대해 고객 여러분께 알려드리는 곳입니다.<br><br><br><br>
	</span>
	<div id="title">${content.ttitle }</div>
	<br><br><br>
	<hr>
	첨부파일
	<hr>
	<br>
	${content.tcontent }
		
</body>
</html>