package com.truckta.boardmatching.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.fileRename.BoFileRename;

@WebServlet("/board/upload")
public class BoardMatchingDataInputServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	public BoardMatchingDataInputServelt() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
//		System.out.println("보드서블릿 ㅇ");
		
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
		System.out.println(saveDir);
		int maxSize = 1024 * 1024 * 20; // 20M
		
		MultipartRequest mr= new MultipartRequest(
				request,
				saveDir,
				maxSize,
				"UTF-8",
				new BoFileRename()
//				new DefaultFileRenamePolicy()
				);
	        
//		String test = mr.getParameter("test");
//		Object o = mr.getParameter("test");
//		System.out.println((Test)o.);
		
//		String h_date = new SimpleDateFormat("yyyyMMddHmsS").format(new Date());
		//09/14/2019
		
//        String fi = mr.getParameter("imgNamess");
//        String imgFiles[] = fi.split(",");
//        System.out.println(fi);
        
        
        
//        for (int i = 0; i < imgFiles.length; i++) {
//        	String dirTmp = saveDir + "/" + imgFiles[i];
//        	File oldFile = new File(dirTmp);
//        	dirTmp = saveDir + "/" + h_date + imgFiles[i];
//        	File newFile = new File(dirTmp);
//        	if( oldFile.exists() ) oldFile.renameTo(newFile);
//        	System.out.println(oldFile);
//        	System.out.println(dirTmp);
//        	System.out.println(saveDir);
////        	dirTmp += ("/" + imgFiles[i]);
////			imgFiles[i] += h_date;
//		}
        
//        for (String s : imgFiles) {
//			System.out.println(s);
//		}
		
//		Enumeration<String> e = mr.getFileNames();
//		List<String> fileNames = new ArrayList<String>();
//		
//		int ck = 0;
//		while (e.hasMoreElements()) {
//			fileNames.add(mr.getFilesystemName( e.nextElement() ));
//			System.out.println(fileNames);
//			ck++;
//		}
//		System.out.println(ck);
//		for (String s : fileNames) {
//			System.out.println("s : " + s);
//		}

//		String[] strimg = mr.getFilesystemName("imgFileList");
		
		
		
		/*
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
	*/
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
