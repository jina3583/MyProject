<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
	<form action="write_board.do" method="post">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="ttitle" width="145" size="150"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="40" cols="150" name="tcontent"></textarea>
				</td>
			</tr>
		</table>
		<input type="submit" value="완료" style="margin-left: 1000px;">
	</form>
</body>
</html>