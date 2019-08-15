package com.truckta.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.truckta.model.vo.Driver;

import common.template.JDBCTemplate;

public class DriverDao {
	Properties prop = new Properties();

	public DriverDao() {
		try {
			String path = this.getClass().getResource("/").getPath();
			prop.load(new FileReader(path + "../resource/properties/DriverQuery.properties"));
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
			pstmt.setString(2, temp.getPw());
			pstmt.setString(3, temp.getName());
			pstmt.setDate(4, temp.getDateOfBirth());
			pstmt.setString(5, temp.getCartype());
			pstmt.setString(6, temp.getdLicense());
			pstmt.setString(7, temp.getbLicense());
			pstmt.setString(8, temp.getCarpic());

			result = pstmt.executeUpdate();

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int selectDriver(Connection conn, String id) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectDriver");
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = 1;
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
}
