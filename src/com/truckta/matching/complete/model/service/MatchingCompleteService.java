package com.truckta.matching.complete.model.service;

import java.sql.Connection;
import java.util.List;

import com.truckta.matching.complete.model.dao.MatchingCompleteDao;
import com.truckta.matching.complete.model.vo.MatchingComplete;
import com.truckta.matching.model.vo.Matching;

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
	
	public Matching matData(String id, String room) {
		Connection conn = JDBCTemplate.getConnection();
		Matching mc = dao.matDate(conn, id, room);
		JDBCTemplate.close(conn);
		return mc;
	}
	
	public int insertData(Matching mc) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.insertData(conn, mc);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

}
