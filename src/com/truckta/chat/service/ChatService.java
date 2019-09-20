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
	
	public int createChat(CreateChat cc) {
		Connection conn = getConnection();
		int result = dao.createChat(conn, cc);
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
	

}
