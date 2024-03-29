package com.truckta.detail.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.detail.model.vo.Detail;
import com.truckta.detail.service.DetailService;
import com.truckta.file.driver.model.service.FileDriverService;
import com.truckta.file.driver.model.vo.FileDriver;
import com.truckta.file.matching.model.service.FileMatchingService;
import com.truckta.file.matching.model.vo.FileMatching;
import com.truckta.matching.model.service.MatchingService;
import com.truckta.matching.model.vo.Matching;

/**
 * Servlet implementation class DetailServlet
 */
@WebServlet("/detail")
public class DetailServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String boardNo = request.getParameter("boardNo");
      DetailService service = new DetailService();
      
      // selecting the Detailed view info
      Detail d = service.selectDetail(boardNo);
      String startAddr[] = d.getStartAddr().split(",");
      String endAddr[] = d.getEndAddr().split(",");
      
      //Getting the list of bade drivers
      List<Matching> badeList = new MatchingService().selectMatches(boardNo);
      // 업로드한 사진 가져오기
      List<FileMatching> fileList = new FileMatchingService().detailimg(boardNo);
      List<FileDriver>  driverFileList = new FileDriverService().selectAllFiles();
      // 매칭된 상태리스트
      int result = new MatchingService().matCount(Integer.parseInt(boardNo));
      request.setAttribute("matCompl", result);
      
//      System.out.println(driverFileList.toString());
//      List<String> plist = service.selectProfile();
      request.setAttribute("driverFileList", driverFileList);
      request.setAttribute("filelist", fileList);
      request.setAttribute("badeList", badeList);
      request.setAttribute("startAddr", startAddr[1]);
      request.setAttribute("endAddr", endAddr[1]);
      request.setAttribute("boardNo", boardNo);
      request.setAttribute("d", d);
      
      request.getRequestDispatcher("/views/detail/detailView.jsp").forward(request, response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}