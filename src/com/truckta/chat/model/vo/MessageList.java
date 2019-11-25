package com.truckta.chat.model.vo;

import java.util.Date;

public class MessageList {

	private int roomNo;
	private String userA;
	private String userB;
	private String userC;
	private String title;
	private int boardNo;
	private Date createdDate;
	
	public MessageList() {
		// TODO Auto-generated constructor stub
	}

	public MessageList(int roomNo, String userA, String userB, String userC, String title, int boardNo,
			Date createdDate) {
		super();
		this.roomNo = roomNo;
		this.userA = userA;
		this.userB = userB;
		this.userC = userC;
		this.title = title;
		this.boardNo = boardNo;
		this.createdDate = createdDate;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public String getUserA() {
		return userA;
	}

	public void setUserA(String userA) {
		this.userA = userA;
	}

	public String getUserB() {
		return userB;
	}

	public void setUserB(String userB) {
		this.userB = userB;
	}

	public String getUserC() {
		return userC;
	}

	public void setUserC(String userC) {
		this.userC = userC;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	@Override
	public String toString() {
		return "MessageList [roomNo=" + roomNo + ", userA=" + userA + ", userB=" + userB + ", userC=" + userC
				+ ", title=" + title + ", boardNo=" + boardNo + ", createdDate=" + createdDate + "]";
	}

	
}
