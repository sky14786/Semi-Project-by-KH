<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<!-- This Page's Include and import Files -->
<script src="https://sdk.accountkit.com/en_US/sdk.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/signUpMain-Style.css?ver=1.4" rel="stylesheet">

<!-- ----------------End----------------- -->
<div class="container">
	<h1>회원 가입</h1>
	<div class="row content_margin">
		<div class="col-xl-2"></div>
		<div class="col-xl-1"></div>
		<div class="col-xl-6 content-background">
			<div>
			<!-- 	Truck-Ta [DEV MODE] uses Account Kit, a Facebook
					technology, to help you sign in. You don't need a Facebook account.
					An SMS or text confirmation may be sent to verify your number.
					Message and data rates may apply. Learn how Facebook uses your info -->
				<textarea class="form-control" rows="17" cols="20" style ="background-color:white;" readonly>
1. 개인정보의 처리 목적(‘www.truckta.com’이하 ‘트럭타’) 은(는) 다음의 목적을 위하여 개인정보를 처리하고 있으며, 다음의 목적 이외의 용도로는 이용하지 않습니다. 
- 고객 가입의사 확인, 고객에 대한 서비스 제공에 따른 본인 식별.인증, 회원자격 유지.관리, 물품 또는 서비스 공급에 따른 금액 결제, 물품 또는 서비스의 공급.배송 등
2. 개인정보의 처리 및 보유 기간 
① <트럭타>(‘www.truckta.com’이하 ‘트럭타’) 은(는) 정보주체로부터 개인정보를 수집할 때 동의 받은 개인정보 보유․
이용기간 또는 법령에 따른 개인정보 보유․이용기간 내에서 개인정보를 처리․보유합니다.
② 구체적인 개인정보 처리 및 보유 기간은 다음과 같습니다.
☞ 아래 예시를 참고하여 개인정보 처리업무와  개인정보 처리업무에 대한 보유기간 및 관련 법령, 근거 등을 기재합니다.(예시)- 고객 가입 및 관리 : 서비스 이용계약 또는 회원가입 해지시까지, 다만 채권․채무관계 잔존시에는 해당 채권․채무관계 정산시까지
- 전자상거래에서의 계약․청약철회, 대금결제, 재화 등 공급기록 : 5년
3. 개인정보의 제3자 제공에 관한 사항 
① <트럭타>('www.truckta.com'이하 '트럭타')은(는) 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.
②<트럭타>('www.truckta.com')은(는) 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.
③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.
1. <트럭타>- 개인정보를 제공받는 자 : 트럭타- 제공받는 자의 개인정보 이용목적 : 휴대전화번호, 비밀번호, 로그인ID
- 제공받는 자의 보유.이용기간: 지체없이 파기
2. 개인정보처리 위탁<트럭타>은(는) 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다. 
3. - 위탁받는 자 (수탁자) : 트럭타- 위탁하는 업무의 내용 : 회원제 서비스 이용에 따른 본인확인
- 위탁기간 : 지체없이 파기<트럭타>('www.truckta.com'이하 '트럭타'은(는) 위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.
3. 삭제요구
4. 처리정지 요구
5. 정보주체와 법정대리인의 권리·의무 및 그 행사방법 이용자는 개인정보주체로써 다음과 같은 권리를 행사할 수 있습니다.
① 정보주체는 트럭타(‘www.truckta.com’이하 ‘트럭타) 에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.
1. 개인정보 열람요구 
2. 오류 등이 있을 경우 정정 요구 
6. 처리하는 개인정보의 항목 작성 
① <트럭타>('www.truckta.com'이하  '트럭타')은(는) 다음의 개인정보 항목을 처리하고 있습니다.
<홈페이지 관리>- 필수항목 : 휴대전화번호, 비밀번호, 로그인ID - 선택항목 : 휴대전화번호, 비밀번호, 로그인ID
7. 개인정보의 파기<트럭타>은(는) 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다. 
-파기절차 이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다. 
-파기기한 이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.
8. 개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항
① 트럭타 은 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠기(cookie)’를 사용합니다.
② 쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC 컴퓨터내의 하드디스크에 저장되기도 합니다.
가. 쿠키의 사용 목적 : 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다.
나. 쿠키의 설치•운영 및 거부 : 웹브라우저 상단의 도구>인터넷 옵션>개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다.
다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.9. 개인정보 보호책임자 작성 
①  트럭타(‘www.truckta.com’이하 ‘트럭타) 은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.
▶ 개인정보 보호책임자 성명 :김준영 직책 :사원 직급 :사원 연락처 :01094421732, sky14786@gmail.com, 
※ 개인정보 보호 담당부서로 연결됩니다.
▶ 개인정보 보호 담당부서 부서명 :김준영 담당자 :김준영 연락처 :01094421732, sky14786@gmail.com, 
② 정보주체께서는 트럭타(‘www.truckta.com’이하 ‘트럭타) 의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 트럭타(‘www.truckta.com’이하 ‘트럭타) 은(는) 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.
9. 개인정보 처리방침 변경 
①이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.
10. 개인정보의 안전성 확보 조치 <트럭타>은(는) 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.
1. 내부관리계획의 수립 및 시행 개인정보의 안전한 처리를 위하여 내부관리계획을 수립하고 시행하고 있습니다.
2. 해킹 등에 대비한 기술적 대책은 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신·점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다.
3. 비인가자에 대한 출입 통제 개인정보를 보관하고 있는 물리적 보관 장소를 별도로 두고 이에 대해 출입통제 절차를 수립, 운영하고 있습니다.
				</textarea>
			</div>
			<br>
			<form class="form-style" id="sendform" method="post">
				<div class="form-group iframe">
				<!-- <iframe src="https://www.acountkit.com"></iframe> -->
					<label for="phone_number">휴대폰 번호</label> <input type="text"
						 name="phone_number" id="phone_number"
						class="form-control input-phonenumber" placeholder="010XXXXXXXX" />
				
			</form>
		</div>
		<div class="form-style">
			<div>
				<button onclick="duplicateCheck();"
					class="btn btn-primary button-send">
					<span class="span-send">인증</span>
				</button>
			</div>

		</div>
		<div class="col-xl-2"></div>
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