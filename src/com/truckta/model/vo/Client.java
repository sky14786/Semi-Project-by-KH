package com.truckta.model.vo;

import java.sql.Date;

public class Client {
	private String id;
	private String pw;
	private String name;
	private Date regdate;
	private Date moddate;
	private String profile;

	public Client() {
	}

	public Client(String id, String pw, String name, Date regdate, Date moddate, String profile) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.regdate = regdate;
		this.moddate = moddate;
		this.profile = profile;
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

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public Date getModdate() {
		return moddate;
	}

	public void setModdate(Date moddate) {
		this.moddate = moddate;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	@Override
	public String toString() {
		return "Client [id=" + id + ", pw=" + pw + ", name=" + name + ", regdate=" + regdate + ", moddate=" + moddate
				+ ", profile=" + profile + "]";
	}

}
