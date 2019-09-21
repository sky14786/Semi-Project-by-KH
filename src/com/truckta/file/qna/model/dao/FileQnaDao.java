package com.truckta.file.qna.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.truckta.file.qna.model.vo.FileQna;

import common.template.JDBCTemplate;

public class FileQnaDao {
	Properties prop = new Properties();

	public FileQnaDao() {
		String path = getClass().getResource("/").getPath() + "sql/fileqna/fileqna-query.properties";
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<FileQna> findFileList(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("findFileList");
		List<FileQna> list = new ArrayList<FileQna>();
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				FileQna temp = new FileQna();
				temp.setBoardNo(rs.getInt("board_no"));
				temp.setFileName(rs.getString("file_name"));
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

	public int deleteQnaFile(Connection conn, String fileName) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteQnaFile");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fileName);
			result = pstmt.executeUpdate();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int uploadQnaFile(Connection conn, FileQna fileQna) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("uploadQnaFile");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fileQna.getBoardNo());
			pstmt.setString(2, fileQna.getFileName());

			result = pstmt.executeUpdate();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
}
