package com.truckta.boardqna.q.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.truckta.boardqna.q.model.service.BoardQnaQService;
import com.truckta.boardqna.q.model.vo.BoardQnaQ;

/**
 * Servlet implementation class BoardQnaFormEndServlet
 */
@WebServlet("/board/boardFormEnd")
public class BoardQnaFormEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardQnaFormEndServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// ParameterNames id(qNo) , title, writer, etc ,type, up_file
		if (!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("message", "잘못된 방법으로 접근하셨습니다");
			request.setAttribute("location", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		String saveDir = getServletContext().getRealPath("/images/qna_images");
		File dir = new File(saveDir);
		if (dir.exists()) {
			dir.mkdirs();
		}

		// 2. 업로드 파일크기 설정
		int maxSize = 1024 * 1024 * 1024;

		// Multipartrequest객체 생성
		MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, "UTF-8", null);

		String qNo = request.getParameter("id");
		// 클라이언트가 보내준값을 DB에 저장하기
		String title = mr.getParameter("title");
		String writer = mr.getParameter("writer");
		String etc = mr.getParameter("etc");
		int type = Integer.parseInt(mr.getParameter("type"));

		BoardQnaQ q = new BoardQnaQ(title, writer, etc, type);

		int result = new BoardQnaQService().insertBoard(q);
		String message = "";
		String location = "";
		if (result > 0) {
			message = "게시글 등록 완료";
			location = "/board/boardQnaQList?id=" + qNo + "&type=" + type;
//			"/board/boardQnaQList?id="+qNo;
		} else {
			/*
			 * File remove = new File(saveDir + "/" + q.getBoardRenamedFileName());
			 * remove.delete();// 파일 삭제
			 */
			message = "게시글 등록 실패";
			location = "/board/boardQnaForm";
		}
		request.setAttribute("message", message);
		request.setAttribute("location", location);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}