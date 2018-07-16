<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="myHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>회원정보 리스트</h2>
<form action="search.do" method="get">
	<input type="text" name="keyword"> 
	<input type="submit" name="search" value="검색">
</form>
<!-- 
	select_search = request.getParameter("search"); //카페 이름
	list = pd.partySearch3(select_search); 
	request.setAttribute("list", list);
-->

<table>

	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>나이</th>
		<th>주소</th>
		<th>전화번호</th>
		<th>이메일</th>
		<th>카카오아이디</th>
		<th>스터디유무</th>
		<th>가입날짜</th>
	</tr>
	
	<c:if var="member" test="${member }">
		<tr>
			<td>${member.id }</td>
			<td>${member.name }</td>
			<td>${member.age }</td>
			<td>${member.address }</td>
			<td>${member.tel }</td>
			<td>${member.email }</td>
			<td>${member.kakao_id }</td>
			<td>${member.study_ox }</td>
			<td>${member.reg_date }</td>
		</tr>
	</c:if>
	
	<%-- <c:forEach var="member" items="${memberList }">
		<tr>
			<td>${member.id }</td>
			<td>${member.name }</td>
			<td>${member.age }</td>
			<td>${member.address }</td>
			<td>${member.tel }</td>
			<td>${member.email }</td>
			<td>${member.kakao_id }</td>
			<td>${member.study_ox }</td>
			<td>${member.reg_date }</td>
		</tr>
	</c:forEach> --%>
	
	
	<%-- <tr>
			<td>${result.id }</td>
			<td>${result.name }</td>
			<td>${result.age }</td>
			<td>${result.address }</td>
			<td>${result.tel }</td>
			<td>${result.email }</td>
			<td>${result.kakao_id }</td>
			<td>${result.study_ox }</td>
			<td>${result.reg_date }</td>
	</tr> --%>
</table>


</body>
</html>