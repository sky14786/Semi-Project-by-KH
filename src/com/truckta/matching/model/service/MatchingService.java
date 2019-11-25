package com.truckta.matching.model.service;

import java.sql.Connection;

import java.util.List;

import com.truckta.matching.model.dao.MatchingDao;
import com.truckta.matching.model.vo.Matching;

import common.template.JDBCTemplate;

public class MatchingService {
	private MatchingDao dao = new MatchingDao();

	public List<Matching> selectListPage(int cPage, int numPerPage) {
		Connection conn = JDBCTemplate.getConnection();
		List<Matching> list = dao.selectListPage(conn, cPage, numPerPage);
		JDBCTemplate.close(conn);
		return list;
	}

	public int selectCountMatching() {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.selectCountMatching(conn);
		JDBCTemplate.close(conn);
		return result;
	}

	public int selectSearchCountMatching(String search, String searchKeyword) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.selectSearchCountMatching(conn, search, searchKeyword);
		JDBCTemplate.close(conn);
		return result;
	}

	public List<Matching> selectSearchListPage(int cPage, int numPerPage, String search, String searchKeyword) {
		Connection conn = JDBCTemplate.getConnection();
		List<Matching> list = dao.selectSearchListPage(conn, cPage, numPerPage, search, searchKeyword);
		JDBCTemplate.close(conn);
		return list;
	}

	public List<Matching> selectMatches(String boardNo) {
		Connection conn = JDBCTemplate.getConnection();
		List<Matching> list = dao.selectMatches(conn, boardNo);
		JDBCTemplate.close(conn);
		return list;
	}
	
	// 드라이버 배송완료 확인
	public int dirverConfirm(int boardNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.dirverConfirm(conn, boardNo);
		if(result > 0) JDBCTemplate.commit(conn);
		else JDBCTemplate.rollback(conn);
		JDBCTemplate.close(conn);
		return result;
	}
	
	// 매칭컴플리스 확인
	public int matCount(int boardNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.matCount(conn, boardNo);
		JDBCTemplate.close(conn);
		return result;
	}

}
