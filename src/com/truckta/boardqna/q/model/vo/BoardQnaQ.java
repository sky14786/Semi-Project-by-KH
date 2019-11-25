package com.truckta.boardqna.q.model.vo;

import java.sql.Date;

public class BoardQnaQ {
	private int boardNo;
	private String qUser;
	private String title;
	private String etc;
	private Date hireDate;
	private int status;
	private int type;

	public BoardQnaQ() {
		// TODO Auto-generated constructor stub
	}
	
	 public BoardQnaQ(String title,String qUser,String etc) { this.title=title;
	 this.qUser=qUser; this.etc=etc;
	 }
	 
	
	public BoardQnaQ(String title,String qUser,String etc,int type) {
		this.title = title;
		this.qUser = qUser;
		this.etc = etc;
		this.type = type;
	}

	public BoardQnaQ(int boardNo, String qUser, String title, String etc, Date hireDate, int status, int type) {
		super();
		this.boardNo = boardNo;
		this.qUser = qUser;
		this.title = title;
		this.etc = etc;
		this.hireDate = hireDate;
		this.status = status;
		this.type = type;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getqUser() {
		return qUser;
	}

	public void setqUser(String qUser) {
		this.qUser = qUser;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "BoardQnaQ [boardNo=" + boardNo + ", qUser=" + qUser + ", title=" + title + ", etc=" + etc
				+ ", hireDate=" + hireDate + ", status=" + status + ", type=" + type + "]";
	}

}
