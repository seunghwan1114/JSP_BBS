<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>김승환 게시판 웹 사이트</title>
</head>
<body> 
	<%
	
		if(user.getUserID() == null || user.getUserPassword() == null || user.getUserID() == null || 
		user.getUserName() == null || user.getUserGender() == null || user.getUserEmail() == null  )
		{     // 하나라도 입력을 안했을 경우
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else
		{
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			if (result == -1)
			{     // 이미 존재하는 아이디를 입력 할 경우
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디 입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else
			{    // 회원가입 성공 시, 메인 홈으로 이동
				session.setAttribute("userID", user.getUserID());  //로그인 성공한 회원에게 세션 부여 구문
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			}
		}
		
	%>
</body>
</html>