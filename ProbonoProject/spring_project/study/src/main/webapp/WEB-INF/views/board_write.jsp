<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="write_board.do" method="post">
      <table>
         <tr>
            <td>����</td>
            <td><input type="text" name="ttitle" width="145" size="150"></td>
         </tr>
         <tr>
            <td>����</td>
            <td>
               <textarea rows="40" cols="150" name="tcontent"></textarea>
            </td>
         </tr>
      </table>
      <input type="submit" value="�Ϸ�" style="margin-left: 1000px;">
   </form>
</body>
</html>