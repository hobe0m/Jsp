<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지 만들기</title>
</head>
<body>
	<h2>로그인</h2>
<%
	String isError = request.getParameter("isError");
	String id = "HB";
	if(request.getParameter("id") != null) {
		id = request.getParameter("id");
	}
%>
<%
	String msg = " ";
	if("1".equals(request.getParameter("loginErr"))) {
		msg = "아이디/비밀번호를 확인해주세요.";
	} 
	out.print(msg);
	
	
	if(request.getParameter("id") != null) {
		id = request.getParameter("id");
	}
	// out.print(request.getParameter("loginErr"));
			
%>
<%="1".equals(isError) ? "아이디/비밀번호를 확인해주세요" : "" %>
	<form action="login.jsp" method="post">
		아이디 : <input type = "text" name = "id" value = <%="HB"%>>
		비밀번호 : <input type = "password" name = "pw" value= "1234">
		<input type="submit" value="로그인"/>
	<!-- <button>로그인</button> 
	폼안에 버튼이 하나일 때는, submit의 역할도 한다. -->
	</form>





</body>
</html>