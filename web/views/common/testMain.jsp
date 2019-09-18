<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.truckta.boardqna.q.model.vo.BoardQnaQ" %>
<%
	Client clientLogin = (Client) session.getAttribute("loginClient");
    BoardQnaQ q=new BoardQnaQ();
%>

<%@ include file="/views/common/header.jsp"%>

<%if(clientLogin!=null&&clientLogin.getId().equals("admin")) {%>
<%@ include file="/views/admin/adminHeader.jsp"%>
<%} %>
 <%if(clientLogin!=null&&clientLogin.getId().equals(q.getqUser())) { %>
<%@ include file="/views/common/clientHeader.jsp"%>
<%} %>
<%@ include file="/views/common/footer.jsp"%> --%>