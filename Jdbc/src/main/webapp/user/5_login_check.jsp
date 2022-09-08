<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>    
    
<!-- 
		 // 1. 폼데이터 처리
		 
		 // 2. SQL문 작성(select문으로 가입 당시의 패스워드를 조회)
	
		 // 3. DB연동에 필요한 변수들 선언
		 
		 // 4. JDBC로직 작성
		 
		 // 5. ResultSet을 통해 결과값소비 후 결과에 맞는 페이지 안내
		 
		 // 6. 로그인 성공 시 id, name 세션 처리		
 -->    
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	
	String url = "jdbc:mysql://localhost:3306/jsp_practice";
	String uid = "jsp";
	String upw = "jsp";
	
	
	String sql = "SELECT pw, name FROM users WHERE id = '" + id + "'";
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, uid, upw);
		stmt = conn.createStatement();		
		rs = stmt.executeQuery(sql);
		
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
			conn.close();
			stmt.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
%>    







