<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<!-- This Page's Include and import Files -->
<script src="https://sdk.accountkit.com/en_US/sdk.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/signUpMain-Style.css?ver=1.1" rel="stylesheet">
<%-- <script src="<%=request.getContextPath()%>/js/signUpMain-js.js?ver=1.1" charset="utf-8"></script> --%>

<!-- ----------------End----------------- -->
<div class="container">
	<h1>Sign Up</h1>
	<div class="row content_margin">
		<div class="col-xl-1"></div>
		<div class="col-xl-10 content-background">
			<div>Truck-Ta [DEV MODE] uses Account Kit, a Facebook
				technology, to help you sign in. You don't need a Facebook account.
				An SMS or text confirmation may be sent to verify your number.
				Message and data rates may apply. Learn how Facebook uses your info
			</div>
			<form class="form-style" id="sendform" method="post">
				<div class="form-group">
					<label for="phone_number">Input Your Phone Number</label> <input type="text"
						 name="phone_number" id="phone_number"
						class="form-control input-phonenumber" placeholder="010-XXXX-XXXX" />
			</form>
		</div>
		<div class="form-style">
			<div>
				</form>
				<button onclick="duplicateCheck();"
					class="btn btn-warning button-send">
					<span class="span-send">Send</span>
				</button>
			</div>

		</div>
		<div class="col-xl-1"></div>
	</div>
</div>
<script>
AccountKit_OnInteractive = function() {
	  AccountKit.init({
	    appId: 1787619668211832,
	    state: "12345",
	    version: "v1.1",
	    fbAppEventsEnabled: true,
	    redirect: ""
	  });
	};

	// login callback
	function loginCallback(response) {
	  if (response.status === "PARTIALLY_AUTHENTICATED") {
	    var code = response.code;
	    var csrf = response.state;
	    sessionStorage.setItem("isCertified", true);
	    sendPhoneNumber();
	    // Send code to server to exchange for access token
	  } else if (response.status === "NOT_AUTHENTICATED") {
	    // handle authentication failure
	    alert("정상적인 방법이 아닙니다.");
	    $("input[name=phone_number]").val("");
	  } else if (response.status === "BAD_PARAMS") {
	    // handle bad parameters
	    alert("정상적인 방법이 아닙니다.");
	    $("input[name=phone_number]").val("");
	  }
	}

	// phone form submission handler
	function smsLogin() {
	  var countryCode = "+82";
	  var phoneNumber = document.getElementById("phone_number").value;
	/*   console.log(userTpyeCheck()); */
	  AccountKit.login(
	    "PHONE",
	    {
	      countryCode: countryCode,
	      phoneNumber: phoneNumber
	    }, // will use default values if not specified
	    loginCallback
	  );
	}

	function sendPhoneNumber() {
	  var form = document.getElementById("sendform");
	  form.action = "signUpClient.jsp";
	  form.submit();
	}
	function phoneNumberCheck() {
	  var reg = /^(?:(010-\d{4})|(01[1|6|7|8|9]-\d{3,4}))-(\d{4})$/;

	  var temp = $("input[name=phone_number]").val();

	  if (!reg.test(phone_number)) {
	    alert("비정상적인 휴대폰번호 양식입니다.");
	    $("input[name=phone_number]").val("");
	  } else {
	    duplicateCheck();
	  }
	}

	function duplicateCheck() {
	  var phone_number = $("input[name=phone_number]").val();

	  $.ajax({
	    type: "POST",
	    url: "<%=request.getContextPath()%>/client/duplicateCheck",
	    data: {
	      id: phone_number
	    },
	    datatype: "json",
	    success: function(data) {
	      if (data == "true") {
	        smsLogin();
	      } else {
	        alert("이미 사용중인 아이디 입니다.");
	        $("input[name=phone_number]").val("");
	      }
	    },
	    error: function(e) {
	      alert("에러발생");
	    }
	  });
	}
</script>


<%@ include file="/views/common/footer.jsp"%>