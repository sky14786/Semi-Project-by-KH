<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>


<!-- This Page's Include and import Files -->

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/detailView-Style.css?ver=1.2" rel="stylesheet">

<!-- ----------------End----------------- -->


<div class="container">
  <div class="row content_margin">
    <div class="col-xl-10 content-background">
      <div>
        <div>
          <div>
            <div>
              <img align="left" src="../../images/profile_images/hyeyoon.jpg" alt="" width="80px" height="80px">
            </div>
            <div>
              <div>
                <h4>하이</h4>
              </div>
              <div>
                <h5>하이2</h5>
              </div>
            </div>
          </div>
          <div>
            <div><button type="button" class="btn btn-outline-primary" style="float : right">글내리기</button></div>
            <div><button type="button" class="btn btn-outline-primary" style="float : right">글올리기</button></div>
          </div>
        </div>
      </div>

      <hr>

      <div id="demo" class="carousel slide" data-ride="carousel">

        <!-- Indicators -->
        <ul class="carousel-indicators">
          <li data-target="#demo" data-slide-to="0" class="active"></li>
          <li data-target="#demo" data-slide-to="1"></li>
          <li data-target="#demo" data-slide-to="2"></li>
        </ul>

        <!-- The slideshow -->
        <div class="carousel-inner" data-interval="false">
          <div class="carousel-item active">
          <img class="img-responsive center-block" src="../../images/profile_images/hyeyoon.jpg" width="400px" height="400px" alt="Los Angeles">
          </div>
          <div class="carousel-item">
          <img class="img-responsive center-block" src="../../images/profile_images/hyeyoon.jpg" width="400px" height="400px" alt="Los Angeles">
          </div>
          <div class="carousel-item">
          <img class="img-responsive center-block" src="../../images/profile_images/hyeyoon.jpg" width="400px" height="400px" alt="Los Angeles">
          </div>
        </div>

        <!-- Left and right controls -->
        <a class="carousel-control-prev" href="#demo" data-slide="prev">
          <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#demo" data-slide="next">
          <span class="carousel-control-next-icon"></span>
        </a>

      </div>
      <hr>
      <h1>글제목</h1>
      <textarea name="" id="" cols="100" rows="5"></textarea>
      <hr>
      <h1>신청현황1</h1>
      <div>
        <img align="left" src="../../images/profile_images/hyeyoon.jpg" alt="" width="80px" height="80px">
        <div>
          <h4>드라이버 이름</h4>
          <h1>입찰금액</h1>
        </div>
        <button type="button" class="btn btn-outline-primary" style="float : right">거절하기</button>
        <button type="button" class="btn btn-outline-primary" style="float : right">수락하기</button>
      </div>
      <hr>
      <h1>신청현황2</h1>
      <div>
        <img align="left" src="../../images/profile_images/hyeyoon.jpg" alt="" width="80px" height="80px">
        <div>
          <h4>드라이버 이름</h4>
          <h1>입찰금액</h1>
        </div>
        <button type="button" class="btn btn-outline-primary" style="float : right">거절하기</button>
        <button type="button" class="btn btn-outline-primary" style="float : right">수락하기</button>
      </div>
      <hr>
      <h1>신청현황3</h1>
      <div>
        <img align="left" src="../../images/profile_images/hyeyoon.jpg" alt="" width="80px" height="80px">
        <div>
          <h4>드라이버 이름</h4>
          <h1>입찰금액</h1>
        </div>
        <button type="button" class="btn btn-outline-primary" style="float : right">거절하기</button>
        <button type="button" class="btn btn-outline-primary" style="float : right">수락하기</button>
      </div>
      <hr>
      <form class="form-style" id="sendform" method="post">
        <div class="form-group">
      </form>
    </div>
</div>
</div>


<%@ include file="/views/common/footer.jsp"%>