package com.truckta.boardqna.q.model.service;

import java.sql.Connection;
import java.util.List;

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

}
