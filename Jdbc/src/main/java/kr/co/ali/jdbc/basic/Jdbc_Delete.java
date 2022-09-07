package kr.co.ali.jdbc.basic;

import java.sql.*;
import java.util.Scanner;

public class Jdbc_Delete {

	public static void main(String[] args) {
		
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("# 삭제할 회원의 ID를 입력하세요.");
		System.out.print("* 아이디 : ");
		String id = sc.next();

		
		String url = "jdbc:mysql://localhost:3306/jsp_practice";
		String uid = "jsp";   // root
		String upw = "jsp";   // stm1020
		
		
		
		Connection conn = null;
		Statement stmt = null;
		
		try {
				
			Class.forName("com.mysql.jdbc.Driver");
			
			conn = DriverManager.getConnection(url, uid, upw);	
			stmt = conn.createStatement();
			
			
			String sql = "DELETE FROM member WHERE id='" + id +"'";
				
			int resultNum = stmt.executeUpdate(sql);
			  
			
			if(resultNum == 1) {
				System.out.println(id + "이(가) 정상 삭제되었습니다.");
			}else {
				System.out.println("삭제에 실패했습니다.");
			}
			  				
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
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
