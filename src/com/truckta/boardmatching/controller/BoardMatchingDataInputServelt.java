package com.truckta.boardmatching.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.truckta.boardmatching.model.service.BoardMatchingService;
import com.truckta.boardmatching.model.vo.BoardMatching;
import com.truckta.driver.model.service.DriverService;
import com.truckta.file.matching.model.vo.FileMatching;

import common.fileRename.BoFileRename;

@WebServlet("/board/upload.do")
public class BoardMatchingDataInputServelt extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7978942067523378440L;

	public BoardMatchingDataInputServelt() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 이미지 서버에 업로드
		// 경로 : /images/boardMatching_images	
		if(!ServletFileUpload.isMultipartContent(request)) {
			response.sendRedirect("/");
			return;
		}

		// 파일이 저정되 세이브 경로를 얻어옴
		String saveDir = getServletContext().getRealPath("/images/boardMatching_images");
		int maxSize = 1024 * 1024 * 20; // 20M
		
		MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, "utf-8", new BoFileRename());
		
		// 데이터
		BoardMatching bm = new BoardMatching();
		
		String boardStuff = mr.getParameter("boardStuff");
		String stAddrPost = mr.getParameter("stAddrPost");
		String stAddr = mr.getParameter("stAddr");
		String stAddrDe = mr.getParameter("stAddrDe");
		
		bm.setTitle(boardStuff);
		String startAddr = stAddrPost;
		startAddr += "," + stAddr;
		startAddr += "," + stAddrDe;
		bm.setStartAddr(startAddr);
		
		String endAddrPost = mr.getParameter("endAddrPost");
		String endAddr = mr.getParameter("endAddr");
		String endAddrDe = mr.getParameter("endAddrDe");
		
		String edAddr = endAddrPost;
		edAddr += "," + endAddr;
		edAddr += "," + endAddrDe;
		bm.setEndAddr(edAddr);
		
		String textArea = mr.getParameter("boardTextA");
		bm.setEtc(textArea);
		
		String carType = mr.getParameter("carType");
		bm.setCarTypeNo(Integer.parseInt(carType));
		
		String boardMemo = mr.getParameter("boardMemo");
		bm.setMemo(boardMemo);
		String boardDate = mr.getParameter("boardDate");
	
		SimpleDateFormat tf = new SimpleDateFormat("MM/dd/yyyy");
		try {
			Date to = tf.parse(boardDate);
			bm.setHireDate(to);
		} catch (java.text.ParseException e) {
			e.printStackTrace();
		}
		
		// boardNo(int), boardState(int), count(int)
//		String writer = (String)request.getSession().getAttribute("writer");
//		String writer = "writer";
		bm.setWrtier("010-0335-0361");
		
		// 유저 - 드라이버 확인
		int userDriver = new DriverService().driverCheck(bm.getWrtier());
		if(userDriver == 0) {
			response.sendRedirect(request.getContextPath()+"/views/user/notice.jsp");
			return;
		}
		
		int result = new BoardMatchingService().insertBoardMatching(bm);
		System.out.println("입력 성공 : " + result);
		if(result == 1) {
			int resultBoNum = new BoardMatchingService().searchBoardNum(bm);
			//System.out.println("보드넘ber : " + resultBoNum);
			List<FileMatching> list = new ArrayList<FileMatching>();
			FileMatching fm = null;
			Enumeration<String> e = mr.getFileNames();
			List<String> fns = new ArrayList<String>();
			while (e.hasMoreElements()) {
				fns.add(mr.getFilesystemName((String)e.nextElement()));
			}
			
			for (int i = 0; i < fns.size(); i++) {
				String imgFileName = fns.get(i);
				fm = new FileMatching(resultBoNum, imgFileName);
				if(!fm.getFileName().equals("")) list.add(fm);
			}//for
			
			// 이미지 경로 저장
			int imgResult = new BoardMatchingService().insertImgBoardMatching(list);

			// 이미지 삭제
			if(imgResult == 0) {
				for (int i = 0; i < fns.size(); i++) {
					String imgFileName = fns.get(i);
					System.out.println("delete save img dir : " + saveDir+mr.getFilesystemName("boardImages"+i));
					File file = new File(saveDir+ "/" + imgFileName);
					if(file.exists()) file.delete();
					int imgCk = new BoardMatchingService().deleteImg(resultBoNum);
					System.out.println(imgCk==1?"DB이미지 삭제성공":"DB이미지 삭제실패");
				}//for
			}
			
		}else {
			// 서버에 이미지 삭제
			List<FileMatching> list = new ArrayList<FileMatching>();
			Enumeration<String> e = mr.getFileNames();
			List<String> fns = new ArrayList<String>();
			while (e.hasMoreElements()) {
				fns.add(mr.getFilesystemName((String)e.nextElement()));
			}

			for (int i = 0; i < fns.size(); i++) {
				String imgFileName = fns.get(i);
				File file = new File(saveDir+ "/" + imgFileName);
				if(file.exists()) file.delete();
			}//for
		}//endif
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
