<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String context = request.getContextPath();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript">
	var contextPath = '${pageContext.request.contextPath}';
	
	function getDeptName(Vdeptno) {		//부서번호
		console.log(Vdeptno);	//콘솔에 찍어줌
		//alert("Vdeptno->"+Vdeptno);
		$.ajax({
			url:"<%=context%>/getDeptName.do",	
				//경로를 알아서 찾아줌 -> 컨트롤러 호출
			data:{deptno:Vdeptno},
			dataType:'text',
			success:function(data){
							//결과값: dname
				//html은 val, span은 html 로!!			
							
				//alert(".ajax Data"+data);
				$('#deptName').val(data);		//input 태그
				//$('#deptName').text(data);
				//$('#deptName').html(data);	//html로 데이터를 넣을 때 span은 들어가고 input은 안 들어감
				$('#msg').html(data);	// id가 msg인 곳에 뿌려줌
				
				//$('#deptName').val("이미 사용중인 아이디");
			}
		});
	}
	
	//RestController TEST
	function getDept(Vdeptno) {
		console.log(Vdeptno);
		//alert("Vdeptno->"+Vdeptno);
		$.ajax({
			url:"<%=context%>/sample/sendVO2.do",
			data:{deptno:Vdeptno},
			dataType:'json',
			success:function(data){
				//alert(".ajax getdept data"+data);
				str=data.firstName+" "+data.lastName+" "+data.mno;
					// .만 찍으면 값을 사용할 수 있다
				alert(".ajax getDept str"+str);
				$('#RestDept').val(str);	//input 태그
			}
		});
	}
	
	
	function getListDept() {
		str="";
		str2="";
		
		console.log("getListDept Run");
		alert("getListDept Run->");
		$.ajax({
			url:"<%=context%>/sample/sendVO3.do",
			dataType:'json',
			success:function(data){
				//alert(".ajax data"+data);
				//str=data[0].deptno+" "+data[0].dname;
				var jsondata=JSON.stringify(data);	//json형태의 자료로 변환
				alert("jsondata->"+jsondata);
				$('#Dept_list').append(jsondata);
				//$('#Dept_list1').append(data);
				str += "<select name='dept' >";
				$(data).each(	//각각의 로우별로
					function () {
						str2= "<option value='"+this.deptno+"'> "+this.dname+"</option>";
						//str2 = " "+this.deptno+"'"+this.dname+"<br>";
						str+= str2;
						//$('Dept_list').html(this.deptno+this.dname);
						$('#Dept_list3').append(str2);
						//$('#Dept_list3').html(str2);
					});
				$('#Dept_list3').append("</select><p>");
				alert(".ajax str->"+str);
			
			}
		});
	}
	
	
	
</script>

</head>
<body>


<h2>회원 정보</h2>
	<table>
		<tr>
			<th>사번</th>
			<th>이름</th>
			<th>업무</th>
			<th>부서</th>
			<th>근무지</th>
		</tr>
		<c:forEach var="empDept" items="${listEmp}">
			<tr>
				<td>${empDept.empno }</td>
				<td>${empDept.ename }</td>
				<td>${empDept.job }</td>
				<td>${empDept.deptno }<input type="button" id="btn_idCheck"
					value="부서명" onmouseover="getDeptName(${empDept.deptno })">
								<!-- mouse가 올라가면 -->
				</td>
				<td>${empDept.loc }</td>
			</tr>
		</c:forEach>
	</table>

	deptName:
	<input type="text" id="deptName" readonly="readonly">
	<p>
		Message : <span id="msg"></span>
	
	<p>

		RestController sendVO2: <input type="text" id="RestDept"
			readonly="readonly">
	
	<p>
		RestController sendVO2: sendVO2<input type="button" id="btn_Dept"
			value="부서명" onclick="getDept(10)">
	
	<p>

		<!--  RestController LISTVO3: <input type="text" id="RestDeptList"   readonly="readonly"><p> -->
		RestController LISTVO3: <input type="button" id="btn_Dept3"
			value="부서명 LIST" onclick="getListDept()">
	
	<p>
		<span id="RestDeptList"></span>
	
	<p>
	
	<div id="board_reply">
		Dept_list:
		<div id="Dept_list"></div>

		Dept_list3:
		<div id="Dept_list3">
			<c:forEach var="dept" items="${deptList}">
				<select name="dept">
					<option value="${dept.deptno}">  ${dept.dname }</option>
				</select>
				<p>
			</c:forEach>
		</div>
	</div>
</body>
</html>