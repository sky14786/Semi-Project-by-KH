package com.truckta.boardqna.q.model.vo;

import java.sql.Date;

public class BoardQnaQ {
	private int boardNo;
	private String qUser;
	private String title;
	private String etc;
	private Date hireDate;

	public BoardQnaQ() {
		// TODO Auto-generated constructor stub
	}

	public BoardQnaQ(int boardNo, String qUser, String title, String etc, Date hireDate) {
		super();
		this.boardNo = boardNo;
		this.qUser = qUser;
		this.title = title;
		this.etc = etc;
		this.hireDate = hireDate;
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

}
