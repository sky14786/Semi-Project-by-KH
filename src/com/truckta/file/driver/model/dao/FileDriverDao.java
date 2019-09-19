package com.truckta.file.driver.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;
import java.util.Properties;

import com.truckta.file.driver.model.vo.FileDriver;

public class FileDriverDao {
	Properties prop = new Properties();

	public FileDriverDao() {
		String path = getClass().getResource("/").getPath() + "/sql/filedriver/filedriver-query.properties";
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int joinDriver(Connection conn, List<FileDriver> files) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("joinDriver");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.set
		}
		return 0;
	}

}
