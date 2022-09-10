package kr.co.ali.izone.izone.util;

import java.sql.*;

public class JdbcUtil {
	
	// 오버로딩에 의해 메서드 이름 같아도 매개변수가 다르면 ok!
	
	public static void close(Connection conn) {
		try {
			if(conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public static void close(Statement stmt) {   // 부모타입이니까 PreparedStatement도 얘로 close가능
		try {
			if(stmt != null) stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public static void close(ResultSet rs) {
		try {
			if(rs != null) rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
