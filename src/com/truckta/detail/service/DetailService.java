package com.truckta.detail.service;

import static common.template.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.truckta.detail.model.dao.DetailDao;
import com.truckta.detail.model.vo.Detail;

import static common.template.JDBCTemplate.close;


public class DetailService {
	
	private DetailDao dao = new DetailDao();
	
	public Detail selectDetail(String boardNo) {
		Connection conn= getConnection();
		Detail d=dao.selectDetail(conn,boardNo);
		close(conn);
		return d;
	}

}
