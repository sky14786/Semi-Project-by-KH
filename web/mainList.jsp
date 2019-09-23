<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List,com.truckta.boardmatching.model.vo.BoardMatching,com.truckta.file.matching.model.vo.FileMatching" %>
    <%
        //List<BoardMatching> list=(List)request.getAttribute("list");
        List<BoardMatching> list_page=(List)request.getAttribute("list_page");
        //System.out.println(list_page.size());
        //System.out.println("#####getlist_page"+list_page);
        //System.out.println("listpage:"+list_page.size());
        //int numPerPage=(int)request.getAttribute("numPerPage");
        List<BoardMatching> select_gu=(List)request.getAttribute("select_gu");
        //System.out.print("####getselect_gu+"+select_gcssu);
 		String searchKey=(String)request.getAttribute("searchKeyword");
 		//List<FileMatching> imgsearch=(List)request.getAttribute("imgsearch");
 		List<FileMatching> fileList = (List)request.getAttribute("fileList");
 		//System.out.println("#####getfileList"+fileList);
 		//System.out.println("사이즈"+fileList.size());
    	
    %>
    
    <%@ include file="/views/common/header.jsp"%>
    <link href="<%=request.getContextPath()%>/plugins/mypage/css/style.css"
	rel="stylesheet">
 
	<div class="container">


		<div class="row">
			
			
			
				<!-- ########################################################################## -->
			



		</div>
		
		<div class="row content_margin backimg" style="margin-top:5em">
		
		<div class="col-md-4 mb-3">
				<label for="state">도시</label>
				<select class="custom-select d-block w-100" id="select1" required onchange="citySelect()">
					<option value="">Choose...</option>
					<option id="seoul" value="seoul">서울시</option>
					<option value="kyungi">경기</option>
					<option value="incheon">인천</option>
					<option value="busan">부산</option>
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
				<select class="custom-select d-block w-100" id=paymentDate required onchange="dateSearch()">
					
					<option>California</option>
				</select>
				<!-- <form action="<%=request.getContextPath() %>/maindatesearch"> -->
				<input type="text" id="payday" name="searchdate" style="display: none;"/>
				<!-- </form>	 -->
				<!-- <a name="show1up" ID="show1up" class="calendar">Choose a payment date</a> -->
				<div class="invalid-feedback">
					Please provide a valid state.
				</div>

			</div>
			<div class="col-xl-1"></div>
			<div class="col-xl-10" style="/* background-color: lightgray; */ padding: 60px 20px">
				<div class="row placeholders">
				<%int q=0;
				for(BoardMatching bm : list_page){
					boolean isNotNull = false;
					%>
				<div class="col-lg-4 col-md-6 col-sm-8 col-sx-9 col-10 m-auto div_hyuns">
					<div class="blog-post div_2_hyuns">
					<button class="btn btn-default btn-lg but_1" onclick="location.href='<%=request.getContextPath()%>/detail?boardNo=<%=bm.getBoardNo()%>'">
						<div class="post-thumb">
					
					
					<%for(int i = 0 ; i<fileList.size();i++){
						if(fileList.get(i).getBoardNo()==bm.getBoardNo()){%>
						<hr>
							<img src="<%=request.getContextPath()%>/images/boardMatching_images/<%=fileList.get(i).getFileName() %>" class="img-responsive" style="width:250px;height:200px;">
							<%
						break;	
						}}%>
						<%-- <img src="<%=request.getContextPath()%>/images/posted_images/moo.png" class="img-responsive" style="width:250px;height:211px;" > --%>
						
						<%-- <img src="<%=request.getContextPath()%>images/boardMatching_images/<%=fileList.get(i).getFileName()%>" class="img-responsive" style="width:250px;height:200px;">
						<%System.out.println((i)+"@"+fileList.get(q).getFileName()); %>
						<%}else{ %>
						<img src="<%=request.getContextPath()%>/images/posted_images/null.png" class="img-responsive" style="width:211px;height:211px;" >
						<%System.out.println((i)+"에러"); %>
						<hr>
					<%}break;} %>   --%>
					</div>
					<div class="post-content">
							<div class="date">
							<ul class="list-inline ulbtm">
									<li class="list-inline-item"><i class="fa fa-user-o"></i>
										<a href="#">
										</a></li>
							<%String title=bm.getTitle();
							if(bm.getTitle().length()>12){
							title = title.substring(0,10);
							title+="...";
							}%>
							<%=title %></ul>
							<hr>
							
					</div>
					<div class="post-title">
							<%
										String stAddr = bm.getStartAddr();
										String edAddr = bm.getEndAddr();
										String stTmp[] = stAddr.split(",");
										String edTmp[] = edAddr.split(",");
										for(int j=1; j<stTmp.length-1; j++){
											stAddr = stTmp[j];
										}
										stAddr = stAddr.substring(0, 6);
										stAddr += " - 출발 ";
										
										for(int j=1; j<edTmp.length-1; j++){
											edAddr = edTmp[j];
										}
										edAddr = edAddr.substring(0, 7);
											edAddr += " - 도착";
										//stAddr += edAddr;
									%>
													
							<h6><%=stAddr %></h6>
							<hr>
							</div>
							<div class="post-title">	
							<h6><%=edAddr %></h6>
							<hr>
							</div>
							<div class="post-meta">
								<ul class="list-inline ulbtm">
									<%if(bm.getMemo()!=null){
									%>
									<li class="list-inline-item"><i class="fa fa-user-o"></i>

										<a href="#">								
										
									<%=bm.getMemo() %>
										</a></li>
										<%}else{ %>
										<li class="list-inline-item"><i class="fa fa-user-o"></i>
										<a href="#">메모없음</a>
										<%} %>
									<!-- <li class="list-inline-item"><i class="fa fa-heart-o"></i>
										<a href="#"></a></li>
									<li class="list-inline-item"><i class="fa fa-comments-o"></i>
										<a href="#">????</a></li> -->
								</ul>
							</div>
					</div>
					</button>
				</div>
			</div>
					<%q++;}
					%>
		</div>
		</div>
		</div>
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


	<script>
	function dateSearch(datesearch){
		var datesearch=$("#paymentDate").val();
		console.log(datesearch);
		location.href="<%=request.getContextPath()%>/maindatesearch?datesearch="+datesearch;
	}
	
  	function guSelect(selectGu){
		
		var selectGu=$("#select2").val();
		
		console.log(selectGu);
		
		location.href="<%=request.getContextPath()%>/gusearch?selectGu="+selectGu;
		
	}
	
  	function citySelect(){
		 
		var seoul = ["선택","강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
		var kyungi = ["선택","가평군","고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","안성시","안양시","양주시","양평군","여주시","연천군","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시"];
		var incheon = ["선택","강화군","계양구","남동구","동구","미추홀구","부평구","서구","연수구","옹진군","중구"];
		var busan = ["선택","강서구","금정구","기장군","남구","동구","동래구","진구","북구","사상구","사하구","서구","수영구","연제구","영동구","중구","해운대구"];
		var deagu = ["선택","남구","달서구","달성군","동구","북구","서구","수성구","중구"];
		var deajun = ["선택","대덕구","동구","서구","유성구","중구"];
		var kyungnam = ["선택","거제시","거창군","고성군","김해시","남해군","밀양시","사천시","산청군","양산시","의령군","진주시","창녕군","창원시","통영시","하동군","함안군","함양군","합천군"];
		var jeonnam =  ["선택","강진군","고흥군","곡성군","광양시","구례군","나주시","담양군","목포시","무안군","보성군","순천시","신안군","여수시","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"]
		var chungnam = ["선택","계롱시","공주시","금산군","논산시","당진시","보령시","부여군","서산시","서천군","아산시","연기군","예산군","천안시","청양군","태안군","홍성군"];
		var gwangju = ["선택","광산구","남구","동구","북구","서구"];
		var ulsan = ["선택","남구","동구","북구","울주군","중구"];
		var kyungbuk = ["선택","경산시","경주시","고령군","구미시","군위군","김천시","문경시","봉화군","상주시","성주군","안동시","영덕군","영양군","영주시","영천시","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군","포항시"];
		var jeonbuk = ["선택","고창군","군산시","김제시","남원시","무주군","부안군","순창군","완주군","익산시","임실군","장수군","전주시","정읍시","진안군"];
		var chungbuk = ["선택","괴산군","단양군","보은군","영동군","옥천군","음성군","제천시","증평군","진천군","청주시","충주시"];
		var kangwon = ["선택","강릉시","고성군","김해시","삼척시","속초시","양주군","영양군","영월군","원주시","인제군","정선군","철원군","춘천시","태백시","평창군","홍천군","화천군","횡성군"];
		var jeju = ["선택","서귀포시","제주시"];
		 
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
  	
  	
  		$(document).ready(function(){
  	    var options;
  	    
  	    for(i=0;i<10;i++){
  	        dte = new Date();
  	        dte.setDate(dte.getDate() + i);
  	        
  	        var y = dte.getFullYear();
  	        var mm = dte.getMonth() + 1;
  	        var dd = dte.getDate();

  	        var formattedDate = y + '/'+ mm + '/'+ dd;      
  	        
  	        options += '<option value="'+formattedDate+'" id="datesearch">'+formattedDate+'</option>';
  	    }    
  	    
  	    $("#paymentDate").html(options);
  	    
  

  	});


  	
   
    </script>
	
	
	
	 <%@ include file="/views/common/footer.jsp"%>