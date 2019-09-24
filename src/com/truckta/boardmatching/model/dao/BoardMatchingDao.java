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

	// 전체 리스트(마이페이지)
	public List<BoardMatching> myAllList(Connection conn, String writer) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("myAllList");
		List<BoardMatching> list = new ArrayList<BoardMatching>();
		BoardMatching bm = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
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
				bm.setTkDate(rs.getDate("tk_date"));
				bm.setBoardState(rs.getInt("board_state"));
				bm.setCount(rs.getInt("count"));
				bm.setHireDate(rs.getDate("hire_date"));
				list.add(bm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;

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
	public BoardMatching loadBoardMatching(Connection conn, String wirter, int boardNum) {
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
				bm.setTkDate(rs.getDate("tk_date"));
				bm.setBoardState(rs.getInt("board_state"));
				bm.setCount(rs.getInt("count"));
				bm.setHireDate(rs.getDate("hire_date"));
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
		String sql = prop.getProperty("BoardMatchingNum");
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

	// 보드 이미지 파일 저장
	public int insertImgBoardMatching(Connection conn, List<FileMatching> list) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBoardImgs");
		int result = 0;
		System.out.println(list.size() + "fadjfda;sfladsjfkl;aj");
		try {
			for (int i = 0; i < list.size(); i++) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, list.get(i).getBoardNo());
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
	public List<FileMatching> loadBoardImg(Connection conn, int boNum) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("boardImgLoad");
		ResultSet rs = null;
		List<FileMatching> list = new ArrayList<FileMatching>();
		FileMatching fm = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boNum);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				fm = new FileMatching();
				fm.setBoardNo(rs.getInt(1));
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
				bm.setTkDate(rs.getDate("tk_date"));
				bm.setBoardState(rs.getInt("board_state"));
				bm.setTkDate(rs.getDate("tk_date"));
				bm.setCount(rs.getInt("count"));
				bm.setHireDate(rs.getDate("hire_date"));
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

	// 전체 리스트(마이페이지)
	public List<BoardMatching> myAllList(Connection conn, String writer, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("myAllList");
		List<BoardMatching> list = new ArrayList<BoardMatching>();
		BoardMatching bm = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			pstmt.setInt(2, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(3, cPage * numPerPage);
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
				bm.setTkDate(rs.getDate("tk_date"));
				bm.setBoardState(rs.getInt("board_state"));
				bm.setCount(rs.getInt("count"));
				bm.setHireDate(rs.getDate("hire_date"));
				list.add(bm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;

	}

	// 보드매칭테이블 / 매칭태이블 / 드라이버
	public List<List> matchingList(Connection conn, String writer) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("matchingList");
		ResultSet rs = null;
		List<List> list = new ArrayList<List>();
		List listTmp = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// 배송날짜 목적지-도착지 id pay
				listTmp = new ArrayList();
				listTmp.add(rs.getDate("tk_date"));
				listTmp.add(rs.getString("start_addr"));
				listTmp.add(rs.getString("end_addr"));
				listTmp.add(rs.getString("id"));
				listTmp.add(rs.getInt("pay"));
				listTmp.add(rs.getString("board_no"));
				list.add(listTmp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	// 보드매칭완료 / 보드매칭/ 드라이버 / 보드매칭테이블
	public List<List> matchingCompleteList(Connection conn, String writer) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("matchingCompleteList");
		ResultSet rs = null;
		List<List> list = new ArrayList<List>();
		List listTmp = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				listTmp = new ArrayList();
				listTmp.add(rs.getDate("com_date"));
				listTmp.add(rs.getString("id"));
				listTmp.add(rs.getString("end_addr"));
				listTmp.add(rs.getInt("pay"));
				listTmp.add(rs.getString("board_no"));
				list.add(listTmp);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	// count
	public int matchingListCount(Connection conn, String writer) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("matchingListCount");
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	// 마이 페이지 보드매칭 top3
	public List<BoardMatching> mypageTop(Connection conn, String writer) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("myAllListTop");
		List<BoardMatching> list = new ArrayList<BoardMatching>();
		ResultSet rs = null;
		BoardMatching bm = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
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
				bm.setTkDate(rs.getDate("tk_date"));
				bm.setBoardState(rs.getInt("board_state"));
				bm.setCount(rs.getInt("count"));
				bm.setHireDate(rs.getDate("hire_date"));
				list.add(bm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
		String sql = "select * from(select rownum as rnum, a.* from(select * from board_matching where " + search
				+ " like '%" + searchKeyword + "%' order by hire_date desc)a) where rnum between "
				+ ((cPage - 1) * numPerPage + 1) + " and " + (cPage * numPerPage);
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
				bm.setTkDate(rs.getDate("tk_date"));
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

	public BoardMatching findBoard(Connection conn, int boardNum) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("findBoard");
		ResultSet rs = null;
		BoardMatching bm = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
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
				bm.setTkDate(rs.getDate("tk_date"));
				bm.setBoardState(rs.getInt("board_state"));
				bm.setCount(rs.getInt("count"));
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return bm;
	}

}
