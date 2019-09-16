package com.truckta.file.matching.model.vo;

public class FileMatching {
	private int baordNo;
	private String fileName;

	public FileMatching() {
		// TODO Auto-generated constructor stub
	}

	public FileMatching(int baordNo, String fileName) {
		super();
		this.baordNo = baordNo;
		this.fileName = fileName;
	}

	public int getBaordNo() {
		return baordNo;
	}

	public void setBaordNo(int baordNo) {
		this.baordNo = baordNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

}
