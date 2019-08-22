<%@page import="java.io.Console"%> <%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <!-- [Start Import]This Page import Script and external library -->
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
    <script src="https://sdk.accountkit.com/en_US/sdk.js"></script>
    <link href="../../css/resetPassword-Style.css?ver=1.1" rel="stylesheet" />
    <script src="../../js/signUpMain-js.js?ver=1.1" charset="utf-8"></script>
    <!-- [end import] -->

    <!-- Moog Import Script -->
    <link href="../../css/style.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudfla
    re.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
    <!-- eng moog import script -->
    <title>Truck ~ Ta Find Password Page</title>
  </head>

  <body>
    <nav
      class="navbar sticky-top container-fluid d-flex justify-content-center"
      name="top-nav"
      id="top-nav"
    >
      <div class="input-group">
        <img
          src="../../WEB-INF/resource/project_images/t-logo-png-twitter-logo-18.png"
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
    <div class="container">
      <br /><br /><br /><br /><br /><br />
      <div class="row">
        <div class="col-xl-1"></div>
        <div class="col-xl-5 left-image d-none d-sm-block">
          <img
            src="../..//WEB-INF/resource/project_images/ResetPassword-Thumbnail.jpg"
            alt=""
            class="img-thumbnail"
          />
        </div>
        <div class="col-xl-5 right-input">
          <h2>You can reset your password</h2>
          <br /><br />
          <form action="<%=request.getContextPath() %>/pwreset.do" method="post">
            <div class="form-group">
              <label for="password">Please enter a password to reset</label>
              <input
                type="password"
                name="password"
                id="password"
                class="form-control"
                placeholder="********"
              />
            </div>
            <div class="form-group">
              <label for="password_check">Password Check</label>
              <input
                type="password"
                name="password_check"
                id="password_check"
                class="form-control"
                placeholder="********"
              />
            </div>

            <br />
            <button type="submit" class="btn btn-primary btn-submit">Reset Password</button>
          </form>
        </div>
      </div>
    </div>
  </body>
</html>
