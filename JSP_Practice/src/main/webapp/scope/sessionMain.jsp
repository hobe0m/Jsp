<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
<!-- 
	< Session >
	웹브라우저에서 서버에 처음 요청할 때, sessionId를 발급
	-> 응답객체의 쿠키에 담아서 웹브라우져로 전송
	-> 웹브라우저는 응답을 받아서 쿠키에 저장
	-> 서버에 요청 시 쿠키정보를 담아서 요청
	
	< Session의 특징 >
	- 회원 인증 후 로그인 상태를 유지하는데에 사용된다.
	- 웹브라우저를 닫고 다시 열게 되면 세션은 유지되지 않는다.
	
 -->
 
 <%
 	session.setAttribute("person", new Person("HB", 27));
 
 	List<String> list = new ArrayList<String>();
 	list.add("list");
 	
 	// 로또만들기를 할 때 많이 사용, 새로운 숫자를 추출해서 중복없이 담는다.
 	list.add("set");
 	
 	
 	list.add("map");
 	
 	session.setAttribute("list", list);
 	// 세션을 무효화 할 수 있는 메서드 : session.invalidate();
 %>
 
 <h2>페이지 이동 후 session영역에 저장된 값을 출력</h2>
 <a href="sessionLocation.jsp">sessionLocation.jsp 바로가기</a>
 
 <h2>세션을 무효화 하는 방법</h2>
 <a href="sessionInvalidate.jsp">sessionInvalidate.jsp 바로가기</a>
 
 <!-- 세션에 저장된 값 출력 : FDE66FAC183FE970B7EC42575E60D2C8 -->
 <!-- 세션을 무효화 하는 방법 : 4EB295755996F91A93D6858DB48FBFB6 -->
</body>
</html>