package com.truckta.file.driver.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.truckta.file.driver.model.vo.FileDriver;

import common.template.JDBCTemplate;

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
			for (int i = 0; i < files.size(); i++) {
				pstmt.setString(1, files.get(i).getId());
				pstmt.setString(2, files.get(i).getFileName());
				result += pstmt.executeUpdate();
			}

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public List<String> findDriverFile(Connection conn, String id) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("findDriverFile");
		List<String> fileList = new ArrayList<String>();
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				fileList.add(rs.getString("file_name"));
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return fileList;
	}

}
