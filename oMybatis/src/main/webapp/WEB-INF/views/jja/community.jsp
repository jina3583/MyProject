<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="myHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
h1{margin-top: 100px;}
.button {
    /* background-color: #4CAF50; */
    border: none;
    color: white;
    padding: 80px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 80px;
    height: 400px;
    width: 60%;
    margin-left: 100px;
   
}
.button1 {border-radius: 4px;}
</style>
</head>
<body>
	<!-- 커뮤니티 게시판 -->
 <h1>어떤 스터디를 원하시나요?</h1>
 	<a href="license.do?m_id=${m_id }&s_subject=자격증"><button class="button button1" style="background:url('resources/image/study1.jpg'); opacity:0.7;">자격증</button></a>
 	<%-- <a href="license.do?m_id=${m_id }&s_subject=자격증">자격증</a> --%>
 	<a href="license.do?m_id=${m_id }&s_subject=인적성"><button class="button button1" style="background:url('resources/image/study5.jpg'); opacity:0.7;">인적성</button></a>
 	<a href="license.do?m_id=${m_id }&s_subject=면접"><button class="button button1" style="background:url('resources/image/study3.jpg'); opacity:0.7;">면접</button></a>
	
</body>
</html>