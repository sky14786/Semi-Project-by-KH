<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="java.util.List,com.truckta.matching.complete.model.vo.MatchingComplete" %>

<%
	List<MatchingComplete> list = (List) request.getAttribute("list");
	int cPage = (int) request.getAttribute("cPage");
	String search = (String) request.getAttribute("search");
	String searchKeyword = (String) request.getAttribute("searchKeyword");
%>
<style>
.container-fluid {
	font-family: "Noto Sans KR", sans-serif;
}
tr>td{
	vertical-align:middle!important;
}
</style>


<div class="container-fluid" style=" margin-top: 7%">
	<table class="table" >
		<thead class="thead-light">
			<tr style="text-align:center;">
				<th>매칭번호</th>
				<th>상태</th>
				<th>매칭성사일자</th>
				<th>완료일자</th>
				<th>기타</th>
			</tr>
		</thead>
		<tbody>
			<%if(list!=null){ 
				for(MatchingComplete mc: list){
			%>
					<tr style="text-align:center;">
						<td><%=mc.getMatNo() %></td>
						<td>
						<%if(mc.getStatus()==1){ %>
						배송완료
						<%}else{ %>
						배송중
						<%} %>
						</td>
						<td><%=mc.getMatDate() %></td>
						<td>
						<%=mc.getComDate()!=null?mc.getComDate():"X" %>
						</td>
						<td>
						<button type="button" class="btn btn-sm" style="background-color:#17a2b8;color:white;">원글보기</button>
						<!-- <button type="button" class="btn btn-sm" style="background-color:#17a2b8;color:white;">매칭정보보기</button> -->
						</td>
						
				</tr>
			<%	}
			}%>
			
					
			
		</tbody>
	</table>
	<div id="pageBar" style="text-align:center;color:black!important;font-size:18px;"> 
			<%=request.getAttribute("pageBar")%>
	</div>
	

</div>
<style>
#pageBar>a{
	color:black!important;
	margin:4px!important;
	font-size:20px;
	
}
#pageBar> .cPage{
	margin:4px!important;
	color:grey!important;
	font-size:22px;
}
.list-padding {
	padding: 10px 5px;
}
</style>
<%@ include file="/views/common/footer.jsp"%>
