<%@page import="kr.co.ali.izone.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	String userId = request.getParameter("userId");
	MemberDAO dao = MemberDAO.getInstance();
	
	boolean flag = dao.confirmId(userId);
	
	if(flag){  %>
		
		<script type="text/javascript">
			alert("중복된 아이디입니다.")
			history.back();
		</script>
		
<%	}else{	  %>
		
		<script type="text/javascript">
			alert("아이디 사용 가능!")
			history.back();
		</script>
		
<%  }    %>

