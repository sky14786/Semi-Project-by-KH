package com.truckta.client.model.vo;

import java.sql.Date;

public class Client {
	private String id;
	private String pw;
	private String name;
	private String profile;
	private Date regDate;
	private Date modDate;
	private int userType;
	private int status;

	public Client() {
	}

	public Client(String id, String pw, String name, String profile, Date regDate, Date modDate, int userType, int status) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.profile = profile;
		this.regDate = regDate;
		this.modDate = modDate;
		this.userType = userType;
		this.status = status;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getModDate() {
		return modDate;
	}

	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Client [id=" + id + ", pw=" + pw + ", name=" + name + ", profile=" + profile + ", regDate=" + regDate
				+ ", modDate=" + modDate + ", userType=" + userType + "]";
	}

}
