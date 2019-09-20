package com.truckta.chat.model.vo;

import java.util.Date;

public class CreateChat {
	
	private int roomNo;
	private String writerId;
	private String driverId;
	private String adminId;
	private int boardNo;
	private Date createdDate;
	
	public CreateChat() {
		// TODO Auto-generated constructor stub
	}

	public CreateChat(int roomNo, String writerId, String driverId, String adminId, int boardNo, Date createdDate) {
		super();
		this.roomNo = roomNo;
		this.writerId = writerId;
		this.driverId = driverId;
		this.adminId = adminId;
		this.boardNo = boardNo;
		this.createdDate = createdDate;
	}

	public CreateChat(String writerId, String driverId, int boardNo) {
		super();
		this.writerId = writerId;
		this.driverId = driverId;
		this.boardNo = boardNo;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public String getDriverId() {
		return driverId;
	}

	public void setDriverId(String driverId) {
		this.driverId = driverId;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
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
		return "CreateChat [roomNo=" + roomNo + ", writerId=" + writerId + ", driverId=" + driverId + ", adminId="
				+ adminId + ", boardNo=" + boardNo + ", createdDate=" + createdDate + "]";
	}
	
}
