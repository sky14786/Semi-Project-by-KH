package com.truckta.client.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.truckta.client.model.vo.Client;

import common.template.JDBCTemplate;

public class ClientDao {
	Properties prop = new Properties();

	public ClientDao() {
		try {
			String path = this.getClass().getResource("/").getPath();
			prop.load(new FileReader(path + "../resource/properties/ClientQuery.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int joinClient(Connection conn, Client temp) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("joinClient");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, temp.getId());
			pstmt.setString(2, temp.getPw());
			pstmt.setString(3, temp.getName());
			pstmt.setString(4, temp.getProfile());
			pstmt.setInt(5, temp.getUserType());

			result = pstmt.executeUpdate();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int findClient(Connection conn, String id, String name) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("findClient");
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
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

	public int clientDuplicateCheck(Connection conn, String id) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("clientDuplicateCheck");
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (!rs.next()) {
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

	public int resetPassword(Connection conn, String id, String pw) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("resetPassword");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);

			result = pstmt.executeUpdate();

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
}
