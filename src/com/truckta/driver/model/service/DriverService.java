package com.truckta.driver.model.service;

import java.sql.Connection;
import java.util.List;

import com.truckta.client.model.vo.Client;
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

	public int selectCountDriver(boolean isApprovaled) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.selectCountDriver(conn, isApprovaled);
		JDBCTemplate.close(conn);
		return result;
	}

	public List<Driver> selectListPage(int cPage, int numPerPage, boolean isApprovaled) {
		Connection conn = JDBCTemplate.getConnection();
		List<Driver> list = dao.selectListPage(conn, cPage, numPerPage, isApprovaled);
		JDBCTemplate.close(conn);
		return list;
	}

	// 드라이버 확인
	public int driverCheck(String user) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.driverCheck(conn, user);
		JDBCTemplate.close(conn);
		return result;
	}

	public int driverRightModify(String id) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.driverRightModify(conn, id);
		if (result == 1) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public Driver findDriver(String id) {
		Connection conn = JDBCTemplate.getConnection();
		Driver temp = dao.findDriver(conn,id);
		JDBCTemplate.close(conn);
		return temp;
	}

	public int adminUpdateDriver(Driver d,String target) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.adminUpdateDriver(conn,d,target);
		if(result ==1) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}



}
