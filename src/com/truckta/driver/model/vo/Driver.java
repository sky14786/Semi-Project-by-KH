package com.truckta.driver.model.vo;

import java.sql.Date;

public class Driver {

	private String id;
	private String dateOfBirth;
	private int carType;
	private String dLicense;
	private String bLicense;
	private Date regDate;
	private int status;

	public Driver() {
	}

	public Driver(String id, String dateOfBirth, int carType, String dLicense, String bLicense, Date regDate,
			int status) {
		super();
		this.id = id;
		this.dateOfBirth = dateOfBirth;
		this.carType = carType;
		this.dLicense = dLicense;
		this.bLicense = bLicense;

		this.regDate = regDate;
		this.status = status;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public void setCarType(int carType) {
		this.carType = carType;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public int getCarType() {
		return carType;
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

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "Driver [id=" + id + ", dateOfBirth=" + dateOfBirth + ", carType=" + carType + ", dLicense=" + dLicense
				+ ", bLicense=" + bLicense + ", regDate=" + regDate + "]";
	}

}
