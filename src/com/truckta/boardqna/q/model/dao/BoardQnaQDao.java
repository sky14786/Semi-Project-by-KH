package com.truckta.boardqna.q.model.dao;

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

import com.truckta.boardqna.a.model.vo.BoardQnaA;
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
		List<BoardQnaQ> list = new ArrayList<BoardQnaQ>();
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

	public List<BoardQnaQ> selectBoardList(Connection conn, int cPage, int numPerPage, String qUser) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectBoardList");
		List<BoardQnaQ> list = new ArrayList<BoardQnaQ>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qUser);
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

	public int deleteQnaQ(Connection conn, int no) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteQnaQ");
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

	public BoardQnaQ findBoardQnaQ(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("findBoardQnaQ");
		BoardQnaQ temp = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				temp = new BoardQnaQ();
				temp.setBoardNo(no);
				temp.setEtc(rs.getString("etc"));
				temp.setHireDate(rs.getDate("hire_date"));
				temp.setqUser(rs.getString("q_user"));
				temp.setTitle(rs.getString("title"));
				temp.setType(rs.getInt("type"));
				temp.setStatus(rs.getInt("status"));
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return temp;
	}

	public int selectSearchCountBoardQnaQ(Connection conn, String search, String searchKeyword) {
		Statement stmt = null;
		String sql = "select count(*) as cnt from board_qna_q where " + search + " like '%" + searchKeyword + "%'";
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

	public List<BoardQnaQ> selectSearchListPage(Connection conn, int cPage, int numPerPage, String search,
			String searchKeyword) {
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from(select rownum as rnum, a.* from(select * from board_qna_q where " + search
				+ " like '%" + searchKeyword + "%' order by hire_date desc)a) where rnum between "
				+ ((cPage - 1) * numPerPage + 1) + " and " + (cPage * numPerPage);
		List<BoardQnaQ> list = new ArrayList<BoardQnaQ>();
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

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
			JDBCTemplate.close(stmt);
		}
		return list;
	}

	public int insertBoard(Connection conn, BoardQnaQ q) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertBoard");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, q.getqUser());
			pstmt.setString(2, q.getTitle());
			pstmt.setString(3, q.getEtc());
			pstmt.setInt(4, q.getStatus());
			pstmt.setInt(5, q.getType());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int selectSeqBoard(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "select qna_q_pk_seq.currval from dual";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(stmt);
		}
		return result;
	}

	public BoardQnaQ selectBoard(Connection conn, String no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardQnaQ q = null;
		String sql = prop.getProperty("selectBoard");
//		System.out.println(no);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(no));
			rs = pstmt.executeQuery();
			if (rs.next()) {
				q = new BoardQnaQ();
				q.setBoardNo(rs.getInt("board_no"));
				q.setqUser(rs.getString("q_user"));
				q.setTitle(rs.getString("title"));
				q.setEtc(rs.getString("etc"));
				q.setHireDate(rs.getDate("hire_date"));
				q.setStatus(rs.getInt("status"));
				q.setType(rs.getInt("type"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return q;

	}

	public int insertComment(Connection conn, BoardQnaA a) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertComment");
		try {
			pstmt = conn.prepareStatement(sql);
			/* aNo,etc,writer,qNo */
			pstmt.setInt(1, a.getqNo());
			pstmt.setString(2, a.getEtc());
			pstmt.setString(3, a.getWriter());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public List<BoardQnaA> selectBoardComment(Connection conn, String boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BoardQnaA> list = new ArrayList<BoardQnaA>();
		String sql = prop.getProperty("selectBoardComment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(boardNo));
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardQnaA a = new BoardQnaA();
				a.setaNo(rs.getInt("a_no"));
				a.setqNo(rs.getInt("q_no"));
				a.setWriter(rs.getString("writer"));
				a.setEtc(rs.getString("etc"));
				a.setHireDate(rs.getDate("hire_date"));
				list.add(a);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public int deleteBoard(Connection conn, int boardNo, int type) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteBoard");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			pstmt.setInt(2, type);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int upLoadBoard(Connection conn, BoardQnaQ q) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("upLoadBoard");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, q.getTitle());
			pstmt.setString(2, q.getEtc());
			pstmt.setInt(3, q.getType());
			pstmt.setString(4, q.getqUser());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int deleteComment(Connection conn, int qNo, int aNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteComment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qNo);
			pstmt.setInt(2, aNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int updateComment(Connection conn, BoardQnaA a) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateComment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a.getEtc());
			pstmt.setInt(2, a.getaNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int updateQna(Connection conn, BoardQnaQ temp) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateQna");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, temp.getTitle());
			pstmt.setString(2, temp.getEtc());
			pstmt.setInt(3, temp.getBoardNo());
			result = pstmt.executeUpdate();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public BoardQnaA findAnswer(Connection conn, int aNo) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("findAnswer");
		ResultSet rs = null;
		BoardQnaA temp = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, aNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				temp = new BoardQnaA();
				temp.setaNo(rs.getInt("a_no"));
				temp.setEtc(rs.getString("etc"));
				temp.setHireDate(rs.getDate("hire_date"));
				temp.setWriter(rs.getString("writer"));
				temp.setqNo(rs.getInt("q_no"));
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return temp;
	}

	public int selectCountQnaQ(Connection conn,String id) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectCountQnaQ");
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
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

	public BoardQnaQ findBoardQnaQ(Connection conn, String title, String writer) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("findTitleWriterBoardQnaQ");
		ResultSet rs = null;
		BoardQnaQ temp = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, writer);
			rs=pstmt.executeQuery();
			if(rs.next()){
				temp=new BoardQnaQ();
				temp.setBoardNo(rs.getInt("board_no"));
				temp.setEtc(rs.getString("etc"));
				temp.setHireDate(rs.getDate("hire_date"));
				temp.setTitle(rs.getString("title"));
				temp.setqUser(rs.getString("q_user"));
				temp.setStatus(rs.getInt("status"));
				temp.setType(rs.getInt("type"));
			}
		}catch(SQLException sqle) {
			sqle.printStackTrace();
		}finally{
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return temp;
	}

}
