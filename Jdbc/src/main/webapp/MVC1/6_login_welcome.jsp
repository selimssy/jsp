<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = (String)session.getAttribute("user_id");
	String name = (String)session.getAttribute("user_name");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
	<h3> <%= name %>(<%= id %>)님 안녕하세요! </h3>
	<a href="9_update_form.jsp">회원정보 수정</a> &nbsp; &nbsp;
	<a href="17_delete_member_preparedStatement.jsp">회원탈퇴</a> &nbsp; &nbsp;
	<a href="11_logout.jsp">로그아웃</a>
	
</body>
</html>