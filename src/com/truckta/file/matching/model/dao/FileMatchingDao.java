package com.truckta.file.matching.model.dao;

import static common.template.JDBCTemplate.close;

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

import com.truckta.file.matching.model.vo.FileMatching;

import common.template.JDBCTemplate;

public class FileMatchingDao {
	private Properties prop = new Properties();

	public FileMatchingDao() {
		String path = getClass().getResource("/").getPath() + "sql/filematching/filematching-query.properties";
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<FileMatching> selectListPage(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<FileMatching> list = new ArrayList();
		String sql = prop.getProperty("selectListPage");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(2, cPage * numPerPage);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				FileMatching fm = new FileMatching();
				fm.setBoardNo(rs.getInt("board_no"));
				fm.setFileName(rs.getString("file_name"));
				list.add(fm);
				//System.out.println("###12333daofilematching:"+list);
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public int selectCountFileMatching(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("selectCountFileMatching");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);

		}
		return result;
	}

	   public List<FileMatching> detailimg(Connection conn,String boardNo) {
		      Statement stmt = null;
		      ResultSet rs = null;
		      List<FileMatching> fileList = new ArrayList();
		      System.out.println("daoboardNo"+boardNo);
		      String sql = "SELECT board_matching.*, file_matching.file_Name FROM board_matching INNER JOIN file_matching ON  board_matching.board_NO = file_matching.board_No where board_matching.board_no="+boardNo;
		      try {
		         stmt = conn.prepareStatement(sql);
		         
		         rs = stmt.executeQuery(sql);

		         while (rs.next()) {
		            FileMatching fm = new FileMatching();
		            fm.setBoardNo(rs.getInt("board_no"));
		            fm.setFileName(rs.getString("file_name"));
		            fileList.add(fm);
		         }
		         
		      } catch (SQLException sqle) {
		         sqle.printStackTrace();
		      } finally {
		         JDBCTemplate.close(rs);
		         JDBCTemplate.close(stmt);
		      }
		      return fileList;
		   }

}
