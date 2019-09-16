package com.truckta.boardmatching.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.oreilly.servlet.MultipartRequest;

import common.fileRename.BoFileRename;
import jdk.nashorn.api.scripting.JSObject;

@WebServlet("/board/upload")
public class BoardMatchingDataInputServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
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
				new BoFileRename() //file Rename board_matching
				);
		
		String boardStuff = mr.getParameter("boardStuff");
		String stAddrPost = mr.getParameter("stAddrPost");
		String stAddr = mr.getParameter("stAddr");
		String stAddrDe = mr.getParameter("stAddrDe");
		System.out.println(boardStuff + stAddrPost + stAddr + stAddrDe);
		
		String endAddrPost = mr.getParameter("endAddrPost");
		String endAddr = mr.getParameter("endAddr");
		String endAddrDe = mr.getParameter("endAddrDe");

		System.out.println(endAddrPost + endAddr + endAddrDe);
		
		String textArea = mr.getParameter("boardTextA");
		System.out.println(textArea);
		
		/* 1:일반 2:냉동차 3:탑차 4:리프트 5:기타*/
		String carType = mr.getParameter("carType");
		System.out.println(carType);
		
		String boardMemo = mr.getParameter("boardMemo");
		String boardDate = mr.getParameter("boardDate");
		
		System.out.println(boardMemo + " / " + boardDate);

		SimpleDateFormat transFormat = new SimpleDateFormat("MM/dd/yyyy");

		try {
			Date to = transFormat.parse(boardDate);
			System.out.println(to);
		} catch (java.text.ParseException e) {
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
