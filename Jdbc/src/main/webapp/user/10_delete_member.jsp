<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    


<%	// 회원탈퇴  
	
	String id = (String)session.getAttribute("user_id");
	
	String url = "jdbc:mysql://localhost:3306/jsp_practice";
	String uid = "jsp";
	String upw = "jsp";
	
	String sql = "DELETE FROM users WHERE id='" + id + "'";
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, uid, upw);
		stmt = conn.createStatement();
			
		int rn = stmt.executeUpdate(sql);
		
		if(rn == 1){
			System.out.print("회원 삭제 성공");
			session.invalidate();  // 회원탈퇴 했으니까 세션 전부 삭제해야!
			response.sendRedirect("4_login_form.jsp");
		}else{
			response.sendRedirect("6_login_welcome.jsp");
		}
		
		
		
	} catch(Exception e){
		e.printStackTrace();
	} finally {
		try{
			conn.close(); stmt.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	%>