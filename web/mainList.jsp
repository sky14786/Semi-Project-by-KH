<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List,com.truckta.boardmatching.model.vo.BoardMatching" %>
    <%
        //List<Client_notice> list=(List)request.getAttribute("list");
        //List<Board_Matching> list_page=(List)request.getAttribute("list_page");
        //int numPerPage=(int)request.getAttribute("numPerPage");
        //List<Board_Matching> select_gu=(List)request.getAttribute("select_gu");
 		String searchKey=(String)request.getAttribute("searchKeyword");
        
    	
    %>
    
    <%@ include file="/header.jsp"%>
    
    
	<div class="container">


		<div class="row">
			<div class="col-md-4 mb-3">
				<label for="state">도시</label>
				<select class="custom-select d-block w-100" id="select1" required onchange="citySelect()">
					<option value="">Choose...</option>
					<option id="seoul" value="seoul">서울시</option>
					<option value="kyungi">경기</option>
					<option value="incheon">인천</option>
				</select>
				<div class="invalid-feedback">
					Please provide a valid state.
				</div>
			</div>
			<div class="col-md-4 mb-3">
				<label for="state">구</label>
				<select class="custom-select d-block w-100" id="select2" required >
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
				<%-- <%for(Board_Matching bm : list_page){ %>
					<div class="col-xs-6 col-sm-3 placeholder trasition">
					
						<button class="but_1" onclick="location.href='<%=request.getContextPath()%>'">
							<img src="sin11.jpg" class="img-responsive" >
							<h5><%=bm.getStart_addr() %></h5>
							<h5><%=bm.getEnd_addr() %></h5>
							<div class="trg" id='trg'>조회수 : <span class="text-muted" id="sp_1">0</span></div>
					</div>
					</button>
					<%} %> --%>
					
					

				</div>

			</div>


		</div>
		<!-- onchange="guSelect()" -->
		<!--클릭시 늘어나게만들어야함-->
		
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
<%-- 	function guSelect(select){
		
		var selectgu=$("#select2").val();
		
		console.log(selectgu);
		
		location.href="<%=request.getContextPath()%>/admin/gusearch?selectgu="+selectgu;
		
	} --%>
	
    function citySelect(){
		 
		var seoul = ["선택","end_ddr","gangnam","강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
		var kyungi = ["가평군","고양시","과천시","광명시","수원시"];
		var incheon = ["강화군","계양구","남동구","동구"];
		 
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
    $(document).ready(function(){
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

    });


    function readSelected() {
    }

    function updateSelected(date) {
        $("#paymentDate option").each(function(index){        
         	if($(this).val() == date)
         		$('#paymentDate option').eq(index).prop('selected', true);
    	});
        
    }
    
    
    
    
    
    
    
    
    
    $(function(){
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
	})
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