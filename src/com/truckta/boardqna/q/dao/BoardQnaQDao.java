package com.truckta.boardqna.q.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.truckta.boardqna.q.model.vo.BoardQnaQ;

import common.template.JDBCTemplate;

public class BoardQnaQDao {

	private Properties prop=new Properties();
	
	public BoardQnaQDao() {
		String path=BoardQnaQDao.class.getResource("/sql/board/board-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectCountBoard(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectCountBoard");
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
				System.out.println(result);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public List<BoardQnaQ> selectBoardList(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectBoardList");
		List<BoardQnaQ> list=new ArrayList();
		System.out.println(sql);
		
		try {
		    pstmt=conn.prepareStatement(sql);
		    
			rs=pstmt.executeQuery();
		while(rs.next()) {
			BoardQnaQ q=new BoardQnaQ();
			q.setBoardNo(rs.getInt("board_no"));
			q.setqUser(rs.getString("q_user"));
			q.setTitle(rs.getString("title"));
			q.setEtc(rs.getString("etc"));
			q.setHireDate(rs.getDate("hire_date"));
			q.setStatus(rs.getInt("status"));
			q.setType(rs.getInt("type"));
			list.add(q);
			System.out.println(list);
			System.out.println(q);
		}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}return list;
		
}
}