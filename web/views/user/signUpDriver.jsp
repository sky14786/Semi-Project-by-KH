<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.truckta.cartype.model.vo.CarType,com.truckta.client.model.vo.Client" %>
<%@ page import = "com.truckta.client.model.vo.*" %>
<%@ include file="/views/common/header.jsp"%>	


<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	List<CarType> list = (List) request.getAttribute("carTypeList");
%>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/signUpDriver-Style.css?ver=1.1" rel="stylesheet" />
<script src="<%=request.getContextPath()%>/js/signUpDriver-js.js?ver=1.1" charset="utf-8"></script>


<script>
	certifiedCheck();
</script>



<div class="container">
	
	<div class="row">
		<div class="col-2"></div>
		<div class="col-1"></div>
		<div class="col-6">
		<br><br><br><br>
			<h2>Driver Sign Up</h2><hr>
			<form action="/driverSignUp" method="post" name="sendform"
				enctype="multipart/form-data" onsubmit="return checkData();">
				<div class="form-group">
					<label for="id">Id</label> <input type="text" name="id" id="id"
						class="form-control" placeholder="Phone Number" value="<%=id %>" readonly
					/>
				</div>
				<div class="form-group form-group-1">
					<label>Date of Birth</label><br />
					<input type="text" name="dateOfBirth" id="dateOfBirth"
						class="form-control"  placeholder="YYYYMMDD"/>
				</div>
				<div class="form-group">
					<label for="carType">Truck Category</label><br /> <select
						name="carType" class="custom-select-sm select-cartype-input">
						<%for(CarType ct : list) {%>
						<option value="<%=ct.getTypeNo() %>" selected><%=ct.getCarType() %></option>
						<%}%>
					</select>
				</div>

				<div class="form-group">
					<label for="dLicense">Driver License</label> <input type="text" name="dLicense" id="dLicense"
						class="form-control" placeholder="ex.??-??-??????-??" 
					/>
				</div>
				<div class="form-group">
					<label for="bLicense">Business License</label> <input type="text" name="bLicense" id="bLicense"
						class="form-control" placeholder="ex.???-??-?????" 
					/>
				</div>
				<div class="form-group">
					<label for="carPic">Truck Picture</label> 
					<input type="file" name="carPic1" id="carPic1" class="form-control btn btn-outline-secondary inputFile" 
							accept=".jpg, .png, .pdf" style="margin-top: 5px;" />
					<button type="button" onclick="deleteDriverImg('carPic1');" class="btn btn-primary">삭제</button>
					<input type="file" name="carPic2" id="carPic2" class="form-control btn btn-outline-secondary inputFile" 
							accept=".jpg, .png, .pdf" style="margin-top: 5px;" />
					<button type="button" onclick="deleteDriverImg('carPic2');" class="btn btn-primary">삭제</button>
					<input type="file" name="carPic3" id="carPic3" class="form-control btn btn-outline-secondary inputFile" 
							accept=".jpg, .png, .pdf" style="margin-top: 5px;" />
					<button type="button" onclick="deleteDriverImg('carPic3');" class="btn btn-primary">삭제</button>
					<input type="file" name="carPic4" id="carPic4" class="form-control btn btn-outline-secondary inputFile" 
							accept=".jpg, .png, .pdf" style="margin-top: 5px;" />
					<button type="button" onclick="deleteDriverImg('carPic4');" class="btn btn-primary">삭제</button>
					<input type="file" name="carPic5" id="carPic5" class="form-control btn btn-outline-secondary inputFile" 
							accept=".jpg, .png, .pdf" style="margin-top: 5px;" />
					<button type="button" onclick="deleteDriverImg('carPic5');" class="btn btn-primary">삭제</button>		
				</div>
				
				<div class="form-group form-check">
					<label for="isAgree" class="form-check-label"> <input
						type="checkbox" name="isAgree" id="isAgree" />&nbsp;&nbsp;Agree
					</label>
				</div>
				<div style="text-align:center;">
				<button type="submit" class="btn btn-primary">Send</button>
				</div>
			</form>
		</div>
		<div class="col-1"></div>
		<div class="col-2"></div>
	</div>
</div>
<script>
function deleteImg(img){
	$("input[name="+img+"]").val("");
}
</script>
<%@ include file="/views/common/footer.jsp"%>
