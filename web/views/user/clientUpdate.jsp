<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.truckta.client.model.vo.Client" %>    
    
 <% Client cl=(Client)request.getAttribute("client"); %>
    
<%@ include file="/views/common/header.jsp"%>

  <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <meta http-equiv="X-UA-Compatible" content="ie=edge">
     <title>내 프로필 설정</title>
     

    <!--Bootsrap 4 CDN-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <!--Fontawesome CDN-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

    <!--Custom styles-->
    <link rel="stylesheet" type="text/css" href="/css/clientupdate.css">

 <form id="clientFrm" method="post" 
	        onsubmit="return update_validate();">

</head>

    <div class="container sns" >
            <div class="d-flex justify-content-center h-100">
                <div class="card2">
                <div class="photo">
                <img class="rounded-circle"  id="rounded-circle" src="data:image/jpeg;base64,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"/>
                <span class="mask"></span>
                </div>
                </div>
            <div class="card">
                <div class="card-header">
                    <h3>내 프로필 수정 </h3>
            </div>
            <div class="card-body">
                <form> 
                    

                    <div class="input-group form-group">
                        <input type="text" class="form-control" name="id" placeholder="아이디 변경">
                    </div>
                    
                    <div class="input-group form-group">
                        <input type="text" class="form-control" name="name" placeholder="이름 변경">
                    </div>

                    <div class="input-group form-group">
                        <input type="email" class="form-control" placeholder="이메일변경">
                    </div>


                    <div class="form-group">
                        <input type="button" onclick="updateClient();" value="수정"/>
                        
                    </div>
                    
                     <div class="form-group">
                        <input type="submit" value="탈퇴" class="btn float-right submit_btn2">
                    </div>
                    
                </form>
            </div>

        </div>
    </div>
</div>


<script>
//숫자만 입력받기 영어 한글 제외하는 로직
$("input:text[name=id]").keyup(function(e){
	var reg = /[^0-9]*$/;
	var v=$(this).val();
	if(reg.test(v)){
		$(this).val(v.replace(reg,""));
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

function update_validate(){
	   return true;
}

function updateClient(){
	var frm=$('#clientFrm');
	var url="<%=request.getContextPath()%>/client/clientUpdate";
	frm.attr("action",url);
	frm.submit();
}
</script>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>


</body>

<%@ include file="/views/common/footer.jsp"%>

</html>