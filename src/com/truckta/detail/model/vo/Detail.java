package com.truckta.detail.model.vo;

import java.util.Date;

public class Detail {
	
	private int boardNo;
	private String writer;
	private String title;
	private String startAddr;
	private String endAddr;
	private String etc;
	private int carTypeNo;
	private String carType;
	private String memo;
	private Date hireDate;
	private int boardState; // 0 delete 1 alive
	private int count;
	private String name;
	
	
	public Detail() {
		// TODO Auto-generated constructor stub
	}


	public Detail(int boardNo, String writer, String title, String startAddr, String endAddr, String etc, int carTypeNo,
			String carType, String memo, Date hireDate, int boardState, int count, String name) {
		super();
		this.boardNo = boardNo;
		this.writer = writer;
		this.title = title;
		this.startAddr = startAddr;
		this.endAddr = endAddr;
		this.etc = etc;
		this.carTypeNo = carTypeNo;
		this.carType = carType;
		this.memo = memo;
		this.hireDate = hireDate;
		this.boardState = boardState;
		this.count = count;
		this.name = name;
	}


	public int getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
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


	public int getCarTypeNo() {
		return carTypeNo;
	}


	public void setCarTypeNo(int carTypeNo) {
		this.carTypeNo = carTypeNo;
	}


	public String getCarType() {
		return carType;
	}


	public void setCarType(String carType) {
		this.carType = carType;
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


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	@Override
	public String toString() {
		return "Detail [boardNo=" + boardNo + ", writer=" + writer + ", title=" + title + ", startAddr=" + startAddr
				+ ", endAddr=" + endAddr + ", etc=" + etc + ", carTypeNo=" + carTypeNo + ", carType=" + carType
				+ ", memo=" + memo + ", hireDate=" + hireDate + ", boardState=" + boardState + ", count=" + count
				+ ", name=" + name + "]";
	}

}
