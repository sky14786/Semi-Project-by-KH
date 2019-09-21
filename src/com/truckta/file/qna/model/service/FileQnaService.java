package com.truckta.file.qna.model.service;

import java.sql.Connection;
import java.util.List;

import com.truckta.file.qna.model.dao.FileQnaDao;
import com.truckta.file.qna.model.vo.FileQna;

import common.template.JDBCTemplate;

public class FileQnaService {
	private FileQnaDao dao = new FileQnaDao();

	public List<FileQna> findFileList(int boardNo) {
		Connection conn = JDBCTemplate.getConnection();
		List<FileQna> list = dao.findFileList(conn, boardNo);
		JDBCTemplate.close(conn);
		return list;
	}
}
