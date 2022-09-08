<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    

<%! String name, phone1, phone2, phone3, gender;  // t)초기화 필요없도록 선언부에
	//id는 세션에서 가져올거라 필요없고 pw는 수정 안할꺼니까 안가져와도 된다!
	%>

<%			
	String url = "jdbc:mysql://localhost:3306/jsp_practice";
	String uid = "jsp";
	String upw = "jsp";
	
	String id = (String)session.getAttribute("user_id");  // 로그인 했을 때 id랑 name이 세션에 저장되었다!
	String sql = "SELECT * FROM users WHERE id='" + id + "'";
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try{	
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, uid, upw);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			name = rs.getString("name");
			phone1 = rs.getString("phone1");
			phone2 = rs.getString("phone2");
			phone3 = rs.getString("phone3");
			gender = rs.getString("gender");		
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

	<form action="16_update_check_preparedStatement.jsp" method="post">
		이름 : <input type="text" name="name" size="10" value="<%=name%>"><br>  <!-- value 속성을 통해 회원가입할 때 입력한 값들 그대로 입력되어 있도록 / 그 값들은 데이터베이스에서 꺼내온다!! -->
		아이디 : <%= session.getAttribute("user_id") %> <br>   <!-- 아이디는 수정 못하고 보여주기만!(로그인할 때 id랑 name이 세션에 저장됐으니까 그걸 꺼내서 사용) -->
		비밀번호 : <input type="password" name="pw" size="10" disabled><br>  <!-- 비밀번호 수정은 나중에 프로젝트에서 -->
		전화번호 : 
		<select name="phone1">
			<option>010</option>
			<option>011</option>
			<option>016</option>
			<option>019</option>
		</select>
		<input type="text" name="phone2" size="5" value="<%=phone2%>"> - <input type="text" name="phone3" size="5" value="<%=phone3%>"> <br>
		
		성별 : 
		<% if(gender.equals("남")){  %>
			<input type="radio" name="gender" value="남" checked>남 &nbsp;
			<input type="radio" name="gender" value="여">여 <br>
		<%  }else{  %>
			<input type="radio" name="gender" value="남">남 &nbsp;
			<input type="radio" name="gender" value="여"  checked>여 <br>
		<%  } %>
		
		<input type="submit" value="수정">
		
	</form>
	
</body>
</html>