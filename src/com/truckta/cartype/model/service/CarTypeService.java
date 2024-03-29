package com.truckta.cartype.model.service;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;

import com.truckta.cartype.model.dao.CarTypeDao;
import com.truckta.cartype.model.vo.CarType;

import common.template.JDBCTemplate;

public class CarTypeService {
	private CarTypeDao dao = new CarTypeDao();

	public int selectCountCarType() {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.selectCountCarType(conn);
		JDBCTemplate.close(conn);
		return result;
	}

	public List<CarType> selectListPage(int cPage, int numPerPage) {
		Connection conn = JDBCTemplate.getConnection();
		List<CarType> list = dao.selectListPage(conn, cPage, numPerPage);
		JDBCTemplate.close(conn);
		return list;
	}

	public int insertCarType(String carType) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.insertCarType(conn, carType);
		if (result == 1) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public List<CarType> selectAll() {
		Connection conn = JDBCTemplate.getConnection();
		List<CarType> list = dao.selectAll(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public int deleteCarType(int delTarget) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.deleteCarType(conn, delTarget);
		if (result == 1) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int updateCarType(CarType temp) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.updateCarType(conn, temp);
		if (result == 1) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
}
