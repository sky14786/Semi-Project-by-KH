package com.truckta.boardmatching.model.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.truckta.boardmatching.model.vo.BoardMatching;

public class MainDao {
	private Properties prop = new Properties();

	public List<BoardMatching> selectList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BoardMatching> list = new ArrayList();
		try {
			FileInputStream file = new FileInputStream(
					"C:\\Semi-Project\\semi_project\\src\\sql\\member\\member-query.properties");
			prop.load(file);
		} catch (Exception e) {
			e.printStackTrace();
			// System.out.println("### member-query.properties ���� �о���� ���� ");
		}

		String sql = prop.getProperty("selectList");
		System.out.println("### sql : " + sql);
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardMatching bm = new BoardMatching();
				bm.setBoardNo(rs.getInt("board_no"));
				bm.setWrtier(rs.getString("writer"));
				bm.setTitle(rs.getString("title"));
				bm.setStartAddr(rs.getString("start_addr"));
				bm.setEndAddr(rs.getString("end_addr"));
				bm.setEtc(rs.getString("etc"));
				bm.setCarTypeNo(Integer.parseInt(rs.getString("car_type_no")));
				bm.setMemo(rs.getString("memo"));
				bm.setHireDate(rs.getDate("hire_date"));

				bm.setBoardState(rs.getInt("board_state"));

				list.add(bm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;

	}

	//////////////////////////// ����¡
	public int selectCountMember(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		/////////
		try {
			FileInputStream file = new FileInputStream(
					"C:\\Semi-Project\\semi_project\\src\\sql\\member\\member-query.properties");
			prop.load(file);
		} catch (Exception e) {
			e.printStackTrace();
			// System.out.println("### member-query.properties ���� �о���� ���� ");
		}

		String sql = prop.getProperty("selectCountMember");
		System.out.println("### 페이징sql : " + sql);
//////////////////

		try {

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt("cnt");
				// result=rs.getInt(1);//�ε����� �ҷ�����
			}
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	// page�� �ش��ϴ� �����͸� ��������
	public List<BoardMatching> selectListPage(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<BoardMatching> list = new ArrayList();
		//
		try {
			FileInputStream file = new FileInputStream(
					"C:\\Semi-Project\\semi_project\\src\\sql\\member\\member-query.properties");
			prop.load(file);
		} catch (Exception e) {
			e.printStackTrace();
			// System.out.println("### member-query.properties ���� �о���� ���� ");
		}

		String sql = prop.getProperty("selectListPage");
		System.out.println("### selectListPage sql : " + sql);
		//
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(2, cPage * numPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardMatching bm = new BoardMatching();
				bm.setBoardNo(rs.getInt("board_no"));
				bm.setWrtier(rs.getString("writer"));
				bm.setTitle(rs.getString("title"));
				bm.setStartAddr(rs.getString("start_addr"));
				bm.setEndAddr(rs.getString("end_addr"));
				bm.setEtc(rs.getString("etc"));
				bm.setCarTypeNo(Integer.parseInt(rs.getString("car_type_no")));
				bm.setMemo(rs.getString("memo"));
				bm.setHireDate(rs.getDate("hire_date"));

				bm.setBoardState(rs.getInt("board_state"));

				list.add(bm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;

	}

	///////////////////////////////// �� ��///////////////////////////////////
	public int selectCountMember(Connection conn, String key) {
		Statement stmt = null;
		ResultSet rs = null;
		int result = 0;
		// String sql="select count(*) as cnt from truckta_notice where "+" like
		// '%"+key+"%'";///////

		String sql = "select count(*) as cnt from BoardMatching where title like '%" + key + "%' or start_addr like '%"
				+ key + "%' or end_addr like '%" + key + "%'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				result = rs.getInt("cnt");

			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("### member-query.properties ���� �о���� ���� ");
		} finally {
			close(rs);
			close(stmt);

		}
		return result;
	}
	////////////////

	public List<BoardMatching> selectMemberList(Connection conn, String key, int cPage, int numPerPage) {
		Statement stmt = null;
		ResultSet rs = null;
		List<BoardMatching> list = new ArrayList();

		int start = (cPage - 1) * numPerPage + 1;
		int end = cPage * numPerPage;
		String sql = "select * from (" + "select rownum as rnum, a.*from(" + "select * from BoardMatching where title" //
				+ " like '%" + key + "%' or start_addr like '%" + key + "%' or end_addr like '%" + key + "%')a) "
				+ "where rnum between " + start + " and " + end;
//				String sql="select * from ("
//						+ "select rownum as rnum, a.*from("
//						+ "select * from truckta_notice where "
//						+ " like '%"+key+"%' )a) "
//						+ "where rnum between "+start+" and " +end;
//				String sql="select * from (select rownum as rnum, a.*from(select * from truckta_notice where client_id like '%"+key+"%' )a) where rnum between "+start+" and" +end;
		// System.out.println("########sql : "+sql);
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				BoardMatching bm = new BoardMatching();
				bm.setBoardNo(rs.getInt("board_no"));
				bm.setWrtier(rs.getString("writer"));
				bm.setTitle(rs.getString("title"));
				bm.setStartAddr(rs.getString("start_addr"));
				bm.setEndAddr(rs.getString("end_addr"));
				bm.setEtc(rs.getString("etc"));
				bm.setCarTypeNo(Integer.parseInt(rs.getString("car_type_no")));
				bm.setMemo(rs.getString("memo"));
				bm.setHireDate(rs.getDate("hire_date"));

				bm.setBoardState(rs.getInt("board_state"));

				list.add(bm);
			}
			System.out.println("########dao list : " + list);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("### list member-query.properties 오류 ");
		} finally {
			close(rs);
			close(stmt);

		}
		return list;
	}

	public List<BoardMatching> guSearchList(Connection conn, String gu) {

		List<BoardMatching> list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from BoardMatching where end_addr=" + "'" + gu + "' or start_addr=" + "'" + gu + "'";
		//
		System.out.println("### guSearchsql : " + sql);
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				BoardMatching bm = new BoardMatching();
				bm.setBoardNo(rs.getInt("board_no"));
				bm.setWrtier(rs.getString("writer"));
				bm.setTitle(rs.getString("title"));
				bm.setStartAddr(rs.getString("start_addr"));
				bm.setEndAddr(rs.getString("end_addr"));
				bm.setEtc(rs.getString("etc"));
				bm.setCarTypeNo(Integer.parseInt(rs.getString("car_type_no")));
				bm.setMemo(rs.getString("memo"));
				bm.setHireDate(rs.getDate("hire_date"));

				bm.setBoardState(rs.getInt("board_state"));

				list.add(bm);
			}
			System.out.println("########dao list : " + list);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("##### list member-query.properties 오류 ");
		} finally {
			close(rs);
			close(stmt);

		}
		return list;
	}
}
