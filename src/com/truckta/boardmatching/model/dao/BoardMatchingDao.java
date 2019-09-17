package com.truckta.boardmatching.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.truckta.boardmatching.model.vo.BoardMatching;
import com.truckta.client.model.vo.Client;
import com.truckta.file.matching.model.vo.FileMatching;

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

	// 글 업로드
	public int insertBoardMatching(Connection conn, BoardMatching bm) {
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBoardMatching");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bm.getWrtier());
			pstmt.setString(2, bm.getTitle());
			pstmt.setString(3, bm.getStartAddr());
			pstmt.setString(4, bm.getEndAddr());
			pstmt.setString(5, bm.getEtc());
			pstmt.setInt(6, bm.getCarTypeNo());
			pstmt.setString(7, bm.getMemo());
			java.sql.Date sqlDate = new java.sql.Date(bm.getHireDate().getTime());
			pstmt.setDate(8, sqlDate);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
		
	}
	
	// 글 수정
	public int updateBoardMatching(Connection conn, BoardMatching bm) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateBoardMatching");
		int result = 0;
		try {
			//update board_matching set start_addr=?, end_addr=?, etc=?, car_type_no=?, memo=?, hire_date=? where board_no=?
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bm.getStartAddr());
			pstmt.setString(2, bm.getEndAddr());
			pstmt.setString(3, bm.getEtc());
			pstmt.setInt(4, bm.getCarTypeNo());
			pstmt.setString(5, bm.getMemo());
			java.sql.Date sqlDate = new java.sql.Date(bm.getHireDate().getTime());
			pstmt.setDate(6, sqlDate);
			pstmt.setInt(7, bm.getBoardNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	// 글 불러오기
	public BoardMatching loadBoardMatching(Connection conn, String wirter, int boardNum){
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("loadBoardMatching");
		BoardMatching bm = null;
		ResultSet rs = null;
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, wirter);
			pstmt.setInt(2, boardNum);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				bm = new BoardMatching();
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
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return bm;
	}
	
	// boardNum
	public int searchBoardNum(Connection conn, BoardMatching bm) {
		PreparedStatement pstmt = null;
		String sql =  prop.getProperty("BoardMatchingNum");
		int result = 0;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bm.getWrtier());
			pstmt.setString(2, bm.getTitle());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		return result;
		
	}
	//보드 이미지 파일 저장
	public int insertImgBoardMatching(Connection conn, List<FileMatching> list) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBoardImgs");
		int result = 0;
		try {
			for (int i = 0; i < list.size(); i++) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, list.get(i).getBaordNo());
				pstmt.setString(2, list.get(i).getFileName());
	
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	// 보드 이미지 삭제(실패)
	public int deleteImg(Connection conn, int resultBoNum) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("boardImgDelete");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resultBoNum);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
	}
	// 보드 이미지 부분삭제
	public int modImg(Connection conn, int boardNum, String imgTemp[]) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("boardModDel");
		int result = 0;
		try {
			for (int i = 0; i < imgTemp.length; i++) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, imgTemp[i]);
				pstmt.setInt(2, boardNum);
				
				result = pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
	}
	
	// 보드 이미지 불러오기
	public List<FileMatching> loadBoardImg(Connection conn, int boNum){
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("boardImgLoad");
		ResultSet rs = null;
		List<FileMatching> list = new ArrayList<FileMatching>();
		FileMatching fm = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boNum);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				fm = new FileMatching();
				fm.setBaordNo(rs.getInt(1));
				fm.setFileName(rs.getString(2));
				list.add(fm);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	
	// 게시판 글 삭제(상태값 변경)
	public int boardDelete(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("boardDelete");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
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

	//  해당 페이지의 리스트목록을 불러옴
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

}
