package com.truckta.client.model.service;

import java.sql.Connection;
import java.util.List;

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
	
	public Client selectId(String id,String pw) {
		Connection conn=JDBCTemplate.getConnection();
		Client cl=dao.selectId(conn,id,pw);
		JDBCTemplate.close(conn);
		return cl;
	}
	public int updateClient(Client c) {
		Connection conn=JDBCTemplate.getConnection();
		int result=dao.updateClient(conn,c);
		if(result>0) {JDBCTemplate.commit(conn);}
		else {JDBCTemplate.rollback(conn);}
		JDBCTemplate.close(conn);
		return result;
	}
	
}
