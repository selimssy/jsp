<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>    
    
 
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	
	String url = "jdbc:mysql://localhost:3306/jsp_practice";
	String uid = "jsp";
	String upw = "jsp";
	
	
	String sql = "SELECT pw, name FROM users WHERE id=?";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, uid, upw);
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		
		rs = pstmt.executeQuery();
		
		//System.out.println(rs.next());  // 여기서 이걸 해버리면 아래 rs.next()에서 한 칸 아래로 또 이동해서 false 리턴한다!! 주의!
		
		if(rs.next()){
			String dbPw = rs.getString("pw");
			String dbName = rs.getString("name");
			if(pw.equals(dbPw)){
				session.setAttribute("user_id", id);
				session.setAttribute("user_name", dbName);
				response.sendRedirect("6_login_welcome.jsp");
			}else{
				response.sendRedirect("8_login_fail_pw.jsp");
			}
		}else{
			response.sendRedirect("7_login_fail_id.jsp");
		}
		
		
		
		
	}catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
%>    
