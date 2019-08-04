package com.truckta.model.service;

import java.sql.Connection;

import com.truckta.common.JDBCTemplate;
import com.truckta.model.dao.DriverDao;
import com.truckta.model.vo.Driver;

public class DriverService {
	private DriverDao dao = new DriverDao();

	public int joinDriver(Driver temp) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.joinDriver(conn, temp);

		if (result == 1) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int selectDriver(String id) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.selectDriver(conn, id);

		JDBCTemplate.close(conn);
		return result;
	}

}
