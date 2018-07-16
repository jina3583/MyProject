<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자바스크립트 연습</title>
<script type="text/javascript">
	document.write("<p>자바스크립트 연습</p>");
	var x = "안녕하세요"+10+"<br>";
	document.write(x);
	
	/* if,else문
	var y;
	y=prompt("점수는?");
	// document.write("당신의 점수는 "+y+" 점 입니다."); 
	if(y>80){
		document.write("우수합니다!")
	} else{
		document.write("더 노력하세요!")
	}
	*/
	
	/* for문
	var i,sum=0;
	for(i=1;i<=100;i++){
		sum+=i;
	}
	document.write("합은 "+sum+" 입니다.")
	*/
	
	/* 함수
	function test1() {
		var i,sum=0;
		for(i=1;i<=100;i++){
			sum+=i;
		}
		document.write("합은 "+sum+" 입니다.")
	}
	*/
	
	function clk() {
		//alert("클릭이벤트 발생!");
		location.href='https://www.naver.com/';
	}
</script>

</head>
<body>
<script type="text/javascript">
	/* 함수
	document.write("함수호출 start"+"<br>");
	test1();
	document.write("<br>"+"함수 end");
	*/
</script>
<a href="#" onclick="clk();">클릭!</a>





</body>
</html>