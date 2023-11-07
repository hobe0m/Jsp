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
	 WEB.INF 파일은 중요한 정보가 포함된 설정 파일이다
	 따라서 사용자가 직접 접근할 수는 없다.
  -->
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if("HB".equals(id) && "1234".equals(pw)) {
		// request 영역이 공유 되지 않음
		// 웹브라우저로 다른 페이지를 요청할 수 있도록 처리
		// 2번의 요청이 발생
	
		response.sendRedirect("loginOk.jsp?id=" + request.getParameter("id"));
	} else 
		// 1번의 요청으로 페이지를 전환하므로 request 영역이 공유된다.
	{ request.getRequestDispatcher("main.jsp?isError=1").
	forward(request, response);
	}
%>


id : <%=id %> <br>
pw : <%=pw %>
<h2></h2>
</body>
</html>