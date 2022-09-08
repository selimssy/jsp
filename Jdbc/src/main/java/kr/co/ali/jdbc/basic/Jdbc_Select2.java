package kr.co.ali.jdbc.basic;

import java.sql.*;

import java.util.Scanner;

public class Jdbc_Select2 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		System.out.println("조회할 회원의 ID를 입력하세요.");
		System.out.print("아이디 : ");
		String user_id = sc.next();
		
		
		
		String url = "jdbc:mysql://localhost:3306/jsp_practice";
		String uid = "jsp";
		String upw = "jsp";
		
		
		String sql = "SELECT * FROM member WHERE id = '" + user_id + "'";
		
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
			
			
			
			if(rs.next()) { 		
			String id = rs.getString("id");
			String pw = rs.getString("pw");
			String name = rs.getString("name");
			String email = rs.getString("email");
			
			System.out.println("=============== 회원정보 ================");
			System.out.println("아이디 : " + id);
			System.out.println("비밀번호 : " + pw);
			System.out.println("이름 : " + name);
			System.out.println("이메일 : " + email);		
			System.out.println("======================================");
			
			}else {
				System.out.println("회원정보가 존재하지 않습니다.");
			}	
			
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				stmt.close();
				rs.close();
				sc.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		
	}

}
