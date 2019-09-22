package com.truckta.file.matching.model.service;

import java.sql.Connection;
import java.util.List;

import com.truckta.file.matching.model.dao.FileMatchingDao;
import com.truckta.file.matching.model.vo.FileMatching;

import common.template.JDBCTemplate;

public class FileMatchingService {
	private FileMatchingDao dao = new FileMatchingDao();
	
	public List<FileMatching> selectListPage(int cPage, int numPerPage){
		Connection conn = JDBCTemplate.getConnection();
		List<FileMatching> list = dao.selectListPage(conn,cPage,numPerPage);
		JDBCTemplate.close(conn);
		return list;
	}
	
	public int selectCountFileMatching() {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.selectCountFileMatching(conn);
		JDBCTemplate.close(conn);
		return result;
	}

	public List<FileMatching> selectFileList() {
		Connection conn = JDBCTemplate.getConnection();
		List<FileMatching> fileList = dao.selectFileList(conn);
		return fileList;
	}
			
}
