<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="myHeader.jsp" %>
<% String context=request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>스터디정보 리스트</h2>
 	<a href="<%=context%>/list_job.do">면접</a> 			<!-- 링크로 해보고, Ajax 로도 해보기 -->
 	<a href="<%=context%>/list_license.do">자격증</a>
 	<a href="<%=context%>/list_contest.do">NCS</a>
 	
<table>

	<tr>
		<th>스터디분류</th>
		<th>스터디이름</th>
		<th>모임날짜</th>
		<th>스터디인원</th>
		<th>스터디장소</th>
		<th>스터디장</th>
	</tr>

	<c:forEach var="list" items="${list}">
		<tr>
			<td>${list.s_subject }</td>
			<td>${list.s_name }</td>
			<td>${list.s_date }</td>
			<td>${list.s_person }</td>
			<td>${list.s_place }</td>
			<td>${list.s_leader }</td>
		</tr>
	</c:forEach>
</table>


</body>
</html>