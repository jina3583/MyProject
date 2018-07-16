<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table border="1" style="margin-top: 50px; margin-left:150px; text-align: center;">
	      <tr>
	         <th>번호</th>
	         <th>제목</th>
	         <th>작성자</th>
	         <th>내용</th>
	         <th>등록일</th>
	      </tr>
	         <tr>
	            <td>${list.tnum }</td>
	            <td><a href="content.do?tnum=${list.tnum }">${list.ttitle }</a></td>
	            <td>${list.tadmin }</td>
	            <td>${list.tcontent }</td>
	            <td>${list.tdate }</td>
	         </tr>
	   </table>
	   <div id="write">
	      <a href="write.do">작성하기</a>
	   </div>
	   <br>
	   <div id="home">
	      <a href="Board_list.do">홈으로</a>
	   </div>
</body>
</html>