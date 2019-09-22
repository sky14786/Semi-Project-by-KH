<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<!-- This Page's Include and import Files -->
<script src="https://sdk.accountkit.com/en_US/sdk.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/signUpMain-Style.css?ver=1.1" rel="stylesheet">
<%-- <script src="<%=request.getContextPath()%>/js/signUpMain-js.js?ver=1.3" charset="utf-8"></script>  --%>

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
				<div class="form-group iframe">
				<!-- <iframe src="https://www.acountkit.com"></iframe> -->
					<label for="phone_number">Input Your Phone Number</label> <input type="text"
						 name="phone_number" id="phone_number"
						class="form-control input-phonenumber" placeholder="010XXXXXXXX" />
				
			</form>
		</div>
		<div class="form-style">
			<div>
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
	    redirect: "",
	    display:"modal"
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
	
	
	 $("input:text[name=id]").keyup(function(e) {
	     var reg = /[^0-9]*$/;
	     var v = $(this).val();
	     if (reg.test(v)) {
	     	$(this).val(v.replace(reg, ""));
	         $(this).focus();
	     }
	     
		});  
	    
		$(function(){

		    $("input:text[name=phone_number]").on('keydown', function(e){
		       // 숫자만 입력받기
		    var trans_num = $(this).val().replace(/-/gi,'');
			var k = e.keyCode;
						
			if(trans_num.length >= 11 && ((k >= 48 && k <=126) || (k >= 12592 && k <= 12687 || k==32 || k==229 || (k>=45032 && k<=55203)) ))
			{
		  	    e.preventDefault();
			}
		    }).on('blur', function(){ // 포커스를 잃었을때 실행합니다.
		        if($(this).val() == '') return;

		        // 기존 번호에서 - 를 삭제합니다.
		        var trans_num = $(this).val().replace(/-/gi,'');
		      
		        // 입력값이 있을때만 실행합니다.
		        if(trans_num != null && trans_num != '')
		        {
		            // 총 핸드폰 자리수는 11글자이거나, 10자여야 합니다.
		            if(trans_num.length==11 || trans_num.length==10) 
		            {   
		                // 유효성 체크
		                var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
		                if(regExp_ctn.test(trans_num))
		                {
		                    // 유효성 체크에 성공하면 하이픈을 넣고 값을 바꿔줍니다.
		                    trans_num = trans_num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");                  
		                    $(this).val(trans_num);
		                }
		                else
		                {
		                    alert("유효하지 않은 전화번호 입니다.");
		                    $(this).val("");
		                    $(this).focus();
		                }
		            }
		            else 
		            {
		                alert("유효하지 않은 전화번호 입니다.");
		                $(this).val("");
		                $(this).focus();
		            }
		      }
		  });  
		});
</script>


<%@ include file="/views/common/footer.jsp"%>