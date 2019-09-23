<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%> 

<%@ page import = "com.truckta.detail.model.vo.Detail" %>
<%@ page import = "com.truckta.client.model.vo.Client" %>
<%@page import = "com.truckta.matching.model.vo.Matching"%>
<%@page import = "java.util.List"%>
<%@page import = "com.truckta.file.matching.model.vo.FileMatching"%>
<%@page import = "com.truckta.file.driver.model.vo.FileDriver"%>


<%
	String boardNo = (String)request.getAttribute("boardNo");
	String startAddr = (String)request.getAttribute("startAddr");
	String endAddr = (String)request.getAttribute("endAddr");
	Detail d = (Detail)request.getAttribute("d");
	Client c = (Client)session.getAttribute("loginClient");
	List <Matching>badeList = (List)request.getAttribute("badeList");
	List<FileMatching>filelist = (List)request.getAttribute("filelist");
	List<FileDriver> driverFileList = (List) request.getAttribute("driverFileList");
%>

<!-- favicons -->
<link   href="<%=request.getContextPath()%>/css/conversation.css"
     rel="stylesheet">

 <!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">
<!-- picture css libraries -->
  <link href="<%=request.getContextPath() %>/css/piccss/animate.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath() %>/css/piccss/ionicons.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath() %>/css/piccss/owl.carousel.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath() %>/css/piccss/lightbox.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath() %>/css/piccss/style.css" rel="stylesheet">
	<link href="<%=request.getContextPath() %>/css/piccss/font-awesome.min.css" rel="stylesheet">
<!-- End -->

<!-- hand coded css libraries -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet" />
<link href="<%=request.getContextPath() %>/css/detailView-Style.css" rel="stylesheet"/> 

<!-- font awesome cdn -->
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">	

<!-- ----------------End----------------- -->

<!-- uploader's info -->

<style>
.img-sm{
    width: 40px;
    height: 40px;

}
</style>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>    
   
    <script src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=4b65ed0f-8a23-4128-abf7-7df859e62126"></script>
<div class="d-flex py-2 border-bottom">
			<img class="img-sm rounded-circle ml-4"
				src="<%=request.getContextPath()%>/images/avatars/User 01b.png"
				alt="profile image">
			<div class="wrapper mal-2 ml-4">
				<p class="mb-n1 font-weight-semibold"><%=d.getName() %></p>
				<small><%=d.getCarType() %> 희망</small>
			</div>
			<small class="text-muted ml-auto mr-4">조회수 : <%=d.getCount() %></small>
		</div>



	<!--==========================
      	글 수정하기 와 비딩한 운전자의 리스트
    ============================-->
    <section id="portfolio"  class="section-bg" >
      <div class="container">
	<%if(c !=null && c.getId().equals(d.getWriter())){ %>
<%-- 				<form class="btn btn-warning" action="#" method = "post">
					<input type="hidden" name="driverId" value= "<%=c.getId()%>"/>
					<input type="hidden" name="writerId" value = "<%=d.getWriter() %>">
				 	<input type="hidden" name = "boardNo" value = "<%=d.getBoardNo() %>">
				</form> --%>
					<button type = "submit" class = "btn btn-warning" onclick="boardMod();">글 수정하기</button>
				<script type="text/javascript">
					function boardMod() {
						location.href="<%=request.getContextPath()%>/board/updateLoad?boNum=<%=boardNo%>";
					}
				</script>
				<br><br>
				
				

                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>운전사</th>
                                <th>제안 날짜</th>
                                <th>제안 가격</th>
                                <th>제안 수락</th>
                            </tr>
                        </thead>
                        <tbody id="bids" onload = "showList();">
                            <%for(int i=0; i<badeList.size(); i++){ %>
                            <tr>
                                <td class="py-1">
                                    <img class = "mr-2 img-avatar" src="<%=request.getContextPath()%>/images/avatars/User 01a.png" alt="image" />
                                     <%=badeList.get(i).getResponser() %>
                                     </td>
                                <td><%=badeList.get(i).getTryDate() %></td>
                                <td class="text"> <%=badeList.get(i).getPay()%> 원 <i class="mdi mdi-arrow-down"></i>
                                </td>
                                <td>
                                    <input type="text" class = "idNnN" value ="<%=d.getBoardNo() %>" hidden>
                                    <button type="button" class="btn btn-success mr-2 idNoB" onclick="detailConfirm(<%=i%>);">수락</button>
                                    <input type="text" class = "idNo" value ="<%=badeList.get(i).getResponser() %>" hidden>
                                </td>
                            </tr>
                            <%} %>
                        </tbody>
                    </table>
		<br><br>
		
		
		<%}%>	
    <script>
      function detailConfirm(i) {
        var idnnb = $('.idNnN')[i].value;
        //console.log(idnnb);
        var iddd = $('.idNoB').next()[i].value;
        location.href = "<%=request.getContextPath()%>/detailConfirm?id="+iddd+"&room="+idnnb;
      }
	 </script>
	<!--==========================
      	pictures
    ============================-->
                <div class="row portfolio-container">
      <%for(int i = 0; i<filelist.size(); i++){ %>
          <div class="col-lg-4 col-md-6 portfolio-item filter-web wow fadeInUp" data-wow-delay="0.1s">
            <div class="portfolio-wrap">
              <figure>
                <img src="<%=request.getContextPath()%>/images/boardMatching_images/<%=filelist.get(i).getFileName()%>" style="width:350px; height:240px;" class="img-fluid" alt="">
                <a href="<%=request.getContextPath()%>/images/boardMatching_images/<%=filelist.get(i).getFileName()%>" class="link-preview" data-lightbox="portfolio" data-title="Web 3" title="Preview"><i class="fas fa-eye"></i></a>
                <!-- <a href="#" class="link-details" title="More Details"><i class="fab fa-algolia"></i></a> -->
              </figure>
              <div class="portfolio-info">
                <h4><a href="#">사진 <%=i+1 %></a></h4>
              </div>
            </div>
          </div>
      <%} %>
      </div>
    </section><!-- #pictures -->


