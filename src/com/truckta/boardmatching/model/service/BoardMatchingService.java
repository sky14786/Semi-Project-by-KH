package com.truckta.boardmatching.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.truckta.boardmatching.model.dao.BoardMatchingDao;
import com.truckta.boardmatching.model.vo.BoardMatching;
import com.truckta.client.model.vo.Client;

import common.template.JDBCTemplate;

public class BoardMatchingService {
	private BoardMatchingDao dao = new BoardMatchingDao();

	public int writeBoardMatching(BoardMatching bTemp) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.wrtieBoardMatching(conn, bTemp);
		if (result == 1) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;

	}

	public int selectCountBoardMatching() {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.selectCountBoardMatching(conn);
		JDBCTemplate.close(conn);
		return result;
	}

	public List<BoardMatching> selectListPage(int cPage, int numPerPage) {
		Connection conn = JDBCTemplate.getConnection();
		List<BoardMatching> list = dao.selectListPage(conn, cPage, numPerPage);
		JDBCTemplate.close(conn);
		return list;
	}

}
