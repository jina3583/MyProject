<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {text-align: center;width: 80%;}
	th { background: #E7E7E7;}
	#top {text-align: center;}
	#search{
		background: #00A500; 
		color:white;
		padding:5px;
	}
	#write{ 
		text-align: center;
		margin: auto;
	}
	body{text-align: center;}
</style>
</head>
<body>

	<form action="board_list.do">	
		<input type="text" name="keyword" placeholder="검색어를 입력하세요" style="margin-left: 1150px; margin-top:50px; width:230px; padding: 5px;">	
		<input type="submit" value="검색" style="padding: 6px; border: none; background: #342FC7; color: white; " >
	</form>
	
	<table border="1" style="margin-top: 50px; margin-left:150px; text-align: center;">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${board_list }" var="list">
			<tr>
				<td>${list.tnum }</td>
				<td><a href="content.do?tnum=${list.tnum }">${list.ttitle }</a></td>
				<td>${list.tadmin }</td>
				<td>${list.tdate }</td>
				<td>${list.thit }</td>
			</tr>
		</c:forEach>
	</table>
	<div id="write">
		<a href="write.do">작성하기</a>
	</div>
</body>
</html>