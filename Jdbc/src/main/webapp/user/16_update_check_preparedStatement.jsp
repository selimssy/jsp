<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
  

    
<%  request.setCharacterEncoding("utf-8");
	
	String id = (String)session.getAttribute("user_id");
	String name = request.getParameter("name");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String gender = request.getParameter("gender");
	
	
	String url = "jdbc:mysql://localhost:3306/jsp_practice";
	String uid = "jsp";
	String upw = "jsp";
	
	//String sql = "UPDATE users SET name='" + name + "', phone1='" + phone1 + "', phone2='" + phone2 + "', phone3='" + phone3 + "', gender='" + gender + "' WHERE id='" + id + "'";
	String sql = "UPDATE users SET name=?, phone1=?, phone2=?, phone3=?, gender=? WHERE id=?";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, uid, upw);
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, name);
		pstmt.setString(2, phone1);
		pstmt.setString(3, phone2);
		pstmt.setString(4, phone3);
		pstmt.setString(5, gender);
		pstmt.setString(6, id);
			
		int rn = pstmt.executeUpdate();
		
		if(rn == 1){
			System.out.print("회원정보 수정 성공!");
			session.setAttribute("user_name", name);
			response.sendRedirect("13_update_success.jsp");
		}else{
			response.sendRedirect("4_login_form.jsp");
		}
		
		
		
	} catch(Exception e){
		e.printStackTrace();
	} finally {
		try{
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	

%>    