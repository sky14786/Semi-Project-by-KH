package com.truckta.matching.complete.model.vo;

import java.sql.Date;

public class MatchingComplete {
	private int matNo;
	private int status;
	private Date matDate;
	private Date comDate;

	public MatchingComplete() {
		// TODO Auto-generated constructor stub
	}

	public MatchingComplete(int matNo, int status, Date matDate, Date comDate) {
		super();
		this.matNo = matNo;
		this.status = status;
		this.matDate = matDate;
		this.comDate = comDate;
	}

	public int getMatNo() {
		return matNo;
	}

	public void setMatNo(int matNo) {
		this.matNo = matNo;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getMatDate() {
		return matDate;
	}

	public void setMatDate(Date matDate) {
		this.matDate = matDate;
	}

	public Date getComDate() {
		return comDate;
	}

	public void setComDate(Date comDate) {
		this.comDate = comDate;
	}

}
