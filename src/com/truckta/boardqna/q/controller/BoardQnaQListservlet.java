package com.truckta.boardqna.q.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.boardqna.q.model.service.BoardQnaQService;
import com.truckta.boardqna.q.model.vo.BoardQnaQ;

/**
 * Servlet implementation class BoardQnaQListservlet
 */
@WebServlet("/board/boardQnaQList")
public class BoardQnaQListservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardQnaQListservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// TODO Auto-generated method stub
			  
		int cPage;
		int type= Integer.parseInt(request.getParameter("type"));
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		int numPerPage=15;
		
		
		String qUser = request.getParameter("id");
		
		int totalBoard=new BoardQnaQService().selectCountBoardQnaQ(type);
		List<BoardQnaQ> list=new BoardQnaQService().selectBoardList(cPage, numPerPage,qUser);
		
		
		int totalPage=(int)Math.ceil((double)totalBoard/numPerPage);
		
		String pageBar = "";
		int pageSizeBar = 5;

		int pageNo = ((cPage - 1) / pageSizeBar) * pageSizeBar + 1;
		int pageEnd = pageNo + pageSizeBar - 1;
		
		if(pageNo==1) {
			pageBar+="<sapn>[이전]</sapn>";
		}else {
			pageBar+="<a href='"+request.getContextPath()
			+"/board/boardQnaQList?cPage="+(pageNo-1)+"'>[이전]</a>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span>"+pageNo+"</span>";
			}
			else {
				pageBar+="<a href='"+request.getContextPath()
				+"/board/boardQnaQList?cPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		}
		else {
			pageBar+="<a href='"+request.getContextPath()
			+"/board/boardQnaQList?cPage="+(pageNo)+"'>[다음]</a>";
		}
		
		
		request.setAttribute("pageBar",pageBar);
		request.setAttribute("cPage",cPage);
		request.setAttribute("list",list);
		request.setAttribute("type", type);
		
		
		request.getRequestDispatcher("/views/user/board_qna_q.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
