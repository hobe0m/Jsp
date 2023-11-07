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
<h2>forward 페이지</h2>
<h3>requestMain페이지의 forward!!</h3>
<%
	request.getAttribute("request_person");
	request.getAttribute("request_str");
	
	String request_str = "값 없음";
	Person request_person = new Person();
	
	if(request.getAttribute("request_person") != null) {
		request_person = (Person)request.getAttribute("request_person");
	}
	if(request.getAttribute("request_str") != null) {
		request_str = request.getAttribute("request_str").toString();
	}
	
	String title = //request.getAttribute("isRedirect") != null ? "redirect" : "forward";
			         request.getParameter("isRedirect") != null ? "redirect" : "forward";
			       //session.getAttribute("isRedirect") != null ? "redirect" : "forward";
%>

isRedirect : <%=request.getAttribute("isdirect") %>

<br><%=title %> 방식으로 호출되었어요.
<br><%=request_person %>
<br><%=request_str %>



</body>
</html>