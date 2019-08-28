package com.truckta.driver.model.service;

import java.sql.Connection;

import com.truckta.driver.model.dao.DriverDao;
import com.truckta.driver.model.vo.Driver;

import common.template.JDBCTemplate;

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



}