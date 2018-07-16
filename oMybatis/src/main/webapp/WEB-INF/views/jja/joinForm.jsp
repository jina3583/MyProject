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
	
	<h2>회원가입 화면</h2>
	
	<form action="join.do">
	아이디: <input type="text" name="id" required="required" maxlength="10">
	<input type="button" value="중복확인"> <br>
	비밀번호: <input type="password" name="pw" required="required" maxlength="15"> <br>
	비밀번호 확인: <input type="password" name="pw2" required="required" maxlength="15"><br>
	이름: <input type="text" name="name" required="required" > <br>
	나이: <input type="number" name="age" required="required"> <br>
	전화번호: <input type="text" name="tel"><br>
	주소: <input type="text" name="address"><br>
	이메일: <input type="email" name="email"><br>
	카카오아이디: <input type="text" name="kakao_id"><br>
	스터디유무: <input type="text" name="study_ox" value="o"><br>
	<input type="submit" value="가입하기">
	</form>
	
	
</body>
</html>