package com.truckta.model.vo;

import java.sql.Date;

public class Driver {

	private String id;
	private String dateOfBirth;
	private String carType;
	private String dLicense;
	private String bLicense;
	private String carPic;
	private Date regDate;

	public Driver() {
	}

	public Driver(String id, String dateOfBirth, String carType, String dLicense, String bLicense, String carPic,
			Date regDate) {
		super();
		this.id = id;
		this.dateOfBirth = dateOfBirth;
		this.carType = carType;
		this.dLicense = dLicense;
		this.bLicense = bLicense;
		this.carPic = carPic;
		this.regDate = regDate;
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

	public String getCarType() {
		return carType;
	}

	public void setCarType(String carType) {
		this.carType = carType;
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

	public String getCarPic() {
		return carPic;
	}

	public void setCarPic(String carPic) {
		this.carPic = carPic;
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
				+ ", bLicense=" + bLicense + ", carPic=" + carPic + ", regDate=" + regDate + "]";
	}

}
