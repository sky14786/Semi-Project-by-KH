package com.truckta.boardmatching.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.truckta.boardmatching.model.dao.BoardMatchingDao;
import com.truckta.boardmatching.model.vo.BoardMatching;
import com.truckta.client.model.vo.Client;
import com.truckta.file.matching.model.vo.FileMatching;

import common.template.JDBCTemplate;

public class BoardMatchingService {
	private BoardMatchingDao dao = new BoardMatchingDao();

	// 글 업로드
	public int insertBoardMatching(BoardMatching bm) {

		Connection conn = JDBCTemplate.getConnection();
		int result = dao.insertBoardMatching(conn, bm);

		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;

	}

	// 글 수정
	public int updateBoardMatching(BoardMatching bm) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.updateBoardMatching(conn, bm);

		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	// 글 불러오기
	public BoardMatching loadBoardMatching(String wirter, int boardNum) {
		Connection conn = JDBCTemplate.getConnection();
		BoardMatching mb = dao.loadBoardMatching(conn, wirter, boardNum);

		if (mb != null) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return mb;
	}

	// 보드넘버 얻어오기
	public int searchBoardNum(BoardMatching bm) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.searchBoardNum(conn, bm);

		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	// 보드 이미지 경로 저장
	public int insertImgBoardMatching(List<FileMatching> list) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.insertImgBoardMatching(conn, list);
		if (result == 1) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	// 보드 이미지 삭제(실패시)
	public int deleteImg(int resultBoNum) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.deleteImg(conn, resultBoNum);
		if (result == 1) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	// 부분 이미지 삭제
	public int modImg(int boardNum, String imgTemp[]) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.modImg(conn, boardNum, imgTemp);
		if (result == 1) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	// 보드 이미지 불러오기
	public List<FileMatching> loadBoardImg(int boNum) {
		Connection conn = JDBCTemplate.getConnection();
		List<FileMatching> list = dao.loadBoardImg(conn, boNum);
		if (list != null) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return list;
	}

	// 게시판 글 삭제(상태값 변경)
	public int boardDelete(int boardNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.boardDelete(conn, boardNo);
		if (result == 1) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	// 기본 정보 글 입력
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

	public int deleteBoardMatching(int no) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.deleteBoardMatching(conn, no);
		if (result == 1) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int selectSearchCountBoardMatching(String search, String searchKeyword) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.selectSearchCountBoardMatching(conn, search, searchKeyword);
		JDBCTemplate.close(conn);
		return result;
	}

	public List<BoardMatching> selectSearchListPage(int cPage, int numPerPage, String search, String searchKeyword) {
		Connection conn = JDBCTemplate.getConnection();
		List<BoardMatching> list = dao.selectSearchListPage(conn, cPage, numPerPage, search, searchKeyword);
		JDBCTemplate.close(conn);
		return list;
	}

	// 전체 리스트(마이페이지)
	public List<BoardMatching> myAllList(String writer) {
		Connection conn = JDBCTemplate.getConnection();
		List<BoardMatching> list = dao.myAllList(conn, writer);
		JDBCTemplate.close(conn);
		return list;
	}

	// 보드매칭테이블 / 매칭태이블 / 드라이버
	public List<List> matchingList(String writer) {
		Connection conn = JDBCTemplate.getConnection();
		List<List> list = dao.matchingList(conn, writer);
		JDBCTemplate.close(conn);
		return list;
	}

	// 보드매칭완료 / 보드매칭/ 드라이버 / 보드매칭테이블
	public List<List> matchingCompleteList(String writer) {
		Connection conn = JDBCTemplate.getConnection();
		List<List> list = dao.matchingCompleteList(conn, writer);
		JDBCTemplate.close(conn);
		return list;
	}

	// 마이 페이지 보드매칭 top3
	public List<BoardMatching> mypageTop(String writer) {
		Connection conn = JDBCTemplate.getConnection();
		List<BoardMatching> list = dao.mypageTop(conn, writer);
		if (list.size() > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return list;
	}
	
	public int matchingListCount(String writer) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.matchingListCount(conn, writer);
		JDBCTemplate.close(conn);
		return result;
	}

}
