package com.truckta.boardmatching.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.truckta.boardmatching.model.dao.MainDao;
import com.truckta.boardmatching.model.vo.BoardMatching;
import com.truckta.file.matching.model.vo.FileMatching;

import common.template.JDBCTemplate;

public class MainService {
	private MainDao dao = new MainDao();

	public List<BoardMatching> selectList() {
		Connection conn = getConnection();
		List<BoardMatching> list = dao.selectList(conn);
		
		close(conn);
		
		return list;
	}


	public int selectCountMember() {
		Connection conn = getConnection();
		int count = dao.selectCountMember(conn);
		close(conn);
		return count;
	}

	// ������ ������ ��������
	public List<BoardMatching> selectListPage(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<BoardMatching> list = dao.selectListPage(conn, cPage, numPerPage);
		close(conn);
		return list;

	}

	////////////////////////////// ȸ�� �˻�
	public int selectCountMember(String key) {
		Connection conn = getConnection();
		int result = dao.selectCountMember(conn, key);
		close(conn);
		return result;
	}

	public List<BoardMatching> selectMemberList(String key, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<BoardMatching> list = dao.selectMemberList(conn, key, cPage, numPerPage);
		close(conn);
		return list;
	}

	public List<BoardMatching> guSearchList(String gu) {
		Connection conn = JDBCTemplate.getConnection();
		List<BoardMatching> list = dao.guSearchList(conn, gu);
		close(conn);
		return list;
	}
	public List<FileMatching> fileSearch(){
		Connection conn=getConnection();
		List<FileMatching> list=dao.fileSearch(conn);
		close(conn);
		return list;
	}

	public int selectCountBoardMatching(String selectGu) {
		Connection conn = getConnection();
		int result = dao.selectCountBoardMatching(conn,selectGu);
		close(conn);
		return result;
	}

	public List<BoardMatching> selectListPage(int cPage, int numPerPage, String selectGu) {
		Connection conn = getConnection();
		List<BoardMatching> list = dao.selectListPage(conn, cPage, numPerPage,selectGu);
		close(conn);
		return list;
	}
	//날짜
	public List<BoardMatching> searchDate(int cPage, int numPerPage, String searchdate) {
		Connection conn = getConnection();
		List<BoardMatching> list = dao.searchDate(conn, cPage, numPerPage,searchdate);
		close(conn);
		return list;
	}
}
