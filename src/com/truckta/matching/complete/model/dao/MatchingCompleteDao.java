package com.truckta.matching.complete.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.truckta.client.model.vo.Client;
import com.truckta.matching.complete.model.vo.MatchingComplete;

import common.template.JDBCTemplate;

public class MatchingCompleteDao {
	Properties prop = new Properties();

	public MatchingCompleteDao() {
		String path = getClass().getResource("/").getPath() + "/sql/matchingcomplete/matchingcomplete-query.properties";
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int selectCountMatchingComplete(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("selectCountMatchingComplete");
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

	public List<MatchingComplete> selectListPage(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectListPage");
		List<MatchingComplete> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(2, cPage * numPerPage);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				MatchingComplete mc = new MatchingComplete();
				mc.setMatNo(rs.getInt("mat_no"));
				mc.setStatus(rs.getInt("status"));
				mc.setMatDate(rs.getDate("mat_date"));
				mc.setComDate(rs.getDate("com_date"));
				list.add(mc);
			}

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
}
