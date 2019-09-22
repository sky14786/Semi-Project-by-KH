package com.truckta.boardqna.q.model.service;

import java.sql.Connection;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.websocket.Session;

import com.truckta.boardqna.a.model.vo.BoardQnaA;
import com.truckta.boardqna.q.model.dao.BoardQnaQDao;
import com.truckta.boardqna.q.model.vo.BoardQnaQ;

import common.template.JDBCTemplate;

public class BoardQnaQService {
	private BoardQnaQDao dao = new BoardQnaQDao();

	public List<BoardQnaQ> selectListPage(int cPage, int numPerPage, int type) {
		Connection conn = JDBCTemplate.getConnection();
		List<BoardQnaQ> list = dao.selectListPage(conn, cPage, numPerPage, type);
		JDBCTemplate.close(conn);
		return list;
		
	}
	public List<BoardQnaQ> selectBoardList(int cPage, int numPerPage, int type, String qUser) {
		Connection conn = JDBCTemplate.getConnection();
		
		List<BoardQnaQ> list = dao.selectBoardList(conn, cPage, numPerPage, type,qUser);
		JDBCTemplate.close(conn);
		return list;
	}

	public int selectCountBoardQnaQ(int type) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.selectCountBoardQnaQ(conn, type);
		JDBCTemplate.close(conn);
		return result;
	}

	public int deleteQnaQ(int no) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.deleteQnaQ(conn, no);

		if (result == 1) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public BoardQnaQ findBoardQnaQ(int no) {
		Connection conn = JDBCTemplate.getConnection();
		BoardQnaQ temp = dao.findBoardQnaQ(conn, no);
		JDBCTemplate.close(conn);
		return temp;
	}

	public int selectSearchCountBoardQnaQ(String search, String searchKeyword) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.selectSearchCountBoardQnaQ(conn, search, searchKeyword);
		JDBCTemplate.close(conn);
		return result;
	}

	public List<BoardQnaQ> selectSearchListPage(int cPage, int numPerPage, String search, String searchKeyword) {
		Connection conn = JDBCTemplate.getConnection();
		List<BoardQnaQ> list = dao.selectSearchListPage(conn, cPage, numPerPage, search, searchKeyword);
		JDBCTemplate.close(conn);
		return list;
	}

	public int insertBoard(BoardQnaQ q) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.insertBoard(conn, q);
		if (result > 0) {
			JDBCTemplate.commit(conn);
			result = dao.selectSeqBoard(conn);

		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public BoardQnaQ selectBoard(String no) {
		Connection conn = JDBCTemplate.getConnection();
		BoardQnaQ q = dao.selectBoard(conn, no);

		JDBCTemplate.close(conn);
		return q;
	}
	

	public int insertComment(BoardQnaA a) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.insertComment(conn, a);
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public List<BoardQnaA> selectBoardComment(String boardNo) {
		Connection conn = JDBCTemplate.getConnection();
		List<BoardQnaA> list = dao.selectBoardComment(conn, boardNo);
		JDBCTemplate.close(conn);
		return list;
	}

	public int deleteBoard(int boardNo, int type) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.deleteBoard(conn, boardNo, type);
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public int upLoadBoard(BoardQnaQ q) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.upLoadBoard(conn, q);
		if (result > 0) {
			JDBCTemplate.commit(conn);
			result = dao.selectSeqBoard(conn);

		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public int deleteComment(int qNo, int aNo) {
		Connection conn=JDBCTemplate.getConnection();
		int result=dao.deleteComment(conn,qNo,aNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {JDBCTemplate.rollback(conn);}
		JDBCTemplate.close(conn);
		return result;
	}
	public int updateComment(BoardQnaA a) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.updateComment(conn, a);
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	public int updateQna(BoardQnaQ temp) {

		Connection conn = JDBCTemplate.getConnection();

		int result = dao.updateQna(conn, temp);

		if (result == 1) {

			JDBCTemplate.commit(conn);

		} else {

			JDBCTemplate.rollback(conn);

		}

		JDBCTemplate.close(conn);

		return result;

	}

}
