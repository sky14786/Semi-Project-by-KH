package com.truckta.matching.model.vo;

import java.sql.Date;

public class Matching {
	private int matNo;
	private int boardNo;
	private String requestor;
	private String responser;
	private int pay;
	private String memo;
	private Date tryDate;

	public Matching() {
		// TODO Auto-generated constructor stub
	}

	public Matching(int matNo, int boardNo, String requestor, String responser, int pay, String memo, Date tryDate) {
		super();
		this.matNo = matNo;
		this.boardNo = boardNo;
		this.requestor = requestor;
		this.responser = responser;
		this.pay = pay;
		this.memo = memo;
		this.tryDate = tryDate;
	}

	public int getMatNo() {
		return matNo;
	}

	public void setMatNo(int matNo) {
		this.matNo = matNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getRequestor() {
		return requestor;
	}

	public void setRequestor(String requestor) {
		this.requestor = requestor;
	}

	public String getResponser() {
		return responser;
	}

	public void setResponser(String responser) {
		this.responser = responser;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public Date getTryDate() {
		return tryDate;
	}

	public void setTryDate(Date tryDate) {
		this.tryDate = tryDate;
	}

}
