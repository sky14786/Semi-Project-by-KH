package com.truckta.boardmatching.model.dao;

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

import com.truckta.boardmatching.model.vo.BoardMatching;
import com.truckta.client.model.vo.Client;

import common.template.JDBCTemplate;

public class BoardMatchingDao {
	Properties prop = new Properties();

	public BoardMatchingDao() {
		String path = getClass().getResource("/").getPath() + "sql/boardmatching/boardmatching-query.properties";
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int wrtieBoardMatching(Connection conn, BoardMatching bTemp) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("writeBoardMatching");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bTemp.getWrtier());
			pstmt.setString(2, bTemp.getTitle());
			pstmt.setString(3, bTemp.getStartAddr());
			pstmt.setString(4, bTemp.getEndAddr());
			pstmt.setString(5, bTemp.getEtc());

			result = pstmt.executeUpdate();

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	// 사용자매칭 업로드 글 전체 갯수
	public int selectCountBoardMatching(Connection conn) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectCountBoardMatching");
		int result = 0;
		ResultSet rs = null;
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

	// 해당 페이지의 리스트목록을 불러옴
	public List<BoardMatching> selectListPage(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectListPage");
		List<BoardMatching> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(2, cPage * numPerPage);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardMatching bm = new BoardMatching();
				bm.setBoardNo(rs.getInt("board_no"));
				bm.setWrtier(rs.getString("writer"));
				bm.setTitle(rs.getString("title"));
				bm.setStartAddr(rs.getString("start_addr"));
				bm.setEndAddr(rs.getString("end_addr"));
				bm.setEtc(rs.getString("etc"));
				bm.setCarTypeNo(rs.getInt("car_type_no"));
				bm.setMemo(rs.getString("memo"));
				bm.setHireDate(rs.getDate("hire_date"));
				bm.setBoardState(rs.getInt("board_state"));
				bm.setCount(rs.getInt("count"));
				list.add(bm);
			}

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public int deleteBoardMatching(Connection conn, int no) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteBoardMatching");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int selectSearchCountBoardMatching(Connection conn, String search, String searchKeyword) {
		Statement stmt = null;
		String sql = "select count(*) as cnt from board_matching where " + search + " like '%" + searchKeyword + "%'";
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
	public List<BoardMatching> selectSearchListPage(Connection conn, int cPage, int numPerPage, String search,
			String searchKeyword) {
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from(select rownum as rnum, a.* from(select * from board_matching where " + search + " like '%"
				+ searchKeyword + "%' order by hire_date desc)a) where rnum between " + ((cPage - 1) * numPerPage + 1)
				+ " and " + (cPage * numPerPage);
		List<BoardMatching> list = new ArrayList();
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				BoardMatching bm = new BoardMatching();
				bm.setBoardNo(rs.getInt("board_no"));
				bm.setWrtier(rs.getString("writer"));
				bm.setTitle(rs.getString("title"));
				bm.setStartAddr(rs.getString("start_addr"));
				bm.setEndAddr(rs.getString("end_addr"));
				bm.setEtc(rs.getString("etc"));
				bm.setCarTypeNo(rs.getInt("car_type_no"));
				bm.setMemo(rs.getString("memo"));
				bm.setHireDate(rs.getDate("hire_date"));
				bm.setBoardState(rs.getInt("board_state"));
				bm.setCount(rs.getInt("count"));
				list.add(bm);
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
