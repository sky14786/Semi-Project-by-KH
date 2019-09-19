<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.truckta.client.model.vo.Client"%>
<%
	/* Client clientLogin=(Client)session.getAttribute("loginClient"); */
	//쿠키값 확인해서 페이지에 반영하기
	//쿠키는 key:value형식으로 여러개 저장이 가능하기 때문에
	//쿠키객체가 배열로 저장이 됨.
	Client cl = new Client();
	System.out.println(cl);

	Cookie[] cookies = request.getCookies();
	String saveId = null;
	//내가 원하는 cookie객체를 찾아서 값을 처리
	if (cookies != null) {
		for (Cookie c : cookies) {
			//key, value를 매소드를 이용해서 가져올 수 있음
			String key = c.getName();
			String value = c.getValue();
			System.out.println("key : " + key);
			System.out.println("value : " + value);
			if (key.equals("saveId")) {
				saveId = value;
			}
		}
	}
%>

<%@ include file="/views/common/header.jsp"%>

<link href="<%=request.getContextPath()%>/css/login.css"
	rel="stylesheet" />
</head>
<body>

	<form class="form-signin ml-4" id='loginFrm'
						action="<%=request.getContextPath()%>/login" method="post"
						onsubmit="return validate();">
	<div class="container-scroller"  style="
    margin-top: 4em4;
    margin-top: 10em;">
      <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="content-wrapper d-flex align-items-center auth auth-bg-1 theme-one">
          <div class="row w-100">
            <div class="col-lg-4 mx-auto">
              <div class="auto-form-wrapper">
                  <div class="form-group">
                    <label class="label">핸드폰 번호</label>
                    <div class="input-group">
                     <input type="text" id="id" name="id"
							class="form-control LoginInputId"
							placeholder=""
							value='<%=saveId != null ? saveId : ""%>' required autofocus />
                       <div class="input-group-append">
                        <span class="input-group-text">
                          <i class="mdi mdi-check-circle-outline"></i>
                        </span>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="label">비밀번호</label>
                    <div class="input-group">
                      <input type="password" id="pw" name="pw" class="form-control"
							placeholder="*********" required> 
                      <div class="input-group-append">
                        <span class="input-group-text">
                          <i class="mdi mdi-check-circle-outline"></i>
                        </span>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <button type = "submit" class="btn btn-primary submit-btn btn-block">로그인</button>
                  </div>
                  <div class="form-group d-flex justify-content-between">
                    <div class="form-check form-check-flat mt-0">
                      <label class="form-check-label">
                        <input type="checkbox" class="form-check-input" checked> Keep me signed in </label>
                    </div>
                    <a href="<%=request.getContextPath()%>/views/user/resetpassword.jsp" class="text-small forgot-password text-black">Forgot Password</a>
                  </div> 
                  <div class="text-block text-center my-3">
                    <span class="text-small font-weight-semibold">Not a member ?</span>
                    <a href="<%=request.getContextPath() %>/user/resetpassword.jsp" class="text-black text-small">Create new account</a>
                  </div>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
	
	</form>

	
</body>
<script>

    //숫자만 입력받기 영어 한글 제외하는 로직
     $("input:text[name=id]").keyup(function(e) {
     var reg = /[^0-9]*$/;
     var v = $(this).val();
     if (reg.test(v)) {
     	$(this).val(v.replace(reg, ""));
         $(this).focus();
     }
     
	});  
    
	$(function(){

	    $("input:text[name=id]").on('keydown', function(e){
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
     
     function validate(){
         if($('#id').val().length==0){
           alert("아이디를 입력하세요!");
           $("#id").focus();
           return false;//form제출 막는것!
         }
         if($('#pw').val().length==0){
           alert("비밀번호를 입력하세요!");
           $('#pw').focus();
           return false;
         }
         return true;
     }  
    </script>


</html>