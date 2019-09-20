package com.truckta.client.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.rollback;
import static common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.truckta.chat.model.vo.ChatHistory;
import com.truckta.chat.model.vo.MessageList;
import com.truckta.client.model.dao.ClientDao;
import com.truckta.client.model.vo.Client;

import common.template.JDBCTemplate;

public class ClientService {
	private ClientDao dao = new ClientDao();

	public int JoinClient(Client temp) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.joinClient(conn, temp);
		if (result == 1) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int clientDuplicateCheck(String id) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.clientDuplicateCheck(conn, id);
		JDBCTemplate.close(conn);
		return result;
	}

	public int findClient(String id, String name) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.findClient(conn, id, name);

		JDBCTemplate.close(conn);
		return result;

	}

	public int resetPassword(String id, String pw) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.resetPassword(conn, id, pw);
		if (result == 1) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int selectCountClient() {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.selectCountClient(conn);
		JDBCTemplate.close(conn);
		return result;
	}

	public List<Client> selectListPage(int cPage, int numPerPage) {
		Connection conn = JDBCTemplate.getConnection();
		List<Client> list = dao.selectListPage(conn, cPage, numPerPage);
		JDBCTemplate.close(conn);
		return list;
	}

	public Client selectId(String id, String pw) {
		Connection conn = JDBCTemplate.getConnection();
		Client cl = dao.selectId(conn, id, pw);
		JDBCTemplate.close(conn);
		return cl;
	}

	public int updateClient(Client c) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.updateClient(conn, c);
		if (result == 1) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	

	public int selectCountMessageList() {
		Connection conn = getConnection();
		int result = dao.selectCountMessageList(conn);
		close(conn);
		return result;
	}

	public List<MessageList> selectMessageList(String id) {
		Connection conn = getConnection();
		List<MessageList> list = dao.selectMessageList(conn, id);
		return list;
	}

	public List<ChatHistory> selectChatHistory(String room) {
		Connection conn = getConnection();
		List<ChatHistory> list = dao.selectChatHistory(conn, room);
		close(conn);
		return list;
	}

	public int sendChat(ChatHistory ch) {
		Connection conn = getConnection();
		int result = dao.sendChat(conn, ch);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;

	}

	public Client findClient(String id) {
		Connection conn = JDBCTemplate.getConnection();
		Client temp = dao.findClient(conn, id);
		JDBCTemplate.close(conn);
		return temp;
	}

	public int reportClient(String id) {
		Connection conn = JDBCTemplate.getConnection();
		int isReport = dao.reportClient(conn, id);
		if (isReport == 1) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return isReport;
	}

	public int deleteClient(String id) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.deleteClinet(conn, id);
		if (result == 1) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int copyClient(Client temp) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.copyClient(conn, temp);
		if (result == 1) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public Client boardMatchingFindClient(int no) {
		Connection conn = JDBCTemplate.getConnection();
		Client temp = dao.boardMatchingFindClient(conn, no);
		JDBCTemplate.close(conn);
		return temp;
	}

	public int selectSearchCountClient(String search, String searchKeyword) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.selectSearchCountClient(conn, search, searchKeyword);
		JDBCTemplate.close(conn);
		return result;
	}

	public List<Client> selectSearchListPage(int cPage, int numPerPage, String search, String searchKeyword) {
		Connection conn = JDBCTemplate.getConnection();
		List<Client> list = dao.selectSearchListPage(conn, cPage, numPerPage, search, searchKeyword);
		JDBCTemplate.close(conn);
		return list;
	}

}
