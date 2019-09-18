package com.truckta.driver.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.truckta.cartype.model.vo.CarType;
import com.truckta.driver.model.vo.Driver;

import common.template.JDBCTemplate;

public class DriverDao {
	Properties prop = new Properties();

	public DriverDao() {
		String path = getClass().getResource("/").getPath() + "sql/driver/driver-query.properties";
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
			pstmt.setInt(2, temp.getCarType());
			pstmt.setString(3, temp.getDateOfBirth());
			pstmt.setString(4, temp.getdLicense());
			pstmt.setString(5, temp.getbLicense());
//			pstmt.setString(6, temp.getCarPic());

			result = pstmt.executeUpdate();

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int selectCountDriver(Connection conn, boolean isApprovaled) {
		PreparedStatement pstmt = null;
		String sql = isApprovaled == true ? prop.getProperty("selectCountApprovalDriver")
				: prop.getProperty("selectCountDriver");
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public List<Driver> selectListPage(Connection conn, int cPage, int numPerPage, boolean isApprovaled) {
		PreparedStatement pstmt = null;
		String sql = isApprovaled == true ? prop.getProperty("selectApprovalListPage")
				: prop.getProperty("selectListPage");
		ResultSet rs = null;
		List<Driver> list = new ArrayList<Driver>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(2, cPage * numPerPage);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				Driver d = new Driver();
				d.setId(rs.getString("id"));
				d.setCarType(rs.getInt("type_no"));
				d.setDateOfBirth(rs.getString("date_of_birth"));
				d.setdLicense(rs.getString("d_license"));
				d.setbLicense(rs.getString("b_license"));
				d.setRegDate(rs.getDate("regdate"));
				list.add(d);
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	
	// 드라이버 확인
	public int driverCheck(Connection conn, String user) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("driverCheck");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

}
