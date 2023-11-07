<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>쿠키 값 확인</h2>
<%
	// 쿠키가 하나가 아닐수도 있어서, 쿠키 배열이 들어간다.
	Cookie[] cookies = request.getCookies();
	if(cookies != null) {
		for(Cookie cookie : cookies) {
			
			String name = cookie.getName();
			String value = cookie.getValue();
			
		out.print("쿠키명 : " + name +
				"/쿠키 값 : " + value + "<br>");
		}
	}
%>
</body>
</html>