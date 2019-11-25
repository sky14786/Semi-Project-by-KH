package com.truckta.boardqna.q.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.truckta.boardqna.q.model.service.BoardQnaQService;
import com.truckta.boardqna.q.model.vo.BoardQnaQ;
import com.truckta.file.qna.model.service.FileQnaService;
import com.truckta.file.qna.model.vo.FileQna;

/**
 * Servlet implementation class BoardQnaFormEndServlet
 */
@WebServlet("/board/boardFormEnd")
public class BoardQnaFormEndServlet extends HttpServlet {
	final private int maxSize = 1024 * 1024 * 3;
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
		MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, "UTF-8", new DefaultFileRenamePolicy());

		String qNo = request.getParameter("id");
		// 클라이언트가 보내준값을 DB에 저장하기
		String title = mr.getParameter("title");
		String writer = mr.getParameter("writer");
		String etc = mr.getParameter("etc");
		int type = Integer.parseInt(mr.getParameter("type"));
		
		BoardQnaQ q = new BoardQnaQ(title, writer, etc, type);

		int result = new BoardQnaQService().insertBoard(q);
		BoardQnaQ temp = new BoardQnaQService().findBoardQnaQ(title,writer);
		
		ArrayList<String> fileNames = new ArrayList<String>();
		Iterator fileNameIter = (Iterator) mr.getFileNames();
		while (fileNameIter.hasNext()) {
			String tryUploadFileNameTag = (String) fileNameIter.next();
			if (mr.getFilesystemName(tryUploadFileNameTag) != null) {
				fileNames.add(mr.getFilesystemName(tryUploadFileNameTag));
			}
		}
		String now = new SimpleDateFormat("yyyyMMddHmsS").format(new java.util.Date());
		List<FileQna> files = new ArrayList<FileQna>();

		for (int i = 0; i < fileNames.size(); i++) {
			String dir = saveDir + "/" + fileNames.get(i);
			File oldFile = new File(dir);

			String tempDir = saveDir + "/" + temp.getBoardNo() + "_" + now + "_" + fileNames.get(i);
			String tempFileName = temp.getBoardNo() + "_" + now + "_" + fileNames.get(i);
			FileQna fd = new FileQna(temp.getBoardNo(), tempFileName);
			files.add(fd);

			File newFile = new File(tempDir);
			oldFile.renameTo(newFile);
		}

		
		
		
		int isUpload = new FileQnaService().uploadQnaFiles(files);
		
		
		String message = "";
		String location = "";
		if (result+isUpload == result+files.size()) {
			message = "게시글 등록 완료";
			location = "/board/boardQnaQList?id=" + qNo + "&type=" + type;
//         "/board/boardQnaQList?id="+qNo;
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