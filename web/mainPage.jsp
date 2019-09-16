<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.truckta.boardmatching.model.vo.BoardMatching" %>
    <%
        //List<Client_notice> list=(List)request.getAttribute("list");
        
        List<BoardMatching> list_page=(List)request.getAttribute("list_page");
        //int numPerPage=(int)request.getAttribute("numPerPage");
        //String searchType=(String)request.getAttribute("searchType");
 		//String searchKey=(String)request.getAttribute("searchKeyword");
        
    	
    %>
    
    <%@ include file="/views/common/header.jsp"%>
    
	<div class="container">


		<div class="row">
			<div class="col-md-4 mb-3">
				<label for="state">도시</label>                                              <!-- onchange="citySelect()"-->
				<select class="custom-select d-block w-100" id="select1" required >
					<option value="">Choose...</option>
					<option value="seoul">서울시</option>
					<option value="kyungsang">경남</option>
					<option value="junra">경북</option>
				</select>
				<div class="invalid-feedback">
					Please provide a valid state.
				</div>
			</div>
			<div class="col-md-4 mb-3">
				<label for="state">구</label>
				<select class="custom-select d-block w-100" id="select2" required>
					<option value="">Choose...</option>
				
				</select>
				
				<div class="invalid-feedback">
					Please provide a valid state.
				</div>
			</div>
			<div class="col-md-4 mb-3">
				<label for="state">날짜별</label>
				<select class="custom-select d-block w-100" id="state" required>
					
					<option>California</option>
				</select>
				<div class="invalid-feedback">
					Please provide a valid state.
				</div>

			</div>


  



		</div>
		<div class="row content_margin">
			<div class="col-xl-1"></div>
			<div class="col-xl-10" style="background-color: lightgray; padding: 60px 20px">
				<div class="row placeholders">
				<%for(BoardMatching bm : list_page){ %>
					<div class="col-xs-6 col-sm-3 placeholder trasition">
					
						<button class="but_1" onclick="location.href='<%=request.getContextPath()%>'">
							<img src="sin11.jpg" class="img-responsive" >
							<h5><%=bm.getStartAddr() %></h5>
							<h5><%=bm.getEndAddr() %></h5>
							<div class="trg" id='trg'>조회수 : <span class="text-muted" id="sp_1">0</span></div>
					</div>
					</button>
					<%} %>
					
					

				</div>

			</div>


		</div>
		
		
		<!--클릭시 늘어나게만들어야함-->
	 	 		 
   
        
        
		<div class="col-sm-1" id="pagebar" style="board:1px solid red">
		<%=request.getAttribute("pageBar")%>
		</div>
	</div>
	</div>


     
	<script>
    /*
    function citySelect(){
		 
		var seoul = ["강남","강북","강서"];
		var kyungsang = ["거제시","거창군","고성군","김해시"];
		var junra = ["경산시","경주시","고령군","구미시"];
		 
		var select = $("#select1").val();
		 
		var change;
		  
		if(select == "seoul"){
			change=seoul;
		}
		else if(select == "kyungsang"){
			change = kyungsang;
		}
		else if(select == "junra"){
			change =  junra;
		}
		 
		$('#select2').empty();
		 
		for(var count = 0; count < change.length; count++){                
		                var option = $("<option>"+change[count]+"</option>");
		                $('#select2').append(option);
		            }
		 
		}
    
    */

	


    </script>
 
      	      

	
	 <%@ include file="/views/common/footer.jsp"%>