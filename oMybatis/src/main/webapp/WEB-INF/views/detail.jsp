<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>직원 정보</h2>
<table>
		<tr>
			<td>사번</td>
			<td>${emp.empno }</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${emp.ename }</td>
		</tr>
		<tr>
			<td>업무</td>
			<td>${emp.job }</td>
		</tr>
		<tr>
			<td>급여</td>
			<td>${emp.sal }</td>
		</tr>
		<tr>
			<td>입사일</td>
			<td>${emp.hiredate }</td>
		</tr>
		<tr>
			<td>보너스</td>
			<td>${emp.comm }</td>
		</tr>
		<tr>
			<td>관리자사번</td>
			<td>${emp.mgr }</td>
		</tr>
		<tr>
			<td>부서코드</td>
			<td>${emp.deptno }</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="목록" onclick="location.href='list.do'">
				<input type="button" value="수정" onclick="location.href='updateForm.do?empno=${emp.empno}'">
				<input type="button" value="삭제" onclick="location.href='delete.do?empno=${emp.empno}'">
			</td>
		</tr>
</table>

</body>
</html>