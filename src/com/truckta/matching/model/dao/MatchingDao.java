package com.truckta.matching.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.truckta.client.model.vo.Client;
import com.truckta.matching.model.vo.Matching;

import common.template.JDBCTemplate;

public class MatchingDao {
	Properties prop = new Properties();

	public MatchingDao() {
		String path = getClass().getResource("/").getPath() + "/sql/matching/matching-query.properties";
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<Matching> selectListPage(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectListPage");
		List<Matching> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(2, cPage * numPerPage);

			rs = pstmt.executeQuery();
			while (rs.next()) {

				Matching m = new Matching();
				m.setMatNo(rs.getInt("mat_no"));
				m.setBoardNo(rs.getInt("board_no"));
				m.setRequestor(rs.getString("requestor"));
				m.setResponser(rs.getString("responser"));
				m.setPay(rs.getInt("pay"));
				m.setMemo(rs.getString("etc"));
				m.setTryDate(rs.getDate("try_date"));

				list.add(m);
			}

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public int selectCountMatching(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("selectCountMatching");
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

	public int selectSearchCountMatching(Connection conn, String search, String searchKeyword) {
		Statement stmt = null;
		String sql = "";
		if (search.equals("user")) {
			sql = "select count(*) as cnt from matching where requestor like '%" + searchKeyword
					+ "%' or responser like '%" + searchKeyword + "%'";
		} else {
			sql = "select count(*) as cnt from matching where " + search + " like '%" + searchKeyword + "%'";
		}

		int result = 0;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				result = rs.getInt("cnt");
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(stmt);
		}
		return result;
	}

	public List<Matching> selectSearchListPage(Connection conn, int cPage, int numPerPage, String search,
			String searchKeyword) {
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		if(search.equals("user")) {
			sql = "select * from(select rownum as rnum, a.* from(select * from matching where requestor like '%"+searchKeyword+"%' or responser like '%"+searchKeyword+"%' order by try_date desc)a) where rnum between " + ((cPage - 1) * numPerPage + 1)
					+ " and " + (cPage * numPerPage);
		}else {
			sql = "select * from(select rownum as rnum, a.* from(select * from matching where " + search + " like '%"
					+ searchKeyword + "%' order by try_date desc)a) where rnum between " + ((cPage - 1) * numPerPage + 1)
					+ " and " + (cPage * numPerPage);
		}
		List<Matching> list = new ArrayList();
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {

				Matching m = new Matching();
				m.setMatNo(rs.getInt("mat_no"));
				m.setBoardNo(rs.getInt("board_no"));
				m.setRequestor(rs.getString("requestor"));
				m.setResponser(rs.getString("responser"));
				m.setPay(rs.getInt("pay"));
				m.setMemo(rs.getString("etc"));
				m.setTryDate(rs.getDate("try_date"));

				list.add(m);
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(stmt);
		}
		return list;
	}

}
