package com.truckta.model.service;

import java.sql.Connection;

import com.truckta.common.JDBCTemplate;
import com.truckta.model.dao.ClientDao;
import com.truckta.model.vo.Client;

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
	
	public int selectClient(String id) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.selectClient(conn,id);
		
		JDBCTemplate.close(conn);
		return result;
		
	}
}
