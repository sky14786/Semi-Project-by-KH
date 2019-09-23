package com.truckta.file.driver.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.truckta.file.driver.model.vo.FileDriver;

import common.template.JDBCTemplate;

public class FileDriverDao {
   Properties prop = new Properties();

   public FileDriverDao() {
      String path = getClass().getResource("/").getPath() + "/sql/filedriver/filedriver-query.properties";
      try {
         prop.load(new FileReader(path));
      } catch (IOException e) {
         e.printStackTrace();
      }
   }

   public int joinDriver(Connection conn, List<FileDriver> files) {
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("joinDriver");
      int result = 0;
      try {
         pstmt = conn.prepareStatement(sql);
         for (int i = 0; i < files.size(); i++) {
            pstmt.setString(1, files.get(i).getId());
            pstmt.setString(2, files.get(i).getFileName());
            result += pstmt.executeUpdate();
         }

      } catch (SQLException sqle) {
         sqle.printStackTrace();
      } finally {
         JDBCTemplate.close(pstmt);
      }
      return result;
   }

   public List<FileDriver> findDriverFile(Connection conn, String id) {
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("findDriverFile");
      List<FileDriver> fileList = new ArrayList<FileDriver>();
      ResultSet rs = null;
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, id);
         rs = pstmt.executeQuery();

         while (rs.next()) {
            FileDriver fd = new FileDriver();
            fd.setFileName(rs.getString("file_name"));
            fd.setId(rs.getString("id"));
            fileList.add(fd);
         }
         System.out.println("DAO" + fileList.toString());
      } catch (SQLException sqle) {
         sqle.printStackTrace();
      } finally {
         JDBCTemplate.close(rs);
         JDBCTemplate.close(pstmt);
      }
      return fileList;
   }

   public int deleteDriverFile(Connection conn, String fileName) {
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("deleteDriverFile");
      int result = 0;
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, fileName);

         result = pstmt.executeUpdate();
      } catch (SQLException sqle) {
         sqle.printStackTrace();
      } finally {
         JDBCTemplate.close(pstmt);
      }
      return result;
   }

   public int joinDriver(Connection conn, FileDriver fd) {
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("joinDriver");
      int result = 0;
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, fd.getId());
         pstmt.setString(2, fd.getFileName());
         result = pstmt.executeUpdate();
      } catch (SQLException sqle) {
         sqle.printStackTrace();
      } finally {
         JDBCTemplate.close(pstmt);
      }
      return result;
   }

   public List<FileDriver> selectAllFiles(Connection conn) {
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("selectAllFiles");
      ResultSet rs = null;
      List<FileDriver> list = new ArrayList<FileDriver>();
      try {
         pstmt = conn.prepareStatement(sql);
         rs = pstmt.executeQuery();

         while (rs.next()) {
            FileDriver temp = new FileDriver();
            temp.setFileName(rs.getString("file_name"));
            temp.setId(rs.getString("id"));
            list.add(temp);
         }
      } catch (SQLException sqle) {
         sqle.printStackTrace();
      } finally {
         JDBCTemplate.close(rs);
         JDBCTemplate.close(pstmt);
      }
      return list;
   }

}