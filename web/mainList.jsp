<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List,com.truckta.boardmatching.model.vo.BoardMatching,com.truckta.file.matching.model.vo.FileMatching" %>
    <%
        //List<BoardMatching> list=(List)request.getAttribute("list");
        List<BoardMatching> list_page=(List)request.getAttribute("list_page");
        //System.out.print("#####getlist_page"+list_page);
        //int numPerPage=(int)request.getAttribute("numPerPage");
        List<BoardMatching> select_gu=(List)request.getAttribute("select_gu");
        //System.out.print("####getselect_gu+"+select_gu);
 		String searchKey=(String)request.getAttribute("searchKeyword");
 		//List<FileMatching> imgsearch=(List)request.getAttribute("imgsearch");
 		
 		System.out.println("//////////////////////////////////////////////////////////////////////");
 		List<FileMatching> fileList = (List)request.getAttribute("fileList");
 		System.out.print("#####getfileList"+fileList);
    	
    %>
    
    <%@ include file="/views/common/header.jsp"%>
    
    
	<div class="container">


		<div class="row">
			<div class="col-md-4 mb-3">
				<label for="state">도시</label>
				<select class="custom-select d-block w-100" id="select1" required onchange="citySelect()">
					<option value="">Choose...</option>
					<option id="seoul" value="seoul">서울시</option>
					<option value="kyungi">경기</option>
					<option value="incheon">인천</option>
					<option value="busan">인천</option>
					<option value="deagu">대구</option>
					<option value="deajun">대전</option>
					<option value="kyungnam">경남</option>
					<option value="jeonnam">전남</option>
					<option value="chungnam">충남</option>
					<option value="gwangju">광주</option>
					<option value="ulsan">울산</option>
					<option value="kyungbuk">경북</option>
					<option value="jeonbuk">전북</option>
					<option value="chungbuk">충북</option>
					<option value="kangwon">강원</option>
					<option value="jeju">제주</option>
					
				</select>
				<div class="invalid-feedback">
					Please provide a valid state.
				</div>
			</div>
			<div class="col-md-4 mb-3">
				<label for="state">구</label>
				<select class="custom-select d-block w-100" id="select2" required onchange="guSelect()">
					<option id="select3" value="">Choose...</option>
				</select>
				<div class="invalid-feedback">
					Please provide a valid state.
				</div>
			</div>
			
				
			<div class="col-md-4 mb-3">
				<label for="state">날짜별</label>
				<select class="custom-select d-block w-100" id=paymentDate required>
					
					<option>California</option>
					 
    				
				</select>
				<input type="text" id="payday" style="display: none;" />
					
				<a name="show1up" ID="show1up" class="calendar">Choose a payment date</a>
				<div class="invalid-feedback">
					Please provide a valid state.
				</div>

			</div>



		</div>
		
		<div class="row content_margin">
			<div class="col-xl-1"></div>
			<div class="col-xl-10" style="background-color: lightgray; padding: 60px 20px">
				<div class="row placeholders">
				<%for(BoardMatching bm : list_page){
					boolean isNotNull = false;%>
				<div class="col-xs-6 col-sm-3 placeholder trasition">
					<button class="but_1" name="<%=bm.getBoardNo() %>" onclick="location.href='<%=request.getContextPath()%>'">
					
					<%for(int i = 0 ; i<fileList.size();i++){
						if(fileList.get(i).getBoardNo()==bm.getBoardNo()){
							isNotNull=true;
							break;
							}
						}
					if(isNotNull){%>
						<img src="<%=request.getContextPath()%>/images/posted_images/moo.png" class="img-responsive" style="width:50px;height:50px;" >
						<%-- <img src="<%=request.getContextPath()%>/images/posted_images/<%=fileList.get(i).getFileName() %>" class="img-responsive" > --%>
					<%}else{ %>
						<img src="<%=request.getContextPath()%>/images/posted_images/null.png" class="img-responsive" style="width:50px;height:50px;" >
					<%} %> 
						<!-- 	<img src=> -->
							<h5><%=bm.getStartAddr() %></h5>
							<h5><%=bm.getEndAddr() %></h5>
							
					</div>
					</button>
					<%}%> 
				</div>
			</div>
		</div>
		<!-- onchange="guSelect()" -->
		
		<div id="container">
      <div class="letters">
        <div class="letter" id="target">
      
      	</div>
   	  </div>
      	      
      <div id="dictionary">
      </div>

    </div>


		<div class="pagebar" id="pagebar"><%=request.getAttribute("pageBar")%></div>
		<div class="col-xl-1" >
		
		</div>
	</div>
	</div>

	<script>
  	function guSelect(selectGu){
		
		var selectGu=$("#select2").val();
		
		console.log(selectGu);
		
		location.href="<%=request.getContextPath()%>/gusearch?selectGu="+selectGu;
		
	}
	
  	function citySelect(){
		 
		var seoul = ["선택","end_ddr","gangnam","강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
		var kyungi = ["가평군","고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","안성시","안양시","양주시","양평군","여주시","연천군","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시"];
		var incheon = ["강화군","계양구","남동구","동구","미추홀구","부평구","서구","연수구","옹진군","중구"];
		var busan = ["강서구","금정구","기장군","남구","동구","동래구","진구","북구","사상구","사하구","서구","수영구","연제구","영동구","중구","해운대구"];
		var deagu = ["남구","달서구","달성군","동구","북구","서구","수성구","중구"];
		var deajun = ["대덕구","동구","서구","유성구","중구"];
		var kyungnam = ["거제시","거창군","고성군","김해시","남해군","밀양시","사천시","산청군","양산시","의령군","진주시","창녕군","창원시","통영시","하동군","함안군","함양군","합천군"];
		var jeonnam =  ["강진군","고흥군","곡성군","광양시","구례군","나주시","담양군","목포시","무안군","보성군","순천시","신안군","여수시","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"]
		var chungnam = ["계롱시","공주시","금산군","논산시","당진시","보령시","부여군","서산시","서천군","아산시","연기군","예산군","천안시","청양군","태안군","홍성군"];
		var gwangju = ["광산구","남구","동구","북구","서구"];
		var ulsan = ["남구","동구","북구","울주군","중구"];
		var kyungbuk = ["경산시","경주시","고령군","구미시","군위군","김천시","문경시","봉화군","상주시","성주군","안동시","영덕군","영양군","영주시","영천시","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군","포항시"];
		var jeonbuk = ["고창군","군산시","김제시","남원시","무주군","부안군","순창군","완주군","익산시","임실군","장수군","전주시","정읍시","진안군"];
		var chungbuk = ["괴산군","단양군","보은군","영동군","옥천군","음성군","제천시","증평군","진천군","청주시","충주시"];
		var kangwon = ["강릉시","고성군","김해시","삼척시","속초시","양주군","영양군","영월군","원주시","인제군","정선군","철원군","춘천시","태백시","평창군","홍천군","화천군","횡성군"];
		var jeju = ["서귀포시","제주시"];
		 
		var select = $("#select1").val();
		 
		var change;
		  
		if(select == "seoul"){
			change=seoul;
		}
		else if(select == "kyungi"){
			change = kyungi;
		}
		else if(select == "incheon"){
			change =  incheon;
		}
		else if(select == "busan"){
			change = busan;
		}
		else if(select == "deagu"){
			change = deagu;
		}
		else if(select == "deajun"){
			change = deajun;
		}
		else if(select == "kyungnam"){
			change = kyungnam;
		}
		else if(select == "jeonnam"){
			change = jeonnam;
		}
		else if(select == "chungnam"){
			change = chungnam;
		}
		else if(select == "gwangju"){
			change = gwangju;
		}
		else if(select == "ulsan"){
			change = ulsan;
		}
		else if(select == "kyungbuk"){
			change = kyungbuk;
		}
		else if(select == "jeonbuk"){
			change = jeonbuk;
		}
		else if(select == "chungbuk"){
			change = chungbuk;
		}
		else if(select == "kangwon"){
			change = kangwon;
		}
		else if(select == "jeju"){
			change = jeju;
		}
		 
		$('#select2').empty();
		 
		for(var count = 0; count < change.length; count++){                
		                var option = $("<option>"+change[count]+"</option>");
		                $('#select2').append(option);
		                //console.log(change[count]);
		                
		            }
		
		}
/*    function guSelect(select){
    $.ajax({
        url: "/admin/gusearch",
        ontentType: "charset=UTF-8", // 인코딩 설정
		}, 
		data : { selectgu : selectgu},
		success: function (data) {
   		console.log(data)
        	}, error: function () {
            alert("실패");
        	}

    })
    };  */
    /*#######################달력  */
/*     $(document).ready(function(){
        var options;
        for(i=0;i<10;i++){
            dte = new Date();
            dte.setDate(dte.getDate() + i);
            
            var dd = dte.getDate();
            var mm = dte.getMonth() + 1;
            var y = dte.getFullYear();

            var formattedDate = mm + '/'+ dd + '/'+ y;        
            options += '<option value="'+formattedDate+'">'+formattedDate+'</option>';
        }    
        
        $("#paymentDate").html(options);
        
    var calendarShown = false;
    $.datepicker.setDefaults({
      showOn: "both",
      buttonImageOnly: true,
      buttonImage: "",
      buttonText: "Calendar",
      dateFormat: "m/d/yy"
    });

    $( "#payday" ).datepicker({
    		beforeShow: readSelected, 
    		onSelect: updateSelected,
    		maxDate: $("select#paymentDate option").length - 1,
    		minDate: "0"
    	});

    $("#show1up").click(function(){	
    	if(!calendarShown || !$("#ui-datepicker-div").is(":visible") ){
    		$(".ui-datepicker-trigger").trigger("click");
    		calendarShown = true;
    	}
    	else
    		calendarShown = false;
    });	

/*     }); */


    function readSelected() {
    }

    function updateSelected(date) {
        $("#paymentDate option").each(function(index){        
         	if($(this).val() == date)
         		$('#paymentDate option').eq(index).prop('selected', true);
    	});
        
    } 
    
    
    
    
    
    
    
    
    
    <%-- $(function(){
    	$(document).on("change","#select2",function(){

    		var selectgu=$("#select2").val();
			$.ajax({
				url:"<%=request.getContextPath()%>/admin/gusearch?selectgu="+selectgu,
				type:"get",//요청방식
				dateType:"text",
				data:{selectgu:selectgu},
				success: function (data) {
			   		console.log(data);
			        }, error: function () {
			           alert("실패");
			        }
				
			});
		})
	}) --%>
    
    
    <%-- 
    $(function(){
    	$(document).on("change","#select2",function(){
    		var selectgu=$("#select2").val();
    		location.href="<%=request.getContextPath()%>/admin/gusearch?selectgu="+selectgu;
    	})
    }) 
     --%>
    
    
    ////////////////////
   /* 
 	$(document).ready(function() {
	  $('#target').click(function() {

	    $.getJSON('views/json_sample.json', function(data) {
	    	
	      var html = '';
	      $.each(data, function(entryIndex, entry) {
	    	  html += '<div class="entry">';
	    	  html += '<h3 class="term">' + entry.term + '</h3>';
	    	  html += '<div class="part">' + entry.part + '</div>';
	    	  html += '<div class="definition">';
	    	  html += entry.definition;
	    	  html += '</div>';
	    	  html += '</div>';
	      });
	      console.log(html);
	      $('#dictionary').html(html);
	    });
	    return false;
	  });
	});*/
	//encodeURLComponent();
	
	/*
	$('#select1').change(function(){
		if($(this).val()=='seoul'){
			
		
		$.ajax({
			url:"json.json",
			type:"get",
			dataType:"json",
			success:function(data){
				var obj=$.parseJSON(data);
				console.log("data"+data);
				console.log("result"+result);
			})
		}
		})
		*/
		
		
		/* $('#select1').change(function(){
			if($(this).val()=='seoul'){
				$.ajax({
					 type: "GET",
					 url: "views/json.json",
					 dataType: "json", //url이 JSON 형식으로 인코딩된 데이터를 가지고 있다고 정의.
					 success: function(data) {
					  var html = "";
					  $.each(data, function(i, v) {
					   //i : data 내 객체의 인덱스.
					   //v : optiontext와 optionvalue 속성을 가지는 객체를 가리킴.
				
					   console.log(data);
					  
					   console.log(v["seoulgu"]);
					   //console.log(v["seoulgu"].length);
					  $.each(v["seoulgu"],function(i,item){
						 for(var key in item){
							 html+="<option>"+item[key] + "</option>";	 
						}
					  });
					   console.log(html);
					 });
					 $("#select2").append(html);
					 }
					});
			}
			
			else if($(this).val()=='kyungi'){
				$.ajax({
					 type: "GET",
					 url: "views/json.json",
					 dataType: "json", //url이 JSON 형식으로 인코딩된 데이터를 가지고 있다고 정의.
					 success: function(data) {
					  var html = "";
					  $.each(data, function(i, v) {
					   //i : data 내 객체의 인덱스.
					   //v : optiontext와 optionvalue 속성을 가지는 객체를 가리킴.
				
					   console.log(data);
					  
					   console.log(v["kyungido"]);
					   console.log(v["kyungido"].length);
					  $.each(v["kyungido"],function(i,item){
						 for(var key in item){
							 html+="<option>"+item[key] + "</option>";	 
						}
					  });
					   console.log(html);
					 });
					 $("#select3").remove();
					 $("#select2").append(html);
					 }
					});
			}
			
		}) */
		
	
    </script>
	
	
	
	 <%@ include file="/views/common/footer.jsp"%>