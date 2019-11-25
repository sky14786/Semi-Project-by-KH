package com.truckta.boardqna.q.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

@WebServlet("/qnaupdate")

public class BoardQnaFormUpdateEndServlet extends HttpServlet {
	final private int maxSize = 1024 * 1024 * 3;
	private static final long serialVersionUID = 1L;

	public BoardQnaFormUpdateEndServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!ServletFileUpload.isMultipartContent(request)) {

			request.getSession().setAttribute("isCertified", false);

			request.setAttribute("location", "/");

			request.setAttribute("message", "잘못된 접근입니다. 홈으로 이동합니다.");

			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);

		}

		String path = request.getServletContext().getRealPath("/images/qna_images");

		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();

		MultipartRequest mul = new MultipartRequest(request, path, maxSize, "utf-8", policy);

		String now = new SimpleDateFormat("yyyyMMddHmsS").format(new java.util.Date());

		FileQnaService fileService = new FileQnaService();

		BoardQnaQService qnaService = new BoardQnaQService();

		int boardNo = Integer.parseInt(mul.getParameter("boardNo"));

		BoardQnaQ temp = qnaService.findBoardQnaQ(boardNo);

		temp.setEtc(mul.getParameter("etc"));

		temp.setTitle(mul.getParameter("title"));
		
		List<FileQna> fileQnaList = new ArrayList<FileQna>();
		List<FileQna> files = fileService.findFileList(boardNo);

		int i = 0;

		for (; i < 5; i++) {
			String nameTag = "qnaPic" + (i + 1);
			if (mul.getFilesystemName(nameTag) != null) {
				boolean uploadFile = false;
				if (i < files.size()) {
					uploadFile = (fileService.deleteQnaFile(files.get(i).getFileName()) == 1);
				} else {
					uploadFile = true;
				}
				if (uploadFile) {
					String dir = path + "/" + mul.getFilesystemName(nameTag);
					File oldFile = new File(dir);
					String tempDir = path + "/" + temp.getBoardNo() + "_" + now + "_" + mul.getFilesystemName(nameTag);
					String tempFileName = temp.getBoardNo() + "_" + now + "_" + mul.getFilesystemName(nameTag);
					fileService.uploadQnaFile(new FileQna(temp.getBoardNo(), tempFileName));
					File newFile = new File(tempDir);
					oldFile.renameTo(newFile);
				}
			} else if (i < files.size() && mul.getParameter("org_" + nameTag).equals("null")) {
				fileService.deleteQnaFile(files.get(i).getFileName());
			}
		}
		i += qnaService.updateQna(temp);
		
		
		if (i == 6) {
//			request.getRequestDispatcher("adminBoardQnaQUpdateTry?boardNo=" + temp.getBoardNo()).forward(request,
//					response);
			request.getRequestDispatcher("/board/boardView?boardNo="+boardNo).forward(request, response);
		} else {
			request.setAttribute("location", "/");
			request.setAttribute("message", "실패! 개발자에게 문의하세요");
			request.getRequestDispatcher("../common/msg.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)

			throws ServletException, IOException {

		doGet(request, response);

	}

}
