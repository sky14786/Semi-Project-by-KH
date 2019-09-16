package com.truckta.boardmatching.model.service;
import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.truckta.boardmatching.model.dao.MainDao;
import com.truckta.boardmatching.model.vo.Board_Matching;

import common.template.JDBCTemplate;

public class MainService {
	private MainDao dao = new MainDao();
	
	public List<Board_Matching> selectList() {
		System.out.println("servlet");
		Connection conn=getConnection();
		List<Board_Matching> list=dao.selectList(conn);
		close(conn);
		return list;
	}
	//����¡ó���� ���� ������ ��ü����Ȯ��
	
			public int selectCountMember() {
				Connection conn=getConnection();
				int count=dao.selectCountMember(conn);
				close(conn);
				return count;
			}
			
			//������ ������ ��������
			public List<Board_Matching> selectListPage(int cPage,int numPerPage){
				Connection conn=getConnection();
				List<Board_Matching> list=dao.selectListPage(conn,cPage,numPerPage);
				close(conn);
				return list;
				
			}
			//////////////////////////////ȸ�� �˻�
			public int selectCountMember(String key) {
				Connection conn=getConnection();
				int result=dao.selectCountMember(conn,key);
				System.out.println("#########serviceresult:"+result);
				close(conn);
				return result;	
			}
			public List<Board_Matching> selectMemberList(String key,int cPage,int numPerPage){
				Connection conn=getConnection();
				List<Board_Matching> list=dao.selectMemberList(conn,key,cPage,numPerPage);
				System.out.println("#########service list :"+list);
				close(conn);
				return list;
			}
			public List<Board_Matching> guSearchList(String gu){
				Connection conn= JDBCTemplate.getConnection();
				List<Board_Matching> list =dao.guSearchList(conn,gu);
				close(conn);
				return list;
			}
}
