package com.truckta.driver.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.truckta.boardmatching.model.vo.BoardMatching;
import com.truckta.driver.model.vo.Driver;

import common.template.JDBCTemplate;

public class DriverDao {
	Properties prop = new Properties();

	public DriverDao() {
		String path = getClass().getResource("/").getPath() + "sql/driver/driver-query.properties";
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int joinDriver(Connection conn, Driver temp) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("joinDriver");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, temp.getId());
			pstmt.setInt(2, temp.getCarType());
			pstmt.setString(3, temp.getDateOfBirth());
			pstmt.setString(4, temp.getdLicense());
			pstmt.setString(5, temp.getbLicense());

			result = pstmt.executeUpdate();

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int selectCountDriver(Connection conn, boolean isApprovaled) {
		PreparedStatement pstmt = null;
		String sql = isApprovaled == true ? prop.getProperty("selectCountApprovalDriver")
				: prop.getProperty("selectCountDriver");
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public List<Driver> selectListPage(Connection conn, int cPage, int numPerPage, boolean isApprovaled) {
		PreparedStatement pstmt = null;
		String sql = isApprovaled == true ? prop.getProperty("selectApprovalListPage")
				: prop.getProperty("selectListPage");
		ResultSet rs = null;
		List<Driver> list = new ArrayList<Driver>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(2, cPage * numPerPage);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				Driver d = new Driver();
				d.setId(rs.getString("id"));
				d.setCarType(rs.getInt("type_no"));
				d.setDateOfBirth(rs.getString("date_of_birth"));
				d.setdLicense(rs.getString("d_license"));
				d.setbLicense(rs.getString("b_license"));
				d.setRegDate(rs.getDate("regdate"));
				list.add(d);
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	// 드라이버 확인
	public int driverCheck(Connection conn, String user) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("driverCheck");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int driverRightModify(Connection conn, String id) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("driverRightModify");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public Driver findDriver(Connection conn, String id) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("findDriver");
		ResultSet rs = null;
		Driver driver = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				driver = new Driver();
				driver.setId(rs.getString("id"));
				driver.setCarType(rs.getInt("type_no"));
				driver.setDateOfBirth(rs.getString("date_of_birth"));
				driver.setdLicense(rs.getString("d_license"));
				driver.setbLicense(rs.getString("b_license"));
				driver.setRegDate(rs.getDate("regdate"));
				driver.setStatus(rs.getInt("status"));
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return driver;
	}

	// 드라이버 진행중인 리스트(top3)
	public List<BoardMatching> driverTopList(Connection conn, String driver) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("driverTopList");
		List<BoardMatching> list = new ArrayList<BoardMatching>();
		BoardMatching bm = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, driver);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				bm = new BoardMatching();
				bm.setBoardNo(rs.getInt("board_no"));
				bm.setWrtier(rs.getString("writer"));
				bm.setTitle(rs.getString("title"));
				bm.setStartAddr(rs.getString("start_addr"));
				bm.setEndAddr(rs.getString("end_addr"));
				bm.setEtc(rs.getString("etc"));
				bm.setCarTypeNo(rs.getInt("car_type_no"));
				bm.setMemo(rs.getString("memo"));
				bm.setTkDate(rs.getDate("tk_date"));
				bm.setBoardState(rs.getInt("board_state"));
				bm.setCount(rs.getInt("count"));
				bm.setHireDate(rs.getDate("hire_date"));
				list.add(bm);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	// 매칭 성사전 매칭 신청한 리스트 myDriverPage2
	public List<List> myPageDriverMatching(Connection conn, String driver) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("myPageDriverMatching");
		ResultSet rs = null;
		List<List> list = new ArrayList<List>();
		List listTmp = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, driver);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				listTmp = new ArrayList();
				listTmp.add(rs.getString("title"));
				listTmp.add(rs.getString("start_addr"));
				listTmp.add(rs.getString("end_addr"));
				listTmp.add(rs.getDate("try_date"));
				listTmp.add(rs.getInt("pay"));
				listTmp.add(rs.getString("board_no"));
				listTmp.add(rs.getString("responser"));
				list.add(listTmp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	// 운송 완료 리스트 myDriverPage3
	public List<List> myPageDriverMatchingCom(Connection conn, String driver) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("myPageDriverMatchingCom");
		ResultSet rs = null;
		List<List> list = new ArrayList<List>();
		List listTmp = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, driver);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				listTmp = new ArrayList();
				listTmp.add(rs.getDate("com_date"));
				listTmp.add(rs.getString("requestor"));
				listTmp.add(rs.getString("end_addr"));
				listTmp.add(rs.getInt("pay"));
				listTmp.add(rs.getString("board_no"));
				list.add(listTmp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public int adminUpdateDriver(Connection conn, Driver d, String target) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminUpdateDriver");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, d.getDateOfBirth());
			pstmt.setString(2, d.getdLicense());
			pstmt.setString(3, d.getbLicense());
			pstmt.setInt(4, d.getCarType());
			pstmt.setString(5, target);
			result = pstmt.executeUpdate();

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	// 전체 리스트 myDriverPage1
	public List<List> driverReqAllList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("driverReqAllList");
		List<List> list = new ArrayList<List>();
		List listTmp = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(2, cPage * numPerPage);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				listTmp = new ArrayList();
				listTmp.add(rs.getString("title"));
				listTmp.add(rs.getString("start_addr"));
				listTmp.add(rs.getString("end_addr"));
				listTmp.add(rs.getString("responser"));
				listTmp.add(rs.getDate("try_date"));
				listTmp.add(rs.getInt("board_no"));
				list.add(listTmp);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	// count
	public int matchingListCount(Connection conn) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("matchingListCount");
		ResultSet rs = null;
		int result = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	// 드라이버 상태 여부 확인
	public int dirverStatusCheck(Connection conn, String driver) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("diverIdCheck");
		int result = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, driver);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

}
