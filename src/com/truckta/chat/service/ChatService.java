package com.truckta.chat.service;

import java.sql.Connection;

import com.truckta.chat.dao.ChatDao;
import com.truckta.chat.model.vo.CreateChat;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.rollback;

public class ChatService {
   
   private ChatDao dao = new ChatDao();
   
   public int createRoom(CreateChat cc) {
      Connection conn = getConnection();
      int result = dao.createRoom(conn, cc);
      if(result>0) {
         commit(conn);
      } else {
         rollback(conn);
      }
      return result;
   }

   public int selectRoom(CreateChat cc) {
      Connection conn = getConnection();
      int room = dao.selectRoom(conn, cc);
      close(conn);
      return room;
   }

   public int sendGreeting(int roomNum, String driverId, String message) {
      Connection conn = getConnection();
      int send = dao.sendGreeting(conn, roomNum, driverId, message);
      if(send>0) {
         System.out.println("sent!!!@!!!!!!");
         commit(conn);
      } else {
         rollback(conn);
      }
      close(conn);
      return send;
   }

   public int insertBid(int boardNo, String writerId, String driverId, String bidPrice) {
      Connection conn = getConnection();
      int addBid = dao.insertBid(conn, boardNo, writerId, driverId, bidPrice);
      if(addBid>0) {
         commit(conn);
      } else {
         rollback(conn);
      }
      close(conn);
      return 0;
   }

   public int selectBid(int boardNo, String driverId) {
      Connection conn = getConnection();
      int room = dao.selectBid(conn, boardNo, driverId);
      close(conn);
      return room;
   }


   

   
   

}