<!-- Description -->
  <!--==========================
  About Section
  ============================-->
  <section id="about">
    <div class="container wow fadeInUp">
      <div class="row">
        <div class="col-md-12">
          <!-- <h3 class="section-title">About Us</h3> -->
          <div class="section-title-divider"></div>
          <!-- <p class="section-description">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam</p> -->
        </div>
      </div>
    </div>
    <div class="container about-container wow fadeInUp">
      <div class="row">

        <div class="col-lg-6 about-img">
          <img src="img/about-img.jpg" alt="">
        </div>

        <div class="col-md-6 about-content">
          <h2 class="about-title">제목 : <%=d.getTitle() %></h2>
           
        </div>
      </div>
    </div>
  </section>

  <!--==========================
  Services Section
  ============================-->
  <section id="services">
    <div class="container wow fadeInUp justify-content-center">
      <div class="row">
          <h3 class="section-title">내용 : </h3>
        <div class="col-md-12">
        	<textarea class="textAr" rows="" cols="60" readonly><%=d.getEtc() %></textarea>
        	<style>
        		.textAr{
        			height:300px ; 
        			font-size:2em;
              resize: none;
              
              color: darkgrey;
        		}
			</style>
          <br>
          <p class="about-text">
          <br>
          <br>
          <h5>
            <%if(d.getMemo() != null) {%>
            <%=d.getMemo() %>
            <%} else { %>
               많은 분들께서 연락을 주셨으면 좋겠습니다 :)
            <%} %>
            </h5>
          </p>
          <br><br>
          
          <!--금액 제시하기  -->
          
          <%if(c!=null && c.getUserType()==2){ %>
            <form class="" action="<%=request.getContextPath()%>/createChat" method = "post" value = "연락하기">
                 <!-- popup -->
                <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                       연락하기
                 </button>
                 <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                     <div class="modal-dialog" role="document">
                         <div class="modal-content">
                             <div class="modal-header">
                                 <h4 class="modal-title" id="myModalLabel">금액 제시하기</h4>
                                 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                         aria-hidden="true">×</span></button>
                             </div>
                             <div class="modal-body">
                                 <form action="<%=request.getContextPath()%>/createChat" method = "post" value = "연락하기">
                                     <p>
                                         <div class="d-flex justify-content-center">
                                             <input name = "bidPrice" type="text" class="col-6 form-control form-rounded" value="" maxlength="15">
                                             <span class="ml-2 currency"></span>
                                         </div>
                                     </p>
                              
                             </div>
                             <div class="modal-footer">
                                 <!-- 메세지방을 생성하기 위해 보낼 값들 -->
                                    <input type="hidden" name="driverId" value= "<%=c.getId()%>"/>
                                    <input type="hidden" name="writerId" value = "<%=d.getWriter() %>">
                                    <input type="hidden" name = "boardNo" value = "<%=d.getBoardNo() %>">
                                    
                                    <button type = "submit" class = "btn btn-primary">연락하기</button>
                                 <button type="button" class="btn btn-danger" data-dismiss="modal">취소하기</button>
                             </div>
                                 </form>
            
                         </div>
                     </div>
                 </div>
                 
         
            <%} %>
          
         
          <div class="section-title-divider"></div>
         <!--  <p class="section-description">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium</p> -->
        </div>
      </div>
       <br/><br/><br/><br/>

      <div class="row">
        <div class="col-md-4 service-item">
          <div class="service-icon"><i class="fa fa-road"></i></div>
          <h4 class="service-title"><a href="">출발지</a></h4>
          <p class="service-description"><h5><%=startAddr %></h5></p>
        </div>
        <div class="col-md-4 service-item">
          <div class="service-icon"><i class="fa fa-bar-chart"></i></div>
          <h4 class="service-title"><a href="">도착지</a></h4>
          <p class="service-description"><h5><%=endAddr %></h5></p>
        </div>
        <div class="col-md-4 service-item" >
          <div class="service-icon"><i class="fa fa-paper-plane"></i></div>
          <h4 class="service-title"><a href="">소요시간</a></h4>
          <p class="service-description" id="totalTime" ></p>
          <br>
          <br>
        </div>
        <div class="col-md-4 service-item" >
          <div class="service-icon"><i class="fa fa-paper-plane"></i></div>
          <h4 class="service-title"><a href="">총 거리</a></h4>
          <p class="service-description" id="totalDistance"></p>
        </div>
        
      </div>
    </div>
  </section>

