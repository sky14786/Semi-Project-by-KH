package com.truckta.client.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.truckta.client.model.service.ClientService;
import com.truckta.client.model.vo.Client;

import common.template.DataEncryptionTemplate;

@WebServlet(name = "ClientLogin", urlPatterns = "/login")
public class ClientLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		// 로그인에 대한 비지니스 로직
		pw = DataEncryptionTemplate.encryptionToSHA512(pw);
		System.out.println("pw : " + pw);
		
		ClientService service = new ClientService();
		Client cl = service.selectId(id, pw);

		// DB결과에 따라서 view화면을 선택~
		String view = "";

		if (cl != null) {
			// 로그인 처리

			// 2. 로그인의 세션처리(로그인을 서버에서 유지하기 위함)
			// 세션객체를 불러옴!
			HttpSession session = request.getSession();
			// request.getSession();매개변수 true or false
			// true(defualt) : 기존에 생성된 Session객체가 있으면 불러오고 없으면 생성해서 불러옴
			// false : 기존에 생성된 Session객체가 있으면 불러오고 없으면 null값
			// default로 많이 쓰임.

			// 로그인 유지를 위해 필요한 정보를 session객체에 저장
			session.setAttribute("loginClient", cl);
			// session객체는 getSession()객체 생성했을때 생성
			// session.invalidate() 객체 소멸
			// session.setMaxInactiveInterval()//일정시간 이후 세션종료!
			// 일정시간이 후 자동 session.invalidate()실행
			// session.setMaxInactiveInterval(60);//1분동안 session을 유지
			// session listener설정

			// 쿠키에 아이디 저장하기
			String saveId = request.getParameter("saveId");
			// saveId = check가 되면 on, check안하면 null
			if (saveId != null) {
				// 쿠키에 저장하는 방법
				// 1. 쿠키객체를 생성!, 생성자 매개변수 그 쿠키의 명칭과 값을 대입
				// 첫번째 매개변수 : 키, 두번째 매개변수 : 값
				Cookie c = new Cookie("saveId", id);
				c.setMaxAge(10 * 60 * 60);//
				// c.setPath("/");//경로를 설정할 수 있음.
				response.addCookie(c);
			} else {
				// checkbox에 check가 안되있으면 저장된 cookie를 지워서
				// 다음 페이지가 열릴때 반영되지 않게 설정
				Cookie c = new Cookie("saveId", id);
				c.setMaxAge(0);// 기간이 존재하지않아 바로 생성과 동시에 삭제
				response.addCookie(c);
			}

			view = "/index.jsp";
			response.sendRedirect(request.getContextPath() + view);

		} else {
			// 에러처리
			// 1.메세지처리페이지에서 에러메세지 띄운다(경고창) 로그인 거절!
			// 2.메인화면으로 이동시킨다.
			String message = "아이디나 비밀번호가 일치하지 않습니다.";
			request.setAttribute("message", message);
			view = "/views/common/msg.jsp";
			String location = "/views/user/Login.jsp";
			request.setAttribute("location", location);
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
