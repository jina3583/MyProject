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
	         <th>��ȣ</th>
	         <th>����</th>
	         <th>�ۼ���</th>
	         <th>�����</th>
	         <th>��ȸ��</th>
	      </tr>
	      <c:forEach items="${list}" var="board">
	         <tr>
	            <td>${board.tnum }</td>
	            <td><a href="read.do?tnum=${board.tnum }">${board.ttitle }</a></td>
	            <td>${board.tadmin }</td>
	            <td>${board.tdate }</td>
	            <td>${board.thit }</td>
	         </tr>
	      </c:forEach>
	   </table>
	   <div id="write">
	      <a href="write.do">�ۼ��ϱ�</a>
	   </div>
	   <br>
	   <div id="read">
	      <a href="read.do">�о����</a>
	   </div>
</body>
</html>