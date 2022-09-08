<%@page import="kr.co.ali.jdbc.user.model.*"%>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	User_DAO dao = User_DAO.getInstance();
	List<User_VO> userList = dao.userSelectAll();
	
	for(User_VO user : userList){  // 각각의 타입이 User_VO니까 이걸로 적어야!
		String name = user.getName();
		String id = user.getId();	
		String pw = user.getPw();
		String phone = user.getPhone1() + "-" + user.getPhone2() + "-" + user.getPhone3();
		String gender = user.getGender();
		
		out.println("이름 : " + name + ", 아이디 :  " + id + ", 비번 : " + pw + ", 전화번호 : " + phone + ", 성별 : " + gender + "<br>");
	}
	
	
%>