<%@page import="com.HB.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.none{display:block})
</style>
</head>
<body>

<form action="cookieAction.jsp" name="popupForm" method="get">
<!-- method에서 get은 기본값이라 적어주지 않아도 된다. -->
<!-- <% %> = 자바코드 열기 -->
<% 
	String none = "none";
	String str = "안녕하세요";

%>

<script type = "text/javascript">
	// alert(" none ");
	// alert("<%= none %>");
	// alert('<%=" none "%>')

	// alert("안녕하세요");
	// alert("<%= str %>");

	
	/* 
	document.querySelector("선택자");
	
	선택자 
	- .클래스
	- #아이디
	- 태그명
	*/
	
	// onload는 이벤트(window.onload = function(){} 구문)이다.
	window.onload = function() {
		// 화면에 출력
		// alert('test'); - alert를 통해서 확인 가능
	
	// 쿠키(popupCookie)가 없으면 팝업을 화면에 출력
	<%	
		String display = "none";
	  //	CookieManager.readCookie(request, "popupCookie");
		
	  if(!CookieManager.readCookie(request, "popupCookie")
	 											.equals("Y")) {
	 		display = "block";	
	}
	 // 이렇게도 쓸 수 있지만 비추
	%>
		
	document.querySelector("#popup").style.display=
											   '<%=display%>';
	
	// 닫기버튼을 클릭하면 form을 전송
	document.querySelector("#closeBtn").onclick = function() {
		
	// 닫기 버튼이 클릭되었을 때 체크박스가 체크되었는지 확인
		if(document.querySelector("input[id=inactiveToday]").
													  checked) {
			// 서버에 페이지를 요청
			popupForm.submit();
	} else {
		// 팝업창 닫기
	document.querySelector("#closeBtn").style.display='none';
	}
  }
}	
	// document.querySelectorAll('none')
	// none을 클래스로 가지는 요소를 모두 지정할 수 있다
	
	// document.querySelectorAll('none')[n번째]
	// none을 클래스로 가지는 요소 중 순번을 통해 지정 가능
</script>


<h2 class = "none">쿠키 - 팝업 연습</h2>

<!-- 코드가 소스에 박혀있는 경우를 하드코딩이라고 한다. 
	 하드코딩은 피하는 게 좋다.
	 
	<div id="popup" style="display:none"> = 헤드에서 지정한 스타일과 같은 역할
-->

<!--  
	<%=none%> : 변수 선언 후에 사용할 수 있다. String none = "none" 
	<%= "none" %>
	태그에 속성을 정의할 때, 홑따옴표 또는 쌍따옴표로 감싸주는 것은 
	해당 속성의 값이 어디까지인지를 정의하는 것
	
	class 속성에 값을 정의할 수 있고, 여러 개 정의할 수도 있다.
	class = "none"
-->

	<div id="popup" class="<%=none%>">
        <h2 align="center">공지사항 팝업입니다.</h2>
        <div align="right">
        
	            <input type="checkbox" id="inactiveToday" name="inactiveToday" value="Y" checked /> 
	            하루 동안 열지 않음
	            <input type="button" value="닫기" id="closeBtn" /> 
        </div>
</form>  
</body>
</html>