package com.truckta.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.truckta.common.JDBCTemplate;
import com.truckta.model.vo.Client;

public class ClientDao {
	Properties prop = new Properties();

	public ClientDao() {
		try {
			prop.load(new FileReader("../resources/ClientQuery.properties"));
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

			result = pstmt.executeUpdate();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
}
