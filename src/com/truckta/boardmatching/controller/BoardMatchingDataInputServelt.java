package com.truckta.boardmatching.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class NoticeImgUploadServlet
 */
@WebServlet("/notice/upload")
public class BoardMatchingDataInputServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardMatchingDataInputServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		// 이미지 서버에 업로드
		// 경로 : /images/boardMatching_images
		if(!ServletFileUpload.isMultipartContent(request)) {
			response.sendRedirect("/");
			return;
		}
		// 예외처리 해야함(확장자 필터, 크기 등등)
		// 프론트에서 파일 크기, 확장자 필터
		// form tag 를 사용하여 데이터 전송
		
		// 파일이 저정되 세이브 경로를 얻어옴
		String saveDir = getServletContext().getRealPath("/images/boardMatching_images");
		int maxSize = 1024 * 1024 * 20; // 20M
		
		MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, "UTF-8", new DefaultFileRenamePolicy());
        
        String fi = mr.getParameter("imgNamess");
        System.out.println(fi);
		
//		Enumeration<String> e = multi.getFileNames();
//		List<String> fileNames = new ArrayList<String>();
//		
//		while (e.hasMoreElements()) {
//			fileNames.add(multi.getFilesystemName( e.nextElement() ));
//			System.out.println(fileNames);	
//		}
		
		String stuff = mr.getParameter("stuff");
		String price = mr.getParameter("price");
		String postNum = mr.getParameter("post-number");
		String startAddr = mr.getParameter("start-addr");
		String startDetail = mr.getParameter("start-detail");
		String stAddr = postNum + "," + startAddr + "," + startDetail;
		
		String postNum2 = mr.getParameter("post-number2");
		String endAddr = mr.getParameter("end-addr");
		String endDetail = mr.getParameter("end-detail");
		String edAddr = postNum2 + "," + endAddr + "," + endDetail;
		
		String etc = mr.getParameter("etc");
		String size = mr.getParameter("size");
		String memo = mr.getParameter("memo");
		String date = mr.getParameter("date");
		
		System.out.println(stuff + " / " + price);
		System.out.println(stAddr);
		System.out.println(edAddr);
//		System.out.println(postNum + " / " + startAddr + " / " + startDetail);
//		System.out.println(postNum2 + " / " + endAddr + " / " + endDetail);
		System.out.println(etc);
		System.out.println(size);
		System.out.println(memo + " / " + date);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
