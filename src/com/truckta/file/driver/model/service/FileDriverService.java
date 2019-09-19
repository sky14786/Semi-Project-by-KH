package com.truckta.file.driver.model.service;

import java.sql.Connection;
import java.util.List;

import com.truckta.file.driver.model.dao.FileDriverDao;
import com.truckta.file.driver.model.vo.FileDriver;

import common.template.JDBCTemplate;

public class FileDriverService {
	private FileDriverDao dao = new FileDriverDao();

	public int joinDriver(List<FileDriver> files) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.joinDriver(conn, files);
		if (result == 1) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}
}
