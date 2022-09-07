package kr.co.ali.jdbc.basic;

import java.sql.*;
import java.util.Scanner;

public class Jdbc_Insert {

	public static void main(String[] args) {
		
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("# 회원정보 입력을 시작합니다.");
		System.out.print("* 아이디 : ");
		String id = sc.next();
		
		System.out.print("* 비밀번호 : ");
		String pw = sc.next();
		
		System.out.print("* 이름 : ");
		String name = sc.next();
		
		System.out.print("* 이메일 : ");
		String email = sc.next();
		
		
		// DB 연동 순서
		// 1. DB사용자 계정명, 암호, DB URL 등 초기 데이터 변수를 설정
		String uid = "jsp";
		String upw = "jsp";
		
		/*	URL은 데이터베이스마다 형식이 정해져 있다!
		 	- MySQL : "jdbc:mysql://호스트이름:포트번호/DB이름"
		 	- 오라클 : "jdbc:oracle:thin:호스트이름:포트번호:DB이름"
		 */
		String url = "jdbc:mysql://localhost:3306/jsp_practice";
		
		
		
		
		
		Connection conn = null;
		Statement stmt = null;
		
		
		
		try {
			// 2. JDBC 커넥터 드라이버 클래스 호출
			
			/*      이것도 형식이 정해져 있다
		 	- MySQL : "com.mysql.jdbc.Driver"
		 	- 오라클 : "oracle.jdbc.driver.OracleDriver"         */		
			Class.forName("com.mysql.jdbc.Driver");
			
			
			
			
			//3. DB 연동을 위한 클래스들의 객체를 생성
						
			/*	# 1. Connection 객체 : DB와의 연결을 위한 객체 
			     - Connection은 인터페이스라 new로 객체 생성할 수 없고 DriverManager 클래스가
			       제공하는 정적 메서드 getConnection(url, uid, upw) 을 호출하여 객체를 생성
			       (+ 이 과정에서 java.sql* import 해줘야)
			  */
			
			conn = DriverManager.getConnection(url, uid, upw);
			// 근데 얘랑 stmt를 finally에서 또 써야되서 try 블럭에서 선언하면 안되서 선언부는 try 밖으로 빼야!!
			
			
			
			
			/*  # 2. Statement 객체 : sql문 실행을 위한 객체
			     - 얘도 마찬가지로 인터페이스라서 new로 객체 못만들고 Connection 객체가 제공하는
			       createStatement() 메서드를 호출하여 객체 생성	  
			 */
			stmt = conn.createStatement();
			
			
			
			
			
			
			/*  # 3. SQL문 작성
			      : SQL문은 String 형태로 작성한다          */
			// String sql = "INSERT INTO member VALUES('jsp012', 'jjj123', '김제이에스피', 'jjj123@jsp.com')";
			String sql = "INSERT INTO member VALUES('" + id + "', '" + pw + "', '" + name + "', '" + email + "')";
			
			
			
			
			
			/*  # 4. Statement 객체를 통한 SQL문 실행
			       1) insert, update, delete 명령일 경우 : executeUpdate() 사용
			           : executeUpdate() 는 실행 성공시 성공한 쿼리의 개수를, 실패시 0을 리턴
			       2) select 명령일 경우 : executeQuery() 사용                  */
			int resultNum = stmt.executeUpdate(sql);
			  
			if(resultNum == 1) {
				System.out.println("DB에 회원정보 저장 성공!");
			}else {
				System.out.println("DB에 회원정보 저장 실패!");
			}
			  
			  
			
			
			
					
					
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			// 3) DB 연동 객체들 자원 반납 : 원활한 JDBC 프로그래밍을 위해 사용한 자원들을 반납
			
			try {
				conn.close();
				stmt.close();
				sc.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}
		
		
		
	}

}
