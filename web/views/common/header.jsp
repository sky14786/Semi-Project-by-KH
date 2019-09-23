<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="com.truckta.client.model.vo.Client"%>

<%
   Client clientLogin = (Client) session.getAttribute("loginClient");
%>

<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Welcome to Truck~ta!!</title>
<!--[Start Import ] This Page Import Script and External Library -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
<!-- bootstrap css -->
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
   integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
   crossorigin="anonymous" />
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- style.css -->
<link href="<%=request.getContextPath()%>/css/header.css?ver=1.1"
   rel="stylesheet" />
   
<!-- font awesome cdn -->
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">   
<!-- [End Import] -->
</head>

<header class = "fixed-top">
   <nav
      class="navbar navbar-expand-md sticky-top d-flex bg-primary navbar-dark">
      <div class="input-group">
         <i class="fas fa-shipping-fast fa-3x" onclick = 'location.href = "<%=request.getContextPath()%>/index.jsp"' style = "color: white; cursor: pointer;"></i>
         <form class="ml-4 allsearch ml-1" action="<%=request.getContextPath() %>/main/mainFinder">
            <input type="text" placeholder="Search.." name = "searchKeyword"
               id="seachbar" class="pl-3 search-bar" id="search-bar seachbar" value="" />
         </form>
         
         
         <%
            if (clientLogin == null) {
         %>
         <!-- logo -->
         <button class="navbar-right btn btn-primary ml-auto mr-2" onclick = 'deny()'>
            <i class="fas fa-envelope fa-lg"></i>
         </button>
         <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent">
            <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse flex-grow-0"
            id="navbarSupportedContent">
            <ul class="navbar-nav text-right">
               <li class="nav-item active"><a class="nav-link"
                  href="<%=request.getContextPath() %>/views/user/Login.jsp">로그인</a></li>
               <li class="nav-item active"><a class="nav-link"
                  href="<%=request.getContextPath() %>/views/user/signUpClient.jsp">회원가입</a></li>
            </ul>
         </div>
      </div>
   </nav>
   <%
      } else{
   %>
   <button class="navbar-right btn btn-primary ml-auto mr-2" onclick = 'location.href = "<%=request.getContextPath()%>/messages"'>
            <i class="fas fa-envelope fa-lg"></i>
         </button>
<button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent">
            <span class="navbar-toggler-icon"></span>
         </button>
<div class="collapse navbar-collapse flex-grow-0"
            id="navbarSupportedContent">
            <ul class="navbar-nav text-right">
               <li class="nav-item active"><a class="nav-link"
                  href="<%=request.getContextPath() %>/my/pageTop">마이페이지</a></li>
               <li class="nav-item active"><a class="nav-link"
                  href="<%=request.getContextPath() %>/logout">로그아웃</a></li>
            </ul>
         </div>
      </div>
   </nav>

   <%
      }
   %>
   
   <%
      if (clientLogin != null && clientLogin.getName().equals("admin")) {
   %>
   <%@ include file="/views/admin/adminHeader.jsp"%>
   <%
      }%>
   
</header>

<script>
function redirect() {
   location.replace("./chat.html");
}
function deny(){
   alert("로그인 후 이용 가능합니다");
}
</script>
</html>
