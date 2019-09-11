package com.truckta.file.qna.model.vo;

public class FileQna {
	private int boardNo;
	private String fileName;

	public FileQna() {
		// TODO Auto-generated constructor stub
	}

	public FileQna(int boardNo, String fileName) {
		super();
		this.boardNo = boardNo;
		this.fileName = fileName;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

}
