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
	         <th>����</th>
	         <th>�����</th>
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
	      <a href="write.do">�ۼ��ϱ�</a>
	   </div>
	   <br>
	   <div id="home">
	      <a href="Board_list.do">Ȩ����</a>
	   </div>
</body>
</html>