<%@page import="com.HB.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
    div#popup {
        position: absolute; top:100px; left:50px; color:yellow;  
        width:270px; height:100px; background-color:gray;
    }
    div#popup>div {
        position: relative; background-color:#ffffff; top:0px;
        border:1px solid gray; padding:10px; color:black;
    }
</style> 

<title>Insert title here</title>
</head>
<body>

<h2>쿠키를 이용한 팝업창 제어 ver 1.0 </h2>

<!-- 
	화면에 대한 동적인 처리 : script
	화면을 예쁘게 꾸미는 것 : CSS 
-->

<script>
// window 객체의 onload 이벤트가 발생하면 실행
// html 요소가 모두 생성된 상태에서 실행
	window.onload = function() {
	
	// 팝업 클로즈 쿠키의 값이 'Y'이면 팝업창을 화면에서 숨김처리
	<% String popupClose = CookieManager.readCookie(request, "popupClose");
	if ("Y".equals(popupClose)) {
		
	
	%>
		// 요소를 선택 후 화면에서 숨김 처리 하는 방법
		// document.querySelector("#popup").style.display = 'none'
		console.log("popupClose == Y");
		popup.style.display = 'none';
	<%
	}
	%>
	// 버튼에 이벤트 등록		
	closeBtn.onclick = function() {
		if(document.querySelector('#inactiveToday').checked){
			alert("체크박스가 선택되었습니다.");
		
	// 서버에 요청 방법
	// 1. href : querySelector을 이용해서 파라미터 전달
	// 2. form submit : form 안의 요소들을 가지고 이동
	
	popupForm.submit();
		
	// 체크박스가 체크되어 있다면
	// "체크박스가 선택되었습니다." 메세지를 출력하시오			
	}
	console.log("체크박스가 선택되지 않았습니다.");
	popup.style.display ='none';
	}
}	

/*	if(document.querySelector('#inactiveToday').checked){
	alert("체크박스가 선택되었습니다.") or
	console.log("체크박스가 선택되었습니다.")
	} 
	의 방법으로도 체크박스가 선택되었다는 창을 띄울 수 있다
	
	display 속성을 none으로 설정하면 화면에서 숨김 처리
	 - popup.style.display = 'none';
	
	// 버튼에 이벤트 추가(등록)
	closeBtn.onclick = function() {
		alert('닫힘 버튼이 클릭되었습니다.');

	체크박스 클릭 시 선택 되었다는 문구
		inactiveToday.onclick = function() {
			if(inactiveToday.onclick) {
				alert("체크박스가 선택되었습니다.");

*/

/*
	// none으로 설정해 화면에서 숨김
	popup.style.display = 'none';
	// block으로 설정해 화면에 출력
	document.querySelector("#popup").style.display = 'block';

	querySelector : 요소를 하나만 선택
	querySelectorAll 
	 - 여러 개의 요소를 선택할 때 사용
	 - nodeList를 반환하며 리스트와 같이 방번호([0])를 이용해 접
	   근 가능하다
*/

	document.querySelector("#popup").style.display='block';
</script>


<!-- 
	1. 닫기 버튼을 클릭하면 cookiePopupAction.jsp 파일을 호출
	 - 팝업 닫힘 쿠키를 생성
	 
	2. 팝업 닫힘 쿠키가 생성되어 있다면, 
				더 이상 팝업창을 보여주지 않도록 처리 

-->


<!--
파일 내부 요소에 접근하는 방법 
(1)
개발자 도구 - console - 
				document.querySelector("#객체아이디")

(2)
개발자 도구 - console - 
				객체 아이디 입력 

(3) 
개발자 도구 - console - 
				document.getElementById('객체아이디')
-->
<form action="cookiepopupAction.jsp" name ="popupForm">
	<div id="popup" >
        <h2 align="center">공지사항 팝업입니다.</h2>
        <div align="right">
        
	            <input type="checkbox" id="inactiveToday" name="inactiveToday" value="Y" /> 
	            하루 동안 열지 않음
	            <input type="button" value="닫기" id="closeBtn" /> 
        </div>
    </div>
</form>
</body>
</html>