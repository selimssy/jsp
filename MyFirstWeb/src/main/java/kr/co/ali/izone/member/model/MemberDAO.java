package kr.co.ali.izone.member.model;

import java.sql.*;
import java.util.*;
import javax.sql.DataSource;

import kr.co.ali.izone.izone.util.JdbcUtil;

import javax.naming.*; 

public class MemberDAO {
	
	private static MemberDAO dao = new MemberDAO();
	private DataSource ds;
	
	private MemberDAO() {
		try {
			Context ct = new InitialContext();
			ds = (DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			e.printStackTrace();
		}
	};
	
	public static MemberDAO getInstance() {
		if(dao == null) {
			dao = new MemberDAO();
		}
		return dao;
	}
	
	
	
	
	
	
	// ID 중복확인 메서드 선언
	public boolean confirmId(String id){
		
		boolean flag = false;
		
		String sql = "SELECT user_id FROM izone_member WHERE user_id=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) { 
				flag = true;   // id 중복(해당 id가 db에서 조회됨)
			}else {
				flag = false;  // id 중복아님(해당 id 조회되지 않음)
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		
		return flag;
		
	}
	
	
	
}
