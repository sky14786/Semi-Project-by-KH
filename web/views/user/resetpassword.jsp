<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link href="../../css/resetPassword-Style.css?ver=1.1" rel="stylesheet" />
<script src="../../js/signUpMain-js.js?ver=1.1" charset="utf-8"></script>
<link href="<%=request.getContextPath()%>/css/login.css"
	rel="stylesheet" />

<form class="form-signin ml-4" id='loginFrm'
						action="<%=request.getContextPath() %>/user/resetPasswordTry" method="post"
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
                    <label class="label">이름</label>
                    <div class="input-group">
                     <input type="text"
						name="userName" id="userName" class="form-control"
						/>
                       <div class="input-group-append">
                        <span class="input-group-text">
                          <i class="mdi mdi-check-circle-outline"></i>
                        </span>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="label">핸드폰 번호</label>
                    <div class="input-group">
                     <input type="text" id="id" name="id"
							class="form-control LoginInputId"
							placeholder=""
							 required autofocus />
                       <div class="input-group-append">
                        <span class="input-group-text">
                          <i class="mdi mdi-check-circle-outline"></i>
                        </span>
                      </div>
                    </div>
                  </div>
                    <div class="form-group">
                    <label class="label">이메일</label>
                    <div class="input-group">
                     <input type="text" id="email" name="email"
							class="form-control LoginInputId"
							placeholder=""
							 required autofocus />
                       <div class="input-group-append">
                        <span class="input-group-text">
                          <i class="mdi mdi-check-circle-outline"></i>
                        </span>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <button type = "submit" name="btn_send" class="btn btn-primary submit-btn btn-block">비밀번호 찾기</button>
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
	
</script>




