<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String context = request.getContextPath();
%>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
    var contextPath='${pageContext.request.contextPath}';
	var src='${pageContext.request.contextPath}/images/';
	var contextPath='${pageContext.request.contextPath}';
	var i=2;
	var str="";
	

<%-- 	function getDeptName(Vdeptno){
		console.log(Vdeptno);
		alert("Vdeptno->"+Vdeptno);
		$.ajax({
			url:"<%=context%>/getDeptName.do",
			data:{deptno : Vdeptno},
			dataType:'text',
			success:function(data){
				alert(".ajax Data"+data);
				$('#deptName').append(data);
			}
		});
	}
 --%>
</script>
</head>
<body>
<h2>회원 정보</h2>
<table>
	<tr><th>사번</th><th>이름</th><th>업무</th>
		<th>부서</th><th>근무지</th></tr>
<c:forEach var="empDept" items="${listEmp}">
	<tr><td>${empDept.empno }</td><td>${empDept.ename }</td>
		<td>${empDept.job }</td><td>${empDept.deptno }</td>
		<td>${empDept.loc }</td></tr>
</c:forEach>
</table>
<%-- 		 	<div id="Dept_name">
					<a href=""><img src="" alt="부서명">${empDept.deptno }</a> 
					<a href=""><span id="deptName" onclick="getDeptName(10)">더 보기</span>
			</div>
	 
 --%>

</body>
</html>