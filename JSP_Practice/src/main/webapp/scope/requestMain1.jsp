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
<h2>sendRedirect</h2>
<P>request영역은 하나의 요청에 대한 응답이 완료될 때 소멸된다!</P>

<%	
	// (1)sendRedirect를 이용하는 방법
	// request 영역에 2개의 값(str, person)을 저장한다.
	// request 영역을 이용 시 값이 유지 되지 않으므로 다른 방법을 이용해야 한다.
	request.setAttribute("request_str", "request_str");
		
	// 객체 저장
	request.setAttribute("request_person", new Person("HB", 27));
	
	// (2)session 영역에 값을 저장
	session.setAttribute("session_str", "session_str");
	
	// (3)queryString을 통해 파라메터(값)을 전달
	// queryString : 주소 뒤에 들어가는 데이터 정보
	response.sendRedirect("requestRedirect.jsp?isRedirect=1");
	

		
%>

	
</body>
</html>