package kr.co.ali.jdbc.user.model;

import java.sql.*;
import java.util.*;

// DAO 클래스는 DB작업을 전담처리한다!
// 메모리 이유로 단 1개의 객체만을 생성(싱글톤)

public class User_DAO {
	
	private String url = "jdbc:mysql://localhost:3306/jsp_practice";
	private String uid = "jsp";
	private String upw = "jsp";
	
	
	// 싱글톤 패턴 클래스 생성
	// 1. 클래스 외부에서 객체를 생성할 수 없도록 생성자에 private 제한을 붙임
	private User_DAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	// 2. 자신의 클래스 내부에서 스스로의 객체 1개를 생성
	private static User_DAO dao = new User_DAO();  // 공유할 수 있도록 static
	
	
	// 3. 외부에서 객체생성을 요구할 시 공개된 메서드를 통해 미리 만들어둔 단 하나의 객체를 리턴함
	public static User_DAO getInstance() {  
		if(dao == null) {  // t는 !=로 했는데 == 아닌가..
			dao = new User_DAO();
		}
		
		return dao;
	}
	
	
	
	
	// User_DAO 에서는 회원관리에 필요한 DB연동 로직들을 메서드로 나열하여 작성
	
	
	// DB에 회원가입 데이터를 INSERT하는 메서드 선언
	public int join(User_VO users){
		
		String sql = "INSERT INTO users VALUES(?, ?, ?, ?, ?, ?, ?)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int rn = 0;
		
		try {
			conn = DriverManager.getConnection(url, uid, upw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, users.getName());
			pstmt.setString(2, users.getId());
			pstmt.setString(3, users.getPw());
			pstmt.setString(4, users.getPhone1());
			pstmt.setString(5, users.getPhone2());
			pstmt.setString(6, users.getPhone3());
			pstmt.setString(7, users.getGender());
			
			rn = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close(); pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return rn;
		
	}
	
	
	
	
	
	
	
	// DB로부터 모든 회원정보를 가져오는 메서드 선언
	public List<User_VO> userSelectAll() {
		
		List<User_VO> userList = new ArrayList<>();
		
		String sql = "SELECT * FROM users";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(url, uid, upw);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				User_VO users = new User_VO(
						rs.getString("name"),
						rs.getString("id"),
						rs.getString("pw"),
						rs.getString("phone1"),
						rs.getString("phone2"),
						rs.getString("phone3"),
						rs.getString("gender")
						);
				
				userList.add(users);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close(); pstmt.close(); rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return userList;
		
	}
	
	
	
	
	
	
	
	
	// 회원탈퇴를 처리하는 메서드 선언
	public int userDelete(String id) {
		int rn = 0;
		
		String sql = "DELETE FROM users WHERE id=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DriverManager.getConnection(url, uid, upw);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rn = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close(); pstmt.close(); 
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return rn;
		
	}
	
	
	
}
