package com.truckta.boardqna.a.model.vo;

import java.sql.Date;

public class BoardQnaA {
	private int aNo;
	private int qNo;
	private String writer;
	private String etc;
	private Date hireDate;

	public BoardQnaA() {
		// TODO Auto-generated constructor stub
	}

	public BoardQnaA(int aNo, int qNo, String writer, String etc, Date hireDate) {
		super();
		this.aNo = aNo;
		this.qNo = qNo;
		this.writer = writer;
		this.etc = etc;
		this.hireDate = hireDate;
	}

	public int getaNo() {
		return aNo;
	}

	public void setaNo(int aNo) {
		this.aNo = aNo;
	}

	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	public Date getHireDate() {
		return hireDate;
	}

	public void setHireDate(Date hireDate) {
		this.hireDate = hireDate;
	}

}
