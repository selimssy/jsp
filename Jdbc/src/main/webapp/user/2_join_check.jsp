<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<%  request.setCharacterEncoding("utf-8");
	

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
%>
