package com.truckta.boardmatching.model.vo;

import java.sql.Date;

public class BoardMatching {
	private int boardNo;
	private String wrtier;
	private int carTypeNo;
	private String title;
	private String startAddr;
	private String endAddr;
	private String etc;
	private String memo;
	private Date hireDate;
	private int boardState;
	private int count;
	private Date tkDate;
	
	public BoardMatching() {
		// TODO Auto-generated constructor stub
	}

	public BoardMatching(int boardNo, String wrtier, int carTypeNo, String title, String startAddr, String endAddr,
			String etc, String memo, Date hireDate, int boardState, int count, Date tkDate) {
		super();
		this.boardNo = boardNo;
		this.wrtier = wrtier;
		this.carTypeNo = carTypeNo;
		this.title = title;
		this.startAddr = startAddr;
		this.endAddr = endAddr;
		this.etc = etc;
		this.memo = memo;
		this.hireDate = hireDate;
		this.boardState = boardState;
		this.count = count;
		this.tkDate = tkDate;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getWrtier() {
		return wrtier;
	}

	public void setWrtier(String wrtier) {
		this.wrtier = wrtier;
	}

	public int getCarTypeNo() {
		return carTypeNo;
	}

	public void setCarTypeNo(int carTypeNo) {
		this.carTypeNo = carTypeNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStartAddr() {
		return startAddr;
	}

	public void setStartAddr(String startAddr) {
		this.startAddr = startAddr;
	}

	public String getEndAddr() {
		return endAddr;
	}

	public void setEndAddr(String endAddr) {
		this.endAddr = endAddr;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public Date getHireDate() {
		return hireDate;
	}

	public void setHireDate(Date hireDate) {
		this.hireDate = hireDate;
	}

	public int getBoardState() {
		return boardState;
	}

	public void setBoardState(int boardState) {
		this.boardState = boardState;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Date getTkDate() {
		return tkDate;
	}

	public void setTkDate(Date tkDate) {
		this.tkDate = tkDate;
	}

	@Override
	public String toString() {
		return "BoardMatching [boardNo=" + boardNo + ", wrtier=" + wrtier + ", carTypeNo=" + carTypeNo + ", title="
				+ title + ", startAddr=" + startAddr + ", endAddr=" + endAddr + ", etc=" + etc + ", memo=" + memo
				+ ", hireDate=" + hireDate + ", boardState=" + boardState + ", count=" + count + ", tkDate=" + tkDate
				+ "]";
	}

		
}
