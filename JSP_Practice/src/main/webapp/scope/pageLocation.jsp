<%@page import="com.HB.dto.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	// getAttribute의 메소드 반환값은 Object이므로 형변환 필요!
	Object page_str = pageContext.getAttribute("page");
	Object page_int = pageContext.getAttribute("page_int");
	Object page_p = pageContext.getAttribute("pagePerson");
%>

<h2>페이지 이동 후 페이지 영역의 값 읽기</h2>

<br> String : <%= page_str == null ? "값 없음" : page_str %>
<br> int : <%= page_int == null ? "값 없음" : page_int %>
<br> Person : <%= page_p == null ? "값 없음" : page_p %>	
</body>
</html>