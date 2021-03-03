<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>김승환 게시판 웹 사이트</title>
</head>
<body> 
	<%
		session.invalidate();  // 로그인 시 속해있던 세션을 로그아웃을 통해 세션을 무효화 시키는 구문 
	%>
	<script>
		location.href = 'main.jsp'; 
	</script>
</body>
</html>