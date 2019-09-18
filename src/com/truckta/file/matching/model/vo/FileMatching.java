package com.truckta.file.matching.model.vo;

public class FileMatching {
	private int boardNo;
	private String fileName;

	public FileMatching() {
		// TODO Auto-generated constructor stub
	}

	public FileMatching(int boardNo, String fileName) {
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

	@Override
	public String toString() {
		return "FileMatching [baordNo=" + boardNo + ", fileName=" + fileName + "]";
	}

}
