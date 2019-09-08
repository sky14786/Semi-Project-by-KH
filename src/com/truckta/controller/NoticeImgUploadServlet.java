package com.truckta.controller;

import java.io.File;
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
public class NoticeImgUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeImgUploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 이미지 서버에 업로드
		// 경로 : /WEB-INF/resource/images/notice_img
		if(!ServletFileUpload.isMultipartContent(request)) {
			response.sendRedirect("/");
			return;
		}
		// 예외처리 해야함(확장자 필터, 크기 등등)
		// 프론트에서 파일 크기, 확장자 필터
		
		String saveDir = getServletContext().getRealPath("/WEB-INF/resource/images/notice_img");
		int maxSize = 1024 * 1024 * 2;
		
		MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, "UTF-8", new DefaultFileRenamePolicy());
//		System.out.println(mr);
		Enumeration<String> e = mr.getFileNames();
		List<String> fileNames = new ArrayList<String>();
		while (e.hasMoreElements()) {
			fileNames.add(mr.getFilesystemName( (String)e.nextElement() ));
			System.out.println(fileNames);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
