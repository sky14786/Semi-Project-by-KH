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
		if (result == files.size()) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	public int joinDriver(FileDriver fd) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.joinDriver(conn, fd);
		if(result==1) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public List<FileDriver> findDriverFile(String id) {
		Connection conn = JDBCTemplate.getConnection();
		List<FileDriver> fileNames = dao.findDriverFile(conn, id);
		JDBCTemplate.close(conn);
//		System.out.println("service"+fileNames.toString());
		return fileNames;
	}

	public int deleteDriverFile(String fileName) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.deleteDriverFile(conn, fileName);
		if (result == 1) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	   public List<FileDriver> selectAllFiles() {
		      Connection conn = JDBCTemplate.getConnection();
		      List<FileDriver> list = dao.selectAllFiles(conn);
		      JDBCTemplate.close(conn);
		      return list;
		   }

}
