package com.truckta.boardqna.q.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.truckta.boardqna.q.model.vo.BoardQnaQ;

import common.template.JDBCTemplate;

public class BoardQnaQDao {
	Properties prop = new Properties();

	public BoardQnaQDao() {
		String path = getClass().getResource("/").getPath() + "sql/boardqnaq/boardqnaq-query.properties";
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<BoardQnaQ> selectListPage(Connection conn, int cPage, int numPerPage, int type) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectListPage");
		List<BoardQnaQ> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, type);
			pstmt.setInt(2, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(3, cPage * numPerPage);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardQnaQ temp = new BoardQnaQ();
				temp.setBoardNo(rs.getInt("board_no"));
				temp.setqUser(rs.getString("q_user"));
				temp.setTitle(rs.getString("title"));
				temp.setEtc(rs.getString("etc"));
				temp.setHireDate(rs.getDate("hire_date"));
				temp.setStatus(rs.getInt("status"));
				temp.setType(rs.getInt("type"));
				list.add(temp);
			}

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public int selectCountBoardQnaQ(Connection conn, int type) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("selectCountBoardQnaQ");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, type);
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
}
