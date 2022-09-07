package kr.co.ali.jdbc.basic;

import java.sql.*;

public class Jdbc_Select {

	public static void main(String[] args) {
		
		String url = "jdbc:mysql://localhost:3306/jsp_practice";
		String uid = "jsp";
		String upw = "jsp";
		
		
		String sql = "SELECT * FROM member";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;   // select문에서는 이 객체가 추가로 필요하다!!
		
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, uid, upw);
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);  // executeQuery() 반환 타입이 ResultSet이다
			
			/* select 쿼리문의 실행 결과 데이터가 한 줄이라도 존재한다면 
			  rs.next() 메서드는 true를 리턴하며 해당 행을 지목한다 
			  (+ 3줄이라면 rs.next()를 2번 더 할 수 있고(그 때마다 해당 행을 지목) 여기서 또 하면 false를 리턴)           */		 
			
			/*rs.next();  // 첫 번째 레코드 지목, 데이터 출력
			rs.next();  // 두 번째 레코드 데이터 출력
			rs.next();  // 세 번째 레코드 데이터 출력
			rs.next();  // false(에러 발생)*/
			
			
			/* select의 실행결과의 데이터를 읽어오려면 getString(), getInt() 등의
			   메서드를 사용한다. 해당 메서드의 매개값으로 읽어올 테이블의 컬럼명을 지정한다         */
			
			System.out.println("==========================================================");
			
			while(rs.next()) { // 다음 행이 있을 때까지 반복
			String id = rs.getString("id");
			String pw = rs.getString("pw");
			String name = rs.getString("name");
			String email = rs.getString("email");
			
			System.out.printf("아이디: %s,  비번: %s,  이름: %s,  이메일: %s\n", id, pw, name, email);
			}  // while 종료
			
			System.out.println("==========================================================");
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				stmt.close();
				rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		
	}

}
