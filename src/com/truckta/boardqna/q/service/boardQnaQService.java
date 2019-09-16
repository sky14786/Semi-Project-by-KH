package com.truckta.boardqna.q.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.truckta.boardqna.q.dao.BoardQnaQDao;
import com.truckta.boardqna.q.model.vo.BoardQnaQ;

public class boardQnaQService {

	private BoardQnaQDao dao=new BoardQnaQDao();
	
	public int selectCountBoard() {
		Connection conn=getConnection();
		int result=dao.selectCountBoard(conn);
		close(conn);
		return result;
	}
	
	public List<BoardQnaQ> selectBoardList() {
		Connection conn=getConnection();
		List<BoardQnaQ> list=dao.selectBoardList(conn);
		close(conn);
		return list;
	}
	
}
