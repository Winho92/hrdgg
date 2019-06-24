package com.spring.login;

import lombok.*;

public class LoginVo {
	private String userid;
	private String username;
	private String userpwd;
	private String usergrd;	
	public LoginVo() {

	}
	public LoginVo(String userid, String username, String userpwd, String usergrd) {
		this.userid = userid;
		this.username = username;
		this.userpwd = userpwd;
		this.usergrd = usergrd;
	}
	public LoginVo(String userid, String userpwd) {
		this.userid = userid;
		this.userpwd = userpwd;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getUsergrd() {
		return usergrd;
	}
	public void setUsergrd(String usergrd) {
		this.usergrd = usergrd;
	}
	@Override
	public String toString() {
		return "LoginVo [userid=" + userid + ", username=" + username + ", userpwd=" + userpwd + ", usergrd=" + usergrd
				+ "]";
	}
	
}
