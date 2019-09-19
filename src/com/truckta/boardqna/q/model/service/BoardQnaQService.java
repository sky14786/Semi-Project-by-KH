package com.truckta.boardqna.q.model.service;

import java.sql.Connection;
import java.util.List;

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

	public int selectCountBoardQnaQ(int type) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.selectCountBoardQnaQ(conn, type);
		JDBCTemplate.close(conn);
		return result;
	}
	
	
	public int insertBoard(BoardQnaQ q)  {
		 Connection conn=JDBCTemplate.getConnection();
		 int result=dao.insertBoard(conn,q);
		 if(result>0) {
//			 for() {
//			     result=dao.insertAttachment(conn,list.get(i))
//				 if(result<0) break;
//			 }
			 JDBCTemplate.commit(conn);
			 result=dao.selectSeqBoard(conn);
			 
	     }
		 else {
			 JDBCTemplate.rollback(conn);
		 }
		 JDBCTemplate.close(conn);
		 return result;
	}
	public BoardQnaQ selectBoard(String no) {
		Connection conn=JDBCTemplate.getConnection();
		BoardQnaQ q=dao.selectBoard(conn,no);
		
		JDBCTemplate.close(conn);
		return q;
	}
	public int insertComment(BoardQnaA a) {
		Connection conn=JDBCTemplate.getConnection();
		int result=dao.insertComment(conn,a);
		if(result>0) {JDBCTemplate.commit(conn);}
		else {JDBCTemplate.rollback(conn);}
		JDBCTemplate.close(conn);
		return result;
	}
	public List<BoardQnaA> selectBoardComment(String boardNo){
		Connection conn=JDBCTemplate.getConnection();
		List<BoardQnaA> list=dao.selectBoardComment(conn,boardNo);
		JDBCTemplate.close(conn);
		return list;
	}
	public int deleteBoard(int boardNo, int type) {
		Connection conn=JDBCTemplate.getConnection();
		int result=dao.deleteBoard(conn,boardNo,type);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {JDBCTemplate.rollback(conn);}
		JDBCTemplate.close(conn);
		return result;
	}

}