<!-- Description end -->

      <!--- Two Column Section -->
   <br>
   <div class="container padding">
      <div class="row padding">

         <!-- <div class="col-lg-10">
                <img src="img/desk.png" class="img-fluid">
            </div> -->
         <div class="col-md-12">
            <!-- start to destination -->
            <div class="addr">
            
            </div>
            <!-- title -->
            <div class="height">
           
             
         
   
          <span class="main__header__result"></span>
    <hr>
   <div class="main__map main__map-empty" id="map"></div> <!-- 지도 보이는 곳 --> 
   <div class="request">
   <hr>

   </div>
         </div>
      </div>
   </div>
</div>


 <!-- JavaScript Libraries -->
  <script src="<%=request.getContextPath() %>/js/picjs/jquery-migrate.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/picjs/bootstrap.bundle.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/picjs/easing.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/picjs/hoverIntent.js"></script>
  <script src="<%=request.getContextPath() %>/js/picjs/superfish.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/picjs/wow.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/picjs/waypoints.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/picjs/counterup.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/picjs/owl.carousel.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/picjs/isotope.pkgd.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/picjs/lightbox.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/picjs/jquery.touchSwipe.min.js"></script>

  <!-- Template Main Javascript File -->
  <script src="<%=request.getContextPath() %>/js/picjs/main.js"></script>




    
   
   <script>
   
   //숫자만 입력받기 영어 한글 제외하는 로직
   $("input:text[name=bidPrice]").keyup(function (e) {
       //  var reg = /[^0-9]*$/;
       var reg = /^[^0-9]/
       var v = $(this).val();
       console.log(v);
       if (reg.test(v)) {
           $(this).val(v.replace(reg, ""));
           $(this).focus();
       }

   });  
   

   var addr = ["<%=startAddr%>", "<%=endAddr%>"];
   newAddr = [];
      search(addr[0]);
      search(addr[1]);
   function search(addr) {
     if(addr=="") {
         alert("주소를 차지 못 하였습니다");
     } else {
         textSearch(addr);
     }
   }

   function textSearch(addr) {
     if(addr != null) {
         $.ajax({
             method: "GET",
             url: "https://api2.sktelecom.com/tmap/geo/fullAddrGeo?version=1",
             data: {
                fullAddr: addr,
                appKey: "4b65ed0f-8a23-4128-abf7-7df859e62126"
             },
             success: function(data) {
                 var obj = JSON.stringify(data);
                 obj = JSON.parse(obj);
                 newAddr.push(obj.coordinateInfo.coordinate[0].newLat);
                 newAddr.push(obj.coordinateInfo.coordinate[0].newLon);
                 if( newAddr.length == 4){
                    startingMap();
                 }
             },
             error:function(request,status,error){
                 
             }
         });
     }
   }
   

   
    var authKey = "4b65ed0f-8a23-4128-abf7-7df859e62126";
     var route1 = ["startingAddress", "destinationAddress"];
     var places = {
       startingAddress: {
         locY: 37.4871,
         locX: 127.0529
       },
       destinationAddress: {
         locY: 35.8714,
         locX: 128.6014
       }
     };
     var startX; // 출발지 x 좌표
     var startY; // 출발지 y 좌표
     var endX; // 도착지 x 좌표
     var endY; // 도착지 y 좌표
     
     var passList = null; //경로탐색에 사용할 경유지. 경유지가  포함되어서 검색될 경우 이 변수에 경유지 리스트가 들어감.
     var departureTime; //출발 시간을 담을 변수
     // date.js에 입력한 출발/도착/경유지의 해당 좌표를 변수에  입력토록 하는 함수
     var idToLoc = function(route) {
       startY = newAddr[0];
       startX = newAddr[1];
       endY = newAddr[2];
       endX = newAddr[3];
     };
     // 경로탐색 전 MAP div 초기화 -> 고야이 사진 삭제 및 투명도 0%  설정
     var initMap = function() {
     };
     // 지도 실행하기///////////////////////////////////////////////////////////////
     function startingMap() {
       idToLoc(route1);
       return findpath();
     };
      
      
     function findpath() {
       // 지도 삽입 전 map div 초기화
        var map = new Tmap.Map({
           div: "map", // 결과 지도를 표시할 곳
           height: "300px",
           width: "100"
         });
       
       initMap();
       
       var prtcl;
       var headers = {};
       headers["appKey"] = authKey; // 발급받은 인증키를 넣어야  한다
       $.ajax({
         method: "POST",
         headers: headers,
         url:  "https://api2.sktelecom.com/tmap/routes?version=1&format=xml",
         async: false,
         data: {
           startX: startX,
           startY: startY,
           endX: endX,
           endY: endY,
           passList: passList,
           reqCoordType: "WGS84GEO",
           resCoordType: "EPSG3857",
           angle: "172",
           searchOption: "0",
           trafficInfo: "Y" //교통정보 표출 옵션입니다.
         },
         success: function(response) {
           //API가 제대로 작동할 경우 실행될 코드
           prtcl = response;
           var prtclString = new  XMLSerializer().serializeToString(prtcl); //xml to String
           (xmlDoc = $.parseXML(prtclString)),
             ($xml = $(xmlDoc)),
             ($intRate = $xml.find("Document"));
           var tDistance =
             " 총 거리 : " +
             (
                $intRate[0].getElementsByTagName("tmap:totalDistance")[0]
                 .childNodes[0].nodeValue / 1000
             ).toFixed(1) +
             "km,";
           var tTime =
             " 예상 소요 시간 : " +
             (
                $intRate[0].getElementsByTagName("tmap:totalTime")[0].childNodes[0]
                 .nodeValue / 60
             ).toFixed(0) +
             "분";
            document.querySelector("#totalTime").innerText =
             tTime;
            document.querySelector("#totalDistance").innerText =
                tDistance;
           // 실시간 교통정보 추가
           var trafficColors = {
             extractStyles: true,
             /* 실제 교통정보가 표출되면 아래와 같은 Color로 Line이  생성됩니다. */
             trafficDefaultColor: "#000000", //Default
             trafficType1Color: "#009900", //원활
             trafficType2Color: "#8E8111", //지체
             trafficType3Color: "#FF0000" //정체
           };
           var kmlForm = new  Tmap.Format.KML(trafficColors).readTraffic(prtcl);
           routeLayer = new Tmap.Layer.Vector("vectorLayerID");  //백터 레이어 생성
           routeLayer.addFeatures(kmlForm); //교통정보를 백터  레이어에 추가
           map.addLayer(routeLayer); // 지도에 백터 레이어 추가
           // 경로탐색 결과 반경만큼 지도 레벨  조정
           map.zoomToExtent(routeLayer.getDataExtent());
         },
         error: function(request, status, error) {
           // API가 제대로 작동하지 않을 경우
           console.log(
             "code:" +
               request.status +
               "\n" +
               "message:" +
               request.responseText +
               "\n" +
               "error:" +
               error
           );
         }
       }); 
     }
   
   
   </script>

 <%@ include file="/views/common/footer.jsp"%> 
