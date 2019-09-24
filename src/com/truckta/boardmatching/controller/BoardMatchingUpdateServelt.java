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
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.truckta.boardmatching.model.service.BoardMatchingService;
import com.truckta.boardmatching.model.vo.BoardMatching;
import com.truckta.client.model.vo.Client;
import com.truckta.file.matching.model.vo.FileMatching;

import common.fileRename.BoFileRename;

@WebServlet("/board/update")
public class BoardMatchingUpdateServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public BoardMatchingUpdateServelt() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		// 수정된 데이터를 저장
		HttpSession session = request.getSession();
		Client cl = (Client)session.getAttribute("loginClient");
		if(cl == null) {
			request.setAttribute("message", "수정이 불가능합니다.");
			String path = "/index.jsp";
			request.setAttribute("location", path);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			response.sendRedirect("/");
			return;
		}

		String saveDir = getServletContext().getRealPath("/images/boardMatching_images");
		int maxSize = 1024 * 1024 * 20; // 20M

		MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, "utf-8", new BoFileRename());

		// 데이터
		String imgTemp[] = mr.getParameterValues("imgTemp");
//		for (int i = 0; i < imgTemp.length; i++) {
//			System.out.println(imgTemp[i]);
//		}
		
		BoardMatching bm = new BoardMatching();

		int ss = Integer.parseInt(mr.getParameter("boardNo"));
//		System.out.println(ss);
		
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

		SimpleDateFormat tf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date to = tf.parse(boardDate);
			bm.setHireDate(to);
		} catch (java.text.ParseException e) {
			e.printStackTrace();
		}

		bm.setWrtier(cl.getId());

//		int boardNum = ; //해당 글번호
//		int boardNum = 199;
		bm.setBoardNo(ss);
		
		int result = new BoardMatchingService().updateBoardMatching(bm);
//		System.out.println("수정 성공 : " + result);
		
		if(result == 1) {
			//기존 이미지 삭제
			List<FileMatching> listImg = new BoardMatchingService().loadBoardImg(bm.getBoardNo()); // db에서 이미지 확인

			if(listImg.size() > 0) {
				int imgCk = new BoardMatchingService().modImg(bm.getBoardNo(), imgTemp); //db에서 이미지 삭제
//				System.out.println("db 부분삭제 : " + imgCk);
				if(imgCk > 0) {
					for (int i = 0; i < imgTemp.length; i++) {
//						System.out.println("delete save img dir : " + saveDir + "/" + imgTemp[i]);
						File file = new File(saveDir+ "/" + imgTemp[i]);
						if(file.exists()) file.delete(); // 서버에서 파일 삭제
//						int imgCk = new BoardMatchingService().deleteImg(bm.getBoardNo()); //삭제후 db에서 삭제
//						System.out.println(imgCk==1?"DB이미지 삭제성공":"DB이미지 삭제실패");
					}//for
				}else {
					System.out.println("서버에서 이미지 삭제 실패!");
				}
			}

			// 변경된 파일을 DB 저장
			List<FileMatching> list = new ArrayList<FileMatching>();
			FileMatching fm = null;
			Enumeration<String> e = mr.getFileNames();
			List<String> fns = new ArrayList<String>();
			while (e.hasMoreElements()) {
				fns.add(mr.getFilesystemName((String)e.nextElement()));
			}

			for (int i = 0; i < fns.size(); i++) {
				String imgFileName = fns.get(i);
				fm = new FileMatching(bm.getBoardNo(), imgFileName);
				if(!fm.getFileName().equals("")) list.add(fm);
			}//for

			// 이미지 경로 저장
			int imgResult = new BoardMatchingService().insertImgBoardMatching(list);
			System.out.println(imgResult==1?"DB이미지 저장성공":"DB이미지 저장실패");
		}//if


	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
