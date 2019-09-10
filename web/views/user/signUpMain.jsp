<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<!-- This Page's Include and import Files -->
<script src="https://sdk.accountkit.com/en_US/sdk.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/signUpMain-Style.css?ver=1.1" rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/signUpMain-js.js?ver=1.1" charset="utf-8"></script>

<!-- ----------------End----------------- -->
<div class="container">
	<h1>Sign Up</h1>
	<div class="row content_margin">
		<div class="col-xl-1"></div>
		<div class="col-xl-10 content-background">
			<div>Truck-Ta [DEV MODE] uses Account Kit, a Facebook
				technology, to help you sign in. You don't need a Facebook account.
				An SMS or text confirmation may be sent to verify your number.
				Message and data rates may apply. Learn how Facebook uses your info
			</div>
			<form class="form-style" id="sendform" method="post">
				<div class="form-group">
					<label for="phone_number">Input Your Phone Number</label> <input type="text"
						 name="phone_number" id="phone_number"
						class="form-control input-phonenumber" placeholder="010-XXXX-XXXX" />
			</form>
		</div>
		<div class="form-style">
			<div>
				</form>
				<button onclick="duplicateCheck();"
					class="btn btn-warning button-send">
					<span class="span-send">Send</span>
				</button>
			</div>

		</div>
		<div class="col-xl-1"></div>
	</div>
</div>


<%@ include file="/views/common/footer.jsp"%>