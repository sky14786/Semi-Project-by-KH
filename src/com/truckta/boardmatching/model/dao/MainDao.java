package com.truckta.boardmatching.model.dao;

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

import com.truckta.boardmatching.model.vo.BoardMatching;
import com.truckta.file.matching.model.vo.FileMatching;

public class MainDao {
	private Properties prop = new Properties();

	public MainDao() {
		String path = getClass().getResource("/").getPath() + "sql/boardmatching/boardmatching-query.properties";
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<BoardMatching> selectList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BoardMatching> list = new ArrayList();
		String sql = prop.getProperty("selectList");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardMatching bm = new BoardMatching();
				
				bm.setBoardNo(rs.getInt("board_no"));
				bm.setWrtier(rs.getString("writer"));
				bm.setTitle(rs.getString("title"));
				bm.setStartAddr(rs.getString("start_addr"));
				bm.setEndAddr(rs.getString("end_addr"));
				bm.setEtc(rs.getString("etc"));
				bm.setCarTypeNo(Integer.parseInt(rs.getString("car_type_no")));
				bm.setMemo(rs.getString("memo"));
				bm.setHireDate(rs.getDate("hire_date"));
				bm.setBoardState(rs.getInt("board_state"));
				

				list.add(bm);
			}
			//System.out.println("파일경로불러와졋니?dao"+list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;

	}
	
	public int selectCountMember(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("selectCountMember");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt("cnt");
				// result=rs.getInt(1);//�ε����� �ҷ�����
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	public List<BoardMatching> selectListPage(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BoardMatching> list = new ArrayList();
		String sql = prop.getProperty("selectListPage");
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
				bm.setCarTypeNo(Integer.parseInt(rs.getString("car_type_no")));
				bm.setMemo(rs.getString("memo"));
				bm.setHireDate(rs.getDate("hire_date"));
				bm.setBoardState(rs.getInt("board_state"));
				
				list.add(bm);
			}
			//System.out.println(list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	
	public int selectCountMember(Connection conn, String key) {
		Statement stmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "select count(*) as cnt from Board_Matching where title like '%" + key + "%' or start_addr like '%"
				+ key + "%' or end_addr like '%" + key + "%'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				result = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);

		}
		return result;
	}

	public List<BoardMatching> selectMemberList(Connection conn, String key, int cPage, int numPerPage) {
		Statement stmt = null;
		ResultSet rs = null;
		List<BoardMatching> list = new ArrayList();

		int start = (cPage - 1) * numPerPage + 1;
		int end = cPage * numPerPage;
		String sql = "select * from (" + "select rownum as rnum, a.*from(" + "select * from Board_Matching where title" //
				+ " like '%" + key + "%' or start_addr like '%" + key + "%' or end_addr like '%" + key + "%')a) "
				+ "where rnum between " + start + " and " + end;
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
				bm.setCarTypeNo(Integer.parseInt(rs.getString("car_type_no")));
				bm.setMemo(rs.getString("memo"));
				bm.setHireDate(rs.getDate("hire_date"));
				bm.setBoardState(rs.getInt("board_state"));
				list.add(bm);
			}
			//System.out.println("#####search dao : "+list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return list;
	}

	public List<BoardMatching> guSearchList(Connection conn, String gu) {

		List<BoardMatching> list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from Board_Matching where end_addr=" + "'" + gu + "' or start_addr=" + "'" + gu + "'";
		//System.out.println("#####maindao:" + sql);
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
				bm.setCarTypeNo(Integer.parseInt(rs.getString("car_type_no")));
				bm.setMemo(rs.getString("memo"));
				bm.setHireDate(rs.getDate("hire_date"));
				bm.setBoardState(rs.getInt("board_state"));
				list.add(bm);
			}
			//System.out.println("#########dao:" + list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return list;
	}

	public List<FileMatching> fileSearch(Connection conn) {
		List<FileMatching> list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select*from file_matching";
		System.out.println("#######file_matching sql:" + sql);
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				FileMatching fm = new FileMatching();
				fm.setBoardNo(rs.getInt("BOARD_NO"));
				fm.setFileName(rs.getString("FILE_NAME"));
				list.add(fm);
			}
			//System.out.println("#########file_matching dao:" + list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return list;
	}

	public int selectCountBoardMatching(Connection conn, String selectGu) {
		Statement stmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "select count(*) as cnt from Board_Matching where start_addr like '%" + selectGu
				+ "%' or end_addr like '%" + selectGu + "%'";
//		System.out.println("#######boardmatching dao:"+sql);
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				result = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);

		}
		return result;
	}

	public List<BoardMatching> selectListPage(Connection conn, int cPage, int numPerPage, String selectGu) {
		Statement stmt = null;
		ResultSet rs = null;
		List<BoardMatching> list = new ArrayList();
		int start = (cPage - 1) * numPerPage + 1;
		int end = cPage * numPerPage;
		String sql = "select * from(select rownum as rnum, a.* from("
				+ "select * from board_matching where start_addr like '%"+ selectGu + "%' or end_addr like '%" + selectGu + "%' order by hire_date desc)a)"
				+ " where rnum between "+ start+" and "+ end;

		try {
//			System.out.println("#####list selectListpagegu dao:"+sql);
			 stmt=conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				BoardMatching bm = new BoardMatching();
				bm.setBoardNo(rs.getInt("board_no"));
				bm.setWrtier(rs.getString("writer"));
				bm.setTitle(rs.getString("title"));
				bm.setStartAddr(rs.getString("start_addr"));
				bm.setEndAddr(rs.getString("end_addr"));
				bm.setEtc(rs.getString("etc"));
				bm.setCarTypeNo(Integer.parseInt(rs.getString("car_type_no")));
				bm.setMemo(rs.getString("memo"));
				bm.setHireDate(rs.getDate("hire_date"));
				bm.setBoardState(rs.getInt("board_state"));
				list.add(bm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return list;
	}
	public List<BoardMatching> searchDate(Connection conn, int cPage, int numPerPage, String searchdate) {
		Statement stmt = null;
		ResultSet rs = null;
		List<BoardMatching> list = new ArrayList();
		
		int start = (cPage - 1) * numPerPage + 1;
		int end = cPage * numPerPage;
		String sql="select * from board_matching where tk_date="+"'"+searchdate+"'";


		try {
			//System.out.println("#####list selectListpagegu dao:"+sql);
			 stmt=conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				BoardMatching bm = new BoardMatching();
				bm.setBoardNo(rs.getInt("board_no"));
				bm.setWrtier(rs.getString("writer"));
				bm.setTitle(rs.getString("title"));
				bm.setStartAddr(rs.getString("start_addr"));
				bm.setEndAddr(rs.getString("end_addr"));
				bm.setEtc(rs.getString("etc"));
				bm.setCarTypeNo(Integer.parseInt(rs.getString("car_type_no")));
				bm.setMemo(rs.getString("memo"));
				bm.setHireDate(rs.getDate("hire_date"));
				bm.setBoardState(rs.getInt("board_state"));
				bm.setTkDate(rs.getDate("tk_date"));
				list.add(bm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return list;
	}
}
