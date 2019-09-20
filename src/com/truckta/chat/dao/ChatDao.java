package com.truckta.chat.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import com.truckta.chat.model.vo.CreateChat;

public class ChatDao {
	
	Properties prop = new Properties();
	
	public ChatDao() {
		String path = ChatDao.class.getResource("/sql/chat/chat-query.properties").getPath();
		
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int createChat(Connection conn, CreateChat cc) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertOneOnOneChat");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cc.getWriterId());
			pstmt.setString(2, cc.getDriverId());
			pstmt.setInt(3, cc.getBoardNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} 
		
		return result;
	}

	public int selectRoom(Connection conn, CreateChat cc) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectRoom");
		CreateChat ccWithRoom = null;
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cc.getWriterId());
			pstmt.setString(2, cc.getDriverId());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ccWithRoom = new CreateChat();
				ccWithRoom.setRoomNo(rs.getInt("room_no"));
				ccWithRoom.setWriterId(rs.getString("user_a"));
				ccWithRoom.setDriverId(rs.getString("user_b"));
				ccWithRoom.setAdminId(rs.getString("user_c"));
				ccWithRoom.setBoardNo(rs.getInt("board_no"));
				ccWithRoom.setCreatedDate(rs.getDate("created_Date"));
				System.out.println(ccWithRoom);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return ccWithRoom.getRoomNo();
	}
	
	
	
	
	
	

}
