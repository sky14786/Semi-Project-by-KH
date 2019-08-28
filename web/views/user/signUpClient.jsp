<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />

    <!--[Start Import ] This Page Import Script and External Library -->
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <link
      href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
      rel="stylesheet"
    />
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
      integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
      crossorigin="anonymous"
    ></script>
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
      crossorigin="anonymous"
    />
    <link href="../../css/signUpClient-Style.css?ver=1.1" rel="stylesheet" />
    <script src="../../js/signUpClient-js.js?ver=1.1" charset="utf-8"></script>
    <!-- [End Import] -->

    <!-- Moog Import Script -->
    <link href="../../css/style.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudfla
re.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
    <!-- eng moog import script -->

    <title>Truckta ~ SignUp Client</title>
    <script>
      //certifiedCheck();
    </script>
  </head>

  <body>
    <nav
      class="navbar sticky-top container-fluid d-flex justify-content-center"
      name="top-nav"
      id="top-nav"
    >
      <div class="input-group">
        <img
          src="../../images/project_images/t-logo-png-twitter-logo-18.png"
          alt="logo.png"
          class="front-logo"
          id="logo"
        />
        <p>&nbsp&nbsp</p>
        <!-- search bar -->
        <input
          type="text"
          class="form-control rounded"
          placeholder="Search"
          name="search-bar"
          aria-label="Small"
          aria-describedby="inputGroup-sizing-sm"
          id="search-bar"
        />
        <p>&nbsp&nbsp</p>
        <div class="navbar-right btn btn-xs">
          <button class="btn btn-warning btn-lg" type="submit">
            <i class="fas fa-search"></i>
          </button>
          <button class="btn btn-light btn-lg" onclick="redirect();">
            <i class="fas fa-envelope"></i>
          </button>
        </div>
      </div>
    </nav>
    <% request.setCharacterEncoding("UTF-8"); String id = request.getParameter("phone_number"); %>
    <div class="container">
      <div class="navbar navbar-expand-xl bg-dark navbar-dark fixed-top">
        <a href="" class="navbar-brand d-none d-sm-block">WWW.TRUCKTA.COM</a>
        <form class="navbar-form pull-left" role="search">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="Search" size="28" />
            <div class="input-group-append">
              <button type="submit" class="btn btn-success">검색</button>
            </div>
          </div>
        </form>
      </div>
      <br />
      <br />
      <br />
      <div class="row">
        <div class="col-xl-2"></div>
        <div class="col-xl-8">
          <h2>Client Sign Up</h2>
          <form
            action="/clientSignUp.do"
            method="post"
            name="sendform"
            enctype="multipart/form-data"
          >
            <!-- onsubmit="return checkData();" -->
            <div class="form-group">
              <label for="id">Id</label>
              <input
                type="text"
                name="id"
                id="id"
                class="form-control"
                placeholder="Phone Number"
              <%--   value="<%=id%>"
                readonly --%>
              />
            </div>
            <div class="form-group">
              <label for="pw">Pw</label>
              <input
                type="password"
                name="pw"
                id="pw"
                class="form-control"
                placeholder="Password"
              />
            </div>
            <div class="form-group">
              <label for="pwCheck">Pw Check</label>
              <input
                type="password"
                name="pwCheck"
                id="pwCheck"
                class="form-control"
                placeholder="Password Check"
              />
            </div>

            <div class="form-group">
              <label for="name">Name</label>
              <input type="text" name="name" id="name" class="form-control" placeholder="NAME" />
            </div>
            <div class="form-group">
              <label for="profile">Profile Picture</label>
              <input
                type="file"
                name="profile"
                id="profile"
                class="form-control btn btn-outline-secondary inputFile"
                accept=".jpg, .png, .pdf"
              />
            </div>
            <div class="form-group form-check">
              <label for="isAgree" class="form-check-label">
                <input type="checkbox" name="isAgree" id="isAgree" />&nbsp;&nbsp;Agree
              </label>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
          </form>
        </div>
        <div class="col-xl-2"></div>
      </div>
    </div>
  </body>
</html>
