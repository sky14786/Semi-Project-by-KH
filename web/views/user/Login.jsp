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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<link href="<%=request.getContextPath()%>/css/login.css?var=1.1"
	rel="stylesheet" />


<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<!-- <script src="//code.jquery.com/jquery-1.11.1.min.js"></script> -->

<style>
@media ( max-width : 1200px) input[type="text"] { width 
	 : 
	 
	 950 px 
	 ;
}
</style>

</head>
<body>

	<div class="container">
		<div class="row" style="padding-top: 10%">

			<div class="card card-container">
				<!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
				<img id="profile-img" class="profile-img-card"
					src="/images/project_images/Truck.png" />
				<p id="profile-name" class="profile-name-card"></p>
				<!-- <form class="form-signin"> -->

				<!-- 로그인 메뉴 -->
				<div class="login-container">

					<%
						if (clientLogin == null) {
					%>
					<form class="form-signin" id='loginFrm'
						action="<%=request.getContextPath()%>/login" method="post"
						onsubmit="return validate();">


						<input type="text" id="id" name="id"
							class="form-control LoginInputId"
							placeholder="아이디 (:숫자, - 를 포함한 숫자만)"
							value='<%=saveId != null ? saveId : ""%>' required autofocus />
						<input type="password" id="pw" name="pw" class="form-control"
							placeholder="비밀번호" required> 
						<input class="btn btn-lg btn-primary btn-block btn-signin" id="btn" name="btn" type="submit"
							value="로그인">
					</form>
					

					<%
						}
					%>




					<div id="saveId" class="checkbox">
						<label> <input type="checkbox" value="remember-me">
							Remember me
						</label>
					</div>
				</div>
				<!-- </form> -->
				<!-- /form -->
				<a href="<%=request.getContextPath()%>/views/user/resetpassword.jsp"
					class="forgot-password"> Forgot the password? </a>
			</div>
		</div>
		<!-- /card-container -->
	</div>
	<!-- /container -->


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