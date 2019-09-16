package com.truckta.client.model.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.truckta.chat.model.vo.ChatHistory;
import com.truckta.chat.model.vo.MessageList;
import com.truckta.client.model.vo.Client;

import common.template.JDBCTemplate;

public class ClientDao {
	Properties prop = new Properties();

	public ClientDao() {
		String path = getClass().getResource("/").getPath()+"/sql/client/client-query.properties";
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int joinClient(Connection conn, Client temp) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("joinClient");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, temp.getId());
			pstmt.setString(2, temp.getPw());
			pstmt.setString(3, temp.getName());
			pstmt.setString(4, temp.getProfile());
			pstmt.setInt(5, temp.getUserType());

			result = pstmt.executeUpdate();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int findClient(Connection conn, String id, String name) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("findClient");
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = 1;
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int clientDuplicateCheck(Connection conn, String id) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("clientDuplicateCheck");
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (!rs.next()) {
				result = 1;
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();

		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int resetPassword(Connection conn, String id, String pw) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("resetPassword");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);

			result = pstmt.executeUpdate();

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int selectCountClient(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("selectCountClient");
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

	public List<Client> selectListPage(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectListPage");
		List<Client> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(2, cPage * numPerPage);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				Client c = new Client();
				c.setId(rs.getString("id"));
				c.setName(rs.getString("name"));
				c.setProfile(rs.getString("profile"));
				c.setRegDate(rs.getDate("regdate"));
				c.setModDate(rs.getDate("moddate"));
				c.setUserType(rs.getInt("user_type"));
				c.setStatus(rs.getInt("status"));
				list.add(c);
			}

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	
	public Client selectId(Connection conn,String id,String pw) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectId");
		Client c=null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			System.out.println(id+"/"+pw);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				
				c=new Client();
				c.setId(rs.getString("id"));
				c.setPw(rs.getString("pw"));
				c.setName(rs.getString("name"));
				c.setProfile(rs.getString("profile"));
				c.setRegDate(rs.getDate("regDate"));
				c.setModDate(rs.getDate("regDate"));
				c.setUserType(rs.getInt("user_Type"));
				c.setStatus(rs.getInt("status"));
				System.out.println(c);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return c;
	}

	public int selectCountMessageList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectCountMessageList");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		} 
		
		System.out.println("result : " + result);
		
		return result;
	}

	public List<MessageList> selectMessageList(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectMessageList");
		List<MessageList> list = new ArrayList();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MessageList ml = new MessageList();
				ml.setRoomNo(rs.getInt("room_no"));
				ml.setUserA(rs.getString("user_a"));
				ml.setUserB(rs.getString("user_a"));
				ml.setUserC(rs.getString("user_a"));
				ml.setBoardNo(rs.getInt("board_no"));
				ml.setCreatedDate(rs.getDate("created_date"));
				list.add(ml);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public List<ChatHistory> selectChatHistory(Connection conn, String room) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ChatHistory> list = new ArrayList();
		String sql = prop.getProperty("selectChatHistory");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(room));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ChatHistory ch = new ChatHistory();
				ch.setRoomNo(Integer.parseInt(room));
				ch.setSender(rs.getString("sender"));
				ch.setChatText(rs.getString("chat_text"));
				ch.setSentDate(rs.getDate("sent_date"));
				list.add(ch);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	// DB 에 메세지 보낼때 기록 남기기
	public int sendChat(Connection conn, ChatHistory ch) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("sendChat");
		try {
			pstmt = conn.prepareStatement(sql);
			System.out.println("//////////////////");
			System.out.println(ch);
			System.out.println(ch.getRoomNo());
			pstmt.setInt(1, ch.getRoomNo());
			pstmt.setString(2, ch.getSender());
			pstmt.setString(3, ch.getChatText());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
		
	}
}
