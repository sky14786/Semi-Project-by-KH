package com.truckta.boardmatching.model.vo;

import java.sql.Date;

public class BoardMatching {
	private int boardNo;
	private String wrtier;
	private String title;
	private String startAddr;
	private String endAddr;
	private String etc;
	private String stuffSize;
	private String memo;
	private Date hireDate;
	private int boardState;
	private String pic1, pic2, pic3, pic4, pic5;
	private int count;

	public BoardMatching() {
		// TODO Auto-generated constructor stub
	}

	public BoardMatching(int boardNo, String wrtier, String title, String startAddr, String endAddr, String etc,
			String stuffSize, String memo, Date hireDate, int boardState, String pic1, String pic2, String pic3,
			String pic4, String pic5, int count) {
		super();
		this.boardNo = boardNo;
		this.wrtier = wrtier;
		this.title = title;
		this.startAddr = startAddr;
		this.endAddr = endAddr;
		this.etc = etc;
		this.stuffSize = stuffSize;
		this.memo = memo;
		this.hireDate = hireDate;
		this.boardState = boardState;
		this.pic1 = pic1;
		this.pic2 = pic2;
		this.pic3 = pic3;
		this.pic4 = pic4;
		this.pic5 = pic5;
		this.count = count;
	}
	
	

	public BoardMatching(String wrtier, String title, String startAddr, String endAddr, String etc) {
		super();
		this.wrtier = wrtier;
		this.title = title;
		this.startAddr = startAddr;
		this.endAddr = endAddr;
		this.etc = etc;
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

	public String getStuffSize() {
		return stuffSize;
	}

	public void setStuffSize(String stuffSize) {
		this.stuffSize = stuffSize;
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

	public String getPic1() {
		return pic1;
	}

	public void setPic1(String pic1) {
		this.pic1 = pic1;
	}

	public String getPic2() {
		return pic2;
	}

	public void setPic2(String pic2) {
		this.pic2 = pic2;
	}

	public String getPic3() {
		return pic3;
	}

	public void setPic3(String pic3) {
		this.pic3 = pic3;
	}

	public String getPic4() {
		return pic4;
	}

	public void setPic4(String pic4) {
		this.pic4 = pic4;
	}

	public String getPic5() {
		return pic5;
	}

	public void setPic5(String pic5) {
		this.pic5 = pic5;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "BoardMatching [boardNo=" + boardNo + ", wrtier=" + wrtier + ", title=" + title + ", startAddr="
				+ startAddr + ", endAddr=" + endAddr + ", etc=" + etc + ", stuffSize=" + stuffSize + ", memo=" + memo
				+ ", hireDate=" + hireDate + ", boardState=" + boardState + ", pic1=" + pic1 + ", pic2=" + pic2
				+ ", pic3=" + pic3 + ", pic4=" + pic4 + ", pic5=" + pic5 + ", count=" + count + "]";
	}

}
