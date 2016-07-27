package com.project.webApp.custom;

import java.util.StringTokenizer;

public class CustomVO {
	private int num;
	private String user_email;
	private String user_email_password;
	private String userjoin_writedate;
	private String loginStatus;
	private String favor[];
	private String favordb;
	///
	
	
	public CustomVO(){}
	
	public void setFavorlist(String f){
		StringTokenizer st = new StringTokenizer(f, "-");
		favor = new String[st.countTokens()];
		int i=0;
		while(st.hasMoreTokens()){
			favor[i++] = st.nextToken();
		}
	}
	
	
	public String getFavorlist(){
		String f="";
		for(int i=0;i<favor.length;i++){
			f += favor[i]+"-";
		}
		favordb = f;
		return f;
	}
	
	public String getFavordb() {
		return favordb;
	}

	public void setFavordb(String favordb) {
		this.favordb = favordb;
	}

	public String getLoginStatus() {
		return loginStatus;
	}

	public void setLoginStatus(String loginStatus) {
		this.loginStatus = loginStatus;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_email_password() {
		return user_email_password;
	}

	public void setUser_email_password(String user_email_password) {
		this.user_email_password = user_email_password;
	}

	public String getUserjoin_writedate() {
		return userjoin_writedate;
	}

	public void setUserjoin_writedate(String userjoin_writedate) {
		this.userjoin_writedate = userjoin_writedate;
	}

	public String[] getFavor() {
		return favor;
	}

	public void setFavor(String[] favor) {
		this.favor = favor;
	}
	
	
}
