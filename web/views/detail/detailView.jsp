<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<%@ page import = "com.truckta.detail.model.vo.Detail" %>

<%
	Detail d = (Detail)request.getAttribute("d");
	String boardNo = (String)request.getAttribute("boardNo");
	String startAddr = (String)request.getAttribute("startAddr");
	String endAddr = (String)request.getAttribute("endAddr");
%>


<!-- This Page's Include and import Files -->

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet" />

<%-- <link href="<%=request.getContextPath()%>/css/detailView-Style.css?ver=1.2" rel="stylesheet"> --%>

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


	<!-- images carousel -->
	<style>
			#img-carousel {
				width: 200px;
				/* You can set the dimensions to whatever you want */
				height: 300px;
				object-fit: cover;
			}
		</style>
		<!-- please work -->
		<!--Carousel Wrapper-->
		<div id="carousel-thumb" class="carousel slide carousel-fade carousel-thumbnails" data-ride="carousel">
			<!--Slides-->
			<div class="carousel-inner" role="listbox">
				<div class="carousel-item active">
					<img class="d-block w-100"
						src="https://upload.wikimedia.org/wikipedia/commons/f/f2/2008-04-13_Expandable_table_expanding.jpg"
						alt="First slide" id = "img-carousel">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100"
						src="https://content3.jdmagicbox.com/comp/salem/46/0427p427std1300746/catalogue/sri-jayam-lakshmi-hayagreevar-furnitures-salem-1owngizfx8.jpg"
						alt="Second slide" id = "img-carousel">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100"
						src="https://cb2.scene7.com/is/image/CB2/062719_cat_m_furniture_bestsellers?wid=670&qlt=65"
						alt="Third slide" id = "img-carousel">
				</div>
			</div>
			<!--/.Slides-->
			<!--Controls-->
			<a class="carousel-control-prev" href="#carousel-thumb" role="button" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="carousel-control-next" href="#carousel-thumb" role="button" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
			<!--/.Controls // Thumbnail-->
			<style>
        #img-carousel {
            width: 200px;
            /* You can set the dimensions to whatever you want */
            height: 300px;
            object-fit: cover;
            
        }
        .carousel-indicators li{
            text-indent: 0;
            width: unset !important;
        }
    </style>
			<ol class="carousel-indicators">
				<li data-target="#carousel-thumb" data-slide-to="0" class="active">
					<img src="https://upload.wikimedia.org/wikipedia/commons/f/f2/2008-04-13_Expandable_table_expanding.jpg" width="100">
				</li>
				<li data-target="#carousel-thumb" data-slide-to="1">
					<img src="https://content3.jdmagicbox.com/comp/salem/46/0427p427std1300746/catalogue/sri-jayam-lakshmi-hayagreevar-furnitures-salem-1owngizfx8.jpg"
						width="100">
				</li>
				<li data-target="#carousel-thumb" data-slide-to="2">
					<img src="https://cb2.scene7.com/is/image/CB2/062719_cat_m_furniture_bestsellers?wid=670&qlt=65" width="100">
				</li>
			</ol>
		</div>
		<!--/.Carousel Wrapper-->



	<!--- Two Column Section -->
	<br>
	<div class="container padding">
		<div class="row padding">

			<!-- <div class="col-lg-6">
                <img src="img/desk.png" class="img-fluid">
            </div> -->
			<div class="col-md-12 col-lg-6">
				<!-- start to destination -->
				<h3><%=d.getStartAddr() %> ==> <%=d.getEndAddr() %></h3>
				<!-- title -->
				<h2><%=d.getTitle() %></h2>
				<!-- description -->
				<p><%=d.getEtc() %></p>
				<!-- 메모 null 이면 숨기기 -->
				<%if(d.getMemo()!=null) {%>
				<p><%=d.getMemo() %></p>
				<%} %>
				
				<p><%=startAddr %></p>
				<br>
				<p><%=endAddr %></p>
			<a href="#" class="btn btn-primary">Learn More</a>
			</div>
			
		</div>
	</div>
	<hr class="my-4">
	
	
	
	
	
	
	<!-- ////////////////////////////////////////////////// -->
	
	<div id="container">
      <div class="main">
        <div class="main__header">
          <span class="main__header__result"> </span>
        </div>
        <div class="main__map main__map-empty" id="map"></div> <!-- 지도 보이는 곳 --> 
      </div>
    </div>


    
       
	
	<script>
	
	

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
	              console.log(obj.coordinateInfo.coordinate[0]);
	              newAddr.push(obj.coordinateInfo.coordinate[0].newLat);
	              newAddr.push(obj.coordinateInfo.coordinate[0].newLon);
	              console.log(newAddr.length)
	              if( newAddr.length == 4){
	            	  startingMap();
	              }
	          },
	          error:function(request,status,error){
	              console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	              
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
            document.querySelector(".main__header__result").innerText =
             tDistance + tTime;
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


	
	


<%-- <%@ include file="/views/common/footer.jsp"%> --%>