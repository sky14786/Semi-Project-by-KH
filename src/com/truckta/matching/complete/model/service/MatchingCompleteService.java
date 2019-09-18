package com.truckta.matching.complete.model.service;

import java.sql.Connection;
import java.util.List;

import com.truckta.matching.complete.model.dao.MatchingCompleteDao;
import com.truckta.matching.complete.model.vo.MatchingComplete;

import common.template.JDBCTemplate;

public class MatchingCompleteService {
	private MatchingCompleteDao dao = new MatchingCompleteDao();

	public int selectCountMatchingComplete() {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.selectCountMatchingComplete(conn);
		JDBCTemplate.close(conn);
		return result;
	}

	public List<MatchingComplete> selectListPage(int cPage, int numPerPage) {
		Connection conn = JDBCTemplate.getConnection();
		List<MatchingComplete> list = dao.selectListPage(conn, cPage, numPerPage);
		JDBCTemplate.close(conn);
		return list;
	}

}
