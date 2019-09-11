package com.truckta.file.driver.model.vo;

public class FileDriver {
	private String id;
	private String fileName;

	public FileDriver() {
		// TODO Auto-generated constructor stub
	}

	public FileDriver(String id, String fileName) {
		super();
		this.id = id;
		this.fileName = fileName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

}
