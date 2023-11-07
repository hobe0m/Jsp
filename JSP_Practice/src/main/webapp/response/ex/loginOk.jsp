<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- id : HB pw : 1234이면 ioginOk로 페이지 전환
	아니면 오류 메세지를 출력할 수 있도록 main페이지로 파라메터를 전달
-->

	<h2>로그인 성공</h2>
	<h3><%=request.getParameter("id") + "님 환영합니다." %></h3>
	<!-- <h3><%=request.getParameter("id")%>님 환영합니다.</h3> -->
</body>
</html>