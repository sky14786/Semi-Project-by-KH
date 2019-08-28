package com.truckta.driver.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.truckta.driver.model.vo.Driver;

import common.template.JDBCTemplate;

public class DriverDao {
	Properties prop = new Properties();

	public DriverDao() {
		String path = getClass().getResource("/").getPath()+"sql/driver/driver-query.properties";
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int joinDriver(Connection conn, Driver temp) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("joinDriver");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, temp.getId());
			pstmt.setString(2, temp.getDateOfBirth());
			pstmt.setString(3, temp.getCarType());
			pstmt.setString(4, temp.getdLicense());
			pstmt.setString(5, temp.getbLicense());
			pstmt.setString(6, temp.getCarPic());

			result = pstmt.executeUpdate();

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

}
