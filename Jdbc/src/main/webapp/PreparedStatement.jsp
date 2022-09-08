<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
    
    
<%
	String url = "jdbc:mysql://localhost:3306/jsp_practice";
	String uid = "jsp";
	String upw = "jsp";
	
	Connection conn = null;
	PreparedStatement pstmt = null;   // Statement 대신 PreparedStatement!!
	
	String sql = "INSERT INTO member VALUES(?,?,?,?)";  // PreparedStatement은 데이터가 들어갈 공간에 ?를 넣어준다 / 그리고 진짜 데이터 넣는거는 나중에!
			
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, uid, upw);
		
		/*
			- pstmt 객체는 Connection이 제공하는 preparedStatement()메서드를 호출한다.
			매개값으로는 sql을 전달한다.
		*/
		pstmt = conn.prepareStatement(sql);  // pstmt 객체 생성
		
		/*
			- pstmt 객체를 생성했다면 sql문의 ?값들을 채워준다.
			- ?는 첫번째 물음표부터 1번의 인덱스값을 가지며 순차적으로 인덱스가 1씩 증가한다(★인덱스 1부터 시작함 주의!!)
			- DB테이블의 컬럼데이터 타입에 따라 setString(), setInt() 등의 메서드를 사용하여 ?를 채워준다
		*/
		pstmt.setString(1, "danmuji");
		pstmt.setString(2, "54321");
		pstmt.setString(3, "단무지");
		pstmt.setString(4, "danmu@gmail.com");
		
		
		
		/*
			- ?값을 모두 입력했다면 sql문의 종류에 따라 executeUpdate(), executeQuery() 호출
			- 단, stmt와는 달리 매개값으로 sql 전달하지 않는다		
		*/
		int rn = pstmt.executeUpdate();
		
		if(rn == 1){
			out.print("<h3>회원정보 입력 성공!</h3>");
		}else{
			out.print("<h3>회원정보 입력 실패</h3>");
		}
		
		
	} catch(Exception e){
		e.printStackTrace();
	} finally {
		try{
			conn.close(); pstmt.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}		
%>