package kr.co.ali.izone.member.model;

import java.sql.Timestamp;

public class MemberVO {
	
	private String userId;
	private String userPw;
	private String userName;
	private String userEmail;
	private Timestamp userRegDate;   // 자바에서 날짜타입은 Timestamp 사용한다!(java.util 패키지에서 import해야)
	
	
	public MemberVO() {}


	public MemberVO(String userId, String userPw, String userName, String userEmail, Timestamp userRegDate) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userRegDate = userRegDate;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserPw() {
		return userPw;
	}


	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getUserEmail() {
		return userEmail;
	}


	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}


	public Timestamp getUserRegDate() {
		return userRegDate;
	}


	public void setUserRegDate(Timestamp userRegDate) {
		this.userRegDate = userRegDate;
	}
	
	
	
	
	
	
	
}
