<%@page import="java.util.Set"%>
<%@page import="com.HB.dto.Person"%>
<%@page import="java.util.Map"%>
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
	// 현재 map의 반환타입은 Object, Attribute를 사용했기 때문
	application.getAttribute("map");

	// 형변환이 필요한 지, null을 통해 확인한다.
	if(application.getAttribute("map") != null) {
	
		
	// 브라우져를 닫았다가 다시 열어도 값이 유지가 된다.
	// 서버 종료 후 다시 실행 시 제거되는 것을 확인할 수 있다.
	// Map으로 형변환 실행	
	// Map은 키 값을 알아야 출력할 수 있다.
	Map<String, Person> map =
		(Map<String,Person>)application.getAttribute("map");
	
	// Map에 담겨진 데이터의 키값을 조회
	// 코드 블럭을 벗어나면 Map이 사라지므로 코드블럭 내부에서 불러오기.
	// keySet(); : 키의 집합을 set타입으로 변환
	Set<String> keys = map.keySet();
	
	// map은 key, value가 쌍으로 저장되는 컬렉션 타입니다.
	// get(key) : 키값을 이용하여 value값을 반환받는다.
	// keys에 있는 목록을 하나씩 꺼내서 String key에 넣는 for문
	for(String key : keys) {
		Person p = map.get(key);
		out.print(p + "<br>");
	}
	
	} else {
		out.print("map이 존재하지 않습니다.");
	}

	
%>
</body>
</html>