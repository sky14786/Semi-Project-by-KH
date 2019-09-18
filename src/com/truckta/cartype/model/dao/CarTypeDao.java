package com.truckta.cartype.model.dao;

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

import common.template.JDBCTemplate;

public class CarTypeDao {
	Properties prop = new Properties();

	public CarTypeDao() {
		String path = getClass().getResource("/").getPath() + "sql/cartype/cartype-query.properties";
		try {
			prop.load(new FileReader(path));

		} catch (IOException io) {
			io.printStackTrace();
		}
	}

	public int selectCountCarType(Connection conn) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectCountCarType");
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

	public List<CarType> selectListPage(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectListPage");
		ResultSet rs = null;
		List<CarType> list = new ArrayList<CarType>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(2, cPage * numPerPage);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				CarType ct = new CarType(rs.getInt("type_no"), rs.getString("car_type"));
				list.add(ct);
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public int insertCarType(Connection conn, String carType) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCarType");
		int result = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, carType);
			result = pstmt.executeUpdate();

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public List<CarType> selectAll(Connection conn) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectAll");
		ResultSet rs = null;
		List<CarType> list = new ArrayList<CarType>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CarType ct = new CarType(rs.getInt("type_no"), rs.getString("car_type"));
				list.add(ct);
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public int deleteCarType(Connection conn, int delTarget) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteCarType");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, delTarget);
			result = pstmt.executeUpdate();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

}
