<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>  <!-- UserDAO 메소드 사용하려고 Import -->
<%@ page import="java.io.PrintWriter" %>  <!-- 자바 스크립트 문장 사용하기 위해 사용 -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 데이터를 UTF-8로 받기 위해 사용 -->
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>김승환 게시판 웹 사이트</title>
</head>
<body> 
	<%
		String userID = null;
		if(session.getAttribute("userID") != null)
		{
			userID = (String) session.getAttribute("userID");
		}
		if(userID != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인 되어 있습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(), user.getUserPassword());
		
		if(result == 1){       //로그인 성공 시
			session.setAttribute("userID", user.getUserID());  //로그인 성공한 회원에게 세션 부여 구문
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		else if(result == 0){  //비밀번호가 틀렸을 경우
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");  // 비밀번호가 틀려서 이전 페이지로 돌아가는 구문
			script.println("</script>");
		}
		else if(result == -1){  //아이디가 존재하지 않은 경우
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않은 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result == -2){  //DB 오류
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('오류!!!.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>