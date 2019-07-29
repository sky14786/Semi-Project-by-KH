package com.truckta.model.vo;

import java.sql.Date;

public class Driver {
	private String id;
	private String pw;
	private String name;
	private Date regdate;
	private Date moddate;
	private Date dateOfBirth;
	private String dLicense;
	private String bLicense;
	private String carpic;
	private String cartype;

	public Driver() {
	}

	public Driver(String id, String pw, String name, Date regdate, Date moddate, Date dateOfBirth, String dLicense,
			String bLicense, String carpic, String cartype) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.regdate = regdate;
		this.moddate = moddate;
		this.dateOfBirth = dateOfBirth;
		this.dLicense = dLicense;
		this.bLicense = bLicense;
		this.carpic = carpic;
		this.cartype = cartype;
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

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getdLicense() {
		return dLicense;
	}

	public void setdLicense(String dLicense) {
		this.dLicense = dLicense;
	}

	public String getbLicense() {
		return bLicense;
	}

	public void setbLicense(String bLicense) {
		this.bLicense = bLicense;
	}

	public String getCarpic() {
		return carpic;
	}

	public void setCarpic(String carpic) {
		this.carpic = carpic;
	}

	public String getCartype() {
		return cartype;
	}

	public void setCartype(String cartype) {
		this.cartype = cartype;
	}

	@Override
	public String toString() {
		return "Driver [id=" + id + ", pw=" + pw + ", name=" + name + ", regdate=" + regdate + ", moddate=" + moddate
				+ ", dateOfBirth=" + dateOfBirth + ", dLicense=" + dLicense + ", bLicense=" + bLicense + ", carpic="
				+ carpic + ", cartype=" + cartype + "]";
	}

}
