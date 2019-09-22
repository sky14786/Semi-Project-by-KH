package com.truckta.detail.model.dao;
import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.truckta.boardmatching.model.vo.BoardMatching;
import com.truckta.detail.model.vo.Detail;


public class DetailDao {
	Properties prop = new Properties();
	
	public DetailDao() {
		String path = getClass().getResource("/").getPath() + "sql/detail/detail.properties";
		try {
			prop.load(new FileReader(path));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Detail selectDetail(Connection conn, String boardNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectDetail");
		Detail d=null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(boardNo));
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				d= new Detail();
				d.setBoardNo(rs.getInt("BOARD_NO"));
				d.setWriter(rs.getString("WRITER"));
				d.setTitle(rs.getString("TITLE"));
				d.setStartAddr(rs.getString("START_ADDR"));
				d.setEndAddr(rs.getString("END_ADDR"));
				d.setEtc(rs.getString("ETC"));
				d.setCarTypeNo(rs.getInt("CAR_TYPE_NO"));
				d.setMemo(rs.getString("MEMO"));
				d.setHireDate(rs.getDate("HIRE_DATE"));
				d.setBoardState(rs.getInt("BOARD_STATE"));
				d.setCount(rs.getInt("COUNT"));
				d.setName(rs.getString("name"));
				d.setCarType(rs.getString("car_type"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return d;
	}
	
}


