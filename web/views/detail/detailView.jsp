<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%> 

<%@ page import = "com.truckta.detail.model.vo.Detail" %>
<%@ page import = "com.truckta.client.model.vo.Client" %>
<%@page import = "com.truckta.matching.model.vo.Matching"%>
<%@page import = "java.util.List"%>


<%
	String boardNo = (String)request.getAttribute("boardNo");
	String startAddr = (String)request.getAttribute("startAddr");
	String endAddr = (String)request.getAttribute("endAddr");
	Detail d = (Detail)request.getAttribute("d");
	Client c = (Client)session.getAttribute("loginClient");
	List <Matching>badeList = (List)request.getAttribute("badeList");
	
	
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
				<form class="btn btn-warning" action="#" method = "post">
					<input type="hidden" name="driverId" value= "<%=c.getId()%>"/>
					<input type="hidden" name="writerId" value = "<%=d.getWriter() %>">
					<input type="hidden" name = "boardNo" value = "<%=d.getBoardNo() %>">
					<button type = "submit" class = "btn btn-warning">글 수정하기</button>
				</form>
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
                                    <img class = "mr-2 img-avatar" src="<%=request.getContextPath()%>/images/avatars/User 01a.png" alt="image" /> <%=badeList.get(i).getResponser() %></td>
                                <td><%=badeList.get(i).getTryDate() %></td>
                                <td class="text"> <%=badeList.get(i).getPay()%> 원 <i class="mdi mdi-arrow-down"></i>
                                </td>
                                <td>
                                    <button type="submit" class="btn btn-success mr-2">수락</button>
                                </td>
                            </tr>
                            <%} %>
                        </tbody>
                    </table>
		<br><br>
		
		
		<%}%>	
		
	
	<!--==========================
      	pictures
    ============================-->
        <div class="row portfolio-container">

          <div class="col-lg-4 col-md-6 portfolio-item filter-web wow fadeInUp" data-wow-delay="0.1s">
            <div class="portfolio-wrap">
              <figure>
                <img src="https://ak1.ostkcdn.com/img/mxc/02182019_Furniture_Guide2_MultifunctionalFurnitureforSmallSpaces.jpg?imwidth=1024&impolicy=medium" class="img-fluid" alt="">
                <a href="https://ak1.ostkcdn.com/img/mxc/02182019_Furniture_Guide2_MultifunctionalFurnitureforSmallSpaces.jpg?imwidth=1024&impolicy=medium" class="link-preview" data-lightbox="portfolio" data-title="Web 3" title="Preview"><i class="fas fa-eye"></i></a>
                <a href="#" class="link-details" title="More Details"><i class="fab fa-algolia"></i></a>
              </figure>
              <div class="portfolio-info">
                <h4><a href="#">Web 3</a></h4>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web wow fadeInUp" data-wow-delay="0.1s">
            <div class="portfolio-wrap">
              <figure>
                <img src="https://cb2.scene7.com/is/image/CB2/062719_cat_m_furniture_dining?wid=670&qlt=65" class="img-fluid" alt="">
                <a href="https://cb2.scene7.com/is/image/CB2/062719_cat_m_furniture_dining?wid=670&qlt=65" class="link-preview" data-lightbox="portfolio" data-title="Web 2" title="Preview"><i class="ion ion-eye"></i></a>
                <a href="#" class="link-details" title="More Details"><i class="ion ion-android-open"></i></a>
              </figure>

              <div class="portfolio-info">
                <h4><a href="#">Web 2</a></h4>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web wow fadeInUp" data-wow-delay="0.2s">
            <div class="portfolio-wrap">
              <figure>
                <img src="https://azcd.domayne.com.au/media/catalog/category/cache/25/image/1260x/17f82f742ffe127f42dca9de82fb58b1/gp917532-furniture-hero.jpg" class="img-fluid" alt="">
                <a href="https://azcd.domayne.com.au/media/catalog/category/cache/25/image/1260x/17f82f742ffe127f42dca9de82fb58b1/gp917532-furniture-hero.jpg" class="link-preview" data-lightbox="portfolio" data-title="Web 1" title="Preview"><i class="ion ion-eye"></i></a>
                <a href="#" class="link-details" title="More Details"><i class="ion ion-android-open"></i></a>
              </figure>

              <div class="portfolio-info">
                <h4><a href="#">Web 1</a></h4>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web wow fadeInUp" data-wow-delay="0.2s">
            <div class="portfolio-wrap">
              <figure>
                <img src="http://studio15home.com/wp-content/uploads/2018/10/elegant-gray-couch-living-room-ideas-of-riley-sofa-and-loveseat-937.jpg" class="img-fluid" alt="">
                <a href="http://studio15home.com/wp-content/uploads/2018/10/elegant-gray-couch-living-room-ideas-of-riley-sofa-and-loveseat-937.jpg" class="link-preview" data-lightbox="portfolio" data-title="Web 1" title="Preview"><i class="ion ion-eye"></i></a>
                <a href="#" class="link-details" title="More Details"><i class="ion ion-android-open"></i></a>
              </figure>

              <div class="portfolio-info">
                <h4><a href="#">Web 1</a></h4>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web wow fadeInUp" data-wow-delay="0.2s">
            <div class="portfolio-wrap">
              <figure>
                <img src="data:image/jpeg;base64,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" class="img-fluid" alt="">
                <a href="data:image/jpeg;base64,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" class="link-preview" data-lightbox="portfolio" data-title="Web 1" title="Preview"><i class="ion ion-eye"></i></a>
                <a href="#" class="link-details" title="More Details"><i class="ion ion-android-open"></i></a>
              </figure>

              <div class="portfolio-info">
                <h4><a href="#">Web 1</a></h4>
              </div>
            </div>
          </div>

        </div>

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
        <div class="col-md-12">
          <h3 class="section-title">내용 : <br><br><%=d.getEtc() %></h3>
          <br>
          <p class="about-text">
            <%if(d.getMemo() != null) {%>
            <%=d.getMemo() %>
            <%} else { %>
            	많은 분들께서 연락을 주셨으면 좋겠습니다 :)
            <%} %>
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
			                                    <span class="ml-2 currency"> ₩</span>
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
          <p class="service-description"><%=startAddr %></p>
        </div>
        <div class="col-md-4 service-item">
          <div class="service-icon"><i class="fa fa-bar-chart"></i></div>
          <h4 class="service-title"><a href="">도착지</a></h4>
          <p class="service-description"><%=endAddr %></p>
        </div>
        <div class="col-md-4 service-item" >
          <div class="service-icon"><i class="fa fa-paper-plane"></i></div>
          <h4 class="service-title"><a href="">소요시간</a></h4>
          <p class="service-description" id="totalTime"></p>
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
         <div class="col-md-12 col-lg-10">
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
