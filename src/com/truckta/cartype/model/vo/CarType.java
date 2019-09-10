package com.truckta.cartype.model.vo;

public class CarType {
	private int typeNo;
	private String carType;

	public CarType() {
		// TODO Auto-generated constructor stub
	}

	public CarType(int typeNo, String carType) {
		super();
		this.typeNo = typeNo;
		this.carType = carType;
	}

	public int getTypeNo() {
		return typeNo;
	}

	public void setTypeNo(int typeNo) {
		this.typeNo = typeNo;
	}

	public String getCarType() {
		return carType;
	}

	public void setCarType(String carType) {
		this.carType = carType;
	}

}
