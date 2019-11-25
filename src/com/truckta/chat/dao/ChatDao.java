package com.truckta.chat.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

   public int createRoom(Connection conn, CreateChat cc) {
      PreparedStatement pstmt = null;
      int result = 0;
      String sql = prop.getProperty("createRoom");
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
      int result=-1;
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, cc.getWriterId());
         pstmt.setString(2, cc.getDriverId());
         rs = pstmt.executeQuery();
         
         if(rs.next()) {
            result=rs.getInt("room_no");
         
         }
      } catch (SQLException e) {
         
         e.printStackTrace();
      }finally {
         close(rs);
         close(pstmt);
      }
      return result;
   }

   public int sendGreeting(Connection conn, int roomNum, String driverId, String message) {
      PreparedStatement pstmt = null;
      int result=0;
      String sql = prop.getProperty("sendGreeting");
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, roomNum);
         pstmt.setString(2, driverId);
         pstmt.setString(3, message);
         result = pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         close(pstmt);
      }
      return result;
   }

   public int insertBid(Connection conn, int boardNo, String writerId, String driverId, String bidPrice) {
      PreparedStatement pstmt = null;
      int result=0;
      String sql = prop.getProperty("insertBid");
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, boardNo);
         pstmt.setString(2, writerId);
         pstmt.setString(3, driverId);
         pstmt.setInt(4, Integer.parseInt(bidPrice));
         result = pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         close(pstmt);
      }
      return result;
   }

   public int selectBid(Connection conn, int boardNo, String driverId) {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String sql = prop.getProperty("selectBid");
      int result=-1;
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, boardNo);
         pstmt.setString(2, driverId);
         rs = pstmt.executeQuery();
         
         if(rs.next()) {
            result=rs.getInt(1);
         }
      } catch (SQLException e) {
         
         e.printStackTrace();
      }finally {
         close(rs);
         close(pstmt);
      }
      return result;
   }

   
   

}