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
<form action="update.do" method="post">
<input type="hidden" name="empno" value="${emp.empno }">
<table>
		<tr>
			<td>사번</td>
			<td>${emp.empno }</td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="ename" required="required" value="${emp.ename }" ></td>
		</tr>
		<tr>
			<td>업무</td>
			<td><input type="text" name="job" required="required" value="${emp.job }" ></td>
		</tr>
		<tr>
			<td>급여</td>
			<td><input type="number" name="sal" required="required" value="${emp.sal }" ></td>
		</tr>
		<tr>
			<td>입사일</td>
			<td><input type="date" name="hiredate" required="required" value="${emp.hiredate }" ></td>
		</tr>
		<tr>
			<td>보너스</td>
			<td><input type="number" name="comm" required="required" value="${emp.comm }" ></td>
		</tr>
		<tr>
			<td>관리자사번</td>
			<td><input type="number" name="mgr" required="required" value="${emp.mgr }" ></td>
		</tr>
		<tr>
			<td>부서코드</td>
			<td><input type="number" name="deptno" required="required" value="${emp.deptno }"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="확인"></td>
		</tr>
</table>
</form>
</body>
</html>