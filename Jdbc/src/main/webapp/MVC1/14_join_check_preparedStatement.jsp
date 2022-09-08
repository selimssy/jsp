<%@page import="kr.co.ali.jdbc.user.model.User_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<%--  request.setCharacterEncoding("utf-8");
	

	// 1. 폼데이터 처리
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String gender = request.getParameter("gender");
	
	
	
	// 2. JDBC 로직 작성
	String url = "jdbc:mysql://localhost:3306/jsp_practice";
	String uid = "jsp";
	String upw = "jsp";
	
	Connection conn = null;
	//Statement stmt = null;
	PreparedStatement pstmt = null;
	//String sql = "INSERT INTO users VALUES('" + name + "', '" + id + "', '" + pw + "', '" + phone1 + "', '" + phone2 + "', '" + phone3 + "', '" + gender + "')";
	String sql = "INSERT INTO users VALUES(?,?,?,?,?,?,?)";
	
	
	
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, uid, upw);
		//stmt = conn.createStatement();
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, name);
		pstmt.setString(2, id);
		pstmt.setString(3, pw);
		pstmt.setString(4, phone1);
		pstmt.setString(5, phone2);
		pstmt.setString(6, phone3);
		pstmt.setString(7, gender);
		
		//int rn = stmt.executeUpdate(sql);
		int rn = pstmt.executeUpdate();
		
		if(rn == 1){
			session.setAttribute("user_name", name);
			response.sendRedirect("3_join_success.jsp");
		}else{
			response.sendRedirect("1_join_form.jsp");
		}
		
		
	}catch(Exception e){
		e.printStackTrace();
	} finally {
		try{
			conn.close(); pstmt.close(); 
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
--%>






<!-- 
	String id = request.getparameter("id");....7개
	User_VO users = new User_VO();
	users.setId(id);......7개
	
	저 모든걸 자바빈을 통해 아래 2줄로!
 -->
 <% request.setCharacterEncoding("utf-8"); // 얘를 자바빈 코드보다 꼭 먼저써야!!★ %> 
 
<jsp:useBean id="users" class="kr.co.ali.jdbc.user.model.User_VO"/>
<jsp:setProperty name="users" property="*" />


<%	
	User_DAO dao = User_DAO.getInstance();  // 싱글톤 객체 불러옴
	int rn = dao.join(users);
	
	if(rn == 1){
		session.setAttribute("user_name", users.getName());
		response.sendRedirect("3_join_success.jsp");
	}else{
		response.sendRedirect("1_join_form.jsp");
	}
	
%>



