<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>

<%
	String url = "jdbc:mysql://localhost:3306/jsp_practice";
	String uid = "jsp";
	String upw = "jsp";
	
	String sql = "SELECT * FROM member";
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, uid, upw);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			String id = rs.getString("id");
			String pw = rs.getString("pw");
			String name = rs.getString("name");
			String email = rs.getString("email");
			
			out.println("아이디 : " + id + ", 비번 : " + pw + ", 이름 : " 
							+ name + ", 이메일 : " + email + "<br>");
		}
		
		
		
	} catch(Exception e){
		e.printStackTrace();
	} finally {
		try{
			conn.close(); stmt.close(); rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>