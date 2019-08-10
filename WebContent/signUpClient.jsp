<%@page import="java.io.Console"%> <%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" href="css/bootstrap.css" />
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <link
      href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
      rel="stylesheet"
    />
    <title>Truckta ~ SignUp Client</title>
    <style>
      .container {
        font-family: "Noto Sans KR", sans-serif;
      }
      .inputFile {
        height: 45px;
      }

      .navbar {
        height: 65px;
        width: 100%;
      }

      .navbar-brand {
        width: 200px;
      }

      .navInput {
        width: 200px;
      }

      .navButton {
        width: 100px;
      }
    </style>
    <script type="text/javascript">
      if (!sessionStorage.getItem("isCertified")) {
      	alert('비정상적인 접근입니다.');
      	location.href = "signUpMain.html";
      }
    </script>
    
  </head>

  <body>
  <%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("phone_number");
	%>
    <div class="container">
      <div class="navbar navbar-expand-xl bg-dark navbar-dark fixed-top">
        <a href="" class="navbar-brand d-none d-sm-block">WWW.TRUCKTA.COM</a>

        <form class="navbar-form pull-left" role="search">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="Search" size="28" />
            <div class="input-group-append">
              <button type="submit" class="btn btn-success">
                검색
              </button>
            </div>
          </div>
        </form>
      </div>
      <br /><br /><br />
      <div class="row">
        <div class="col-xl-2"></div>
        <div class="col-xl-8">
          <h2>Client Sign Up</h2>
          <form
            action="clientSignUp.do"
            method="post"
            name="sendform"
            enctype="multipart/form-data"
            onsubmit="return checkData();"
          >
            <div class="form-group">
              <label for="id">Id</label>
              <input
                type="text"
                name="id"
                id="id"
                class="form-control"
                placeholder="Phone Number"
                value="<%=id%>"
                readonly
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
    <script type="text/javascript">
      function checkData() {
        //조건1. 8~14 영문 대소문자
        //조건2. 최소 1개의 숫자 혹은 특수 문자를 포함해야 함
        var pwChecking = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,14}$/;
        var idChecking = /[^0-9]/g;
        var formatChecking = /\.(jpg|pdf|jpeg|png)$/i;
        var sizeChecking = 1024 * 1024 * 3;

        if (!(idChecking.test($("input[name=id]").val()) || $("input[name=id]").val())) {
          alert("아이디가 정상적이지 못합니다.");
          return false;
        }

        if (!pwChecking.test($("input[name=pw]").val())) {
          alert("비밀번호는 8~14자 영소문자,대문자로 이루어져 있습니다.");
          return false;
        }

        if ($("input[name=pw]").val() != $("input[name=pwCheck]").val()) {
          alert("비밀번호가 일치하지 않습니다.");
          $("input[name=pwCheck]").val("");
          return false;
        }

        if (!$("input[name=name]").val()) {
          alert("이름을 입력해 주세요.");
          return false;
        }

        if ($("input[name=profile]").val()) {
          if (
            !formatChecking.test(
              $("input[name=profile]")
                .val()
                .toLowerCase()
            )
          ) {
            alert("프로필사진의 확장자를 확인해 주세요. [pdf,jpg,jpeg,png]");
            $("input[name=profile]").val("");
            return false;
          }
        }

        if ($("input[name=profile]").val()) {
          var size = document.getElementById("profile").files[0].size;
          if (sizeChecking < size) {
            alert("프로필사진의 용량을 확인해 주세요. [3MB]");
            $("input[name=profile]").val("");
            return false;
          }
        }

        if (!$("input:checkbox[name=isAgree]").is(":checked")) {
          alert("이용약관에 동의해 주세요.");
          return false;
        }
        
        sessionStorage.removeItem("isCertified");
      }
    </script>
  </body>
</html>
