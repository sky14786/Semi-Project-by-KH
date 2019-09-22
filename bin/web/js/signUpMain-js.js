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
  console.log(userTpyeCheck());
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
