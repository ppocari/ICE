<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../inc/all_css_js.jsp" %>
 <style type="text/css">

 	
 	table {
		width: 98%;
		height:300px;
	}
	
	
	#search_move_msgAddrGroup{
   	 	position: fixed;
   	 	left: 400px;
   		 top: 300px;
	}
 </style> 
 <script type="text/javascript">
 	$(function(){
 		
 		$("#ui_msgAddrGroup ").children().click(function(){
 			var deptCode = $(this).val();
 			$.ajax({
				url:'<c:url value="/message/msgAddr_group.do" />',
				type:"get",
				data: "deptCode="+ deptCode,
				dataType: 'json',
				success:function(res){
					if(res.length>0){
						var str="";
						$.each(res, function(idx, item){	
							
							str+= "<li class='list-group-item list-group-item-action' style='width:100%;' id='result_MAG"+item.memNo+"' value='"+item.memNo+"'>";
							str+= "<input type='checkbox' style='margin-left:5px;'value='"+item.memNo+"'>"
							str+= item.name;
							if(item.deptName != null ){
								str+= "<"+item.deptName+"></li>";
								
							}else{
								str+="</li>";
							}
							
							
						});	
						
						$("#result_msgAddrGroup").html(str);
					}
				}
			});
 		});
 		
 		$("#goRight").click(function(){
 			
 		});
 			
 		
 		
 		
 		/* $("#goRight").click(function(){
 			//#result_msgAddrGroup > li:nth-child(1) > input[type=checkbox]
 			var people = $("#result_msgAddrGroup input[type=checkbox]:checked");
 			
			var str = "";
			var strSplit = "";
			for( var i=0; i<people.length; i++){
				str += $(people[i]).val()+",";
				console.log(str);
							
			}
			
			strSplit = str.split(",");
			var str_new = "";
			
			var existSplit = "";
			for( var s in strSplit){
				str_new  = strSplit[s];
					console.log(s);
					console.log(str_new);
				
				$("#ui_msgAddrPeop").each(function(idx, item){
					var exist = $(this).children(idx).val()+",";
					console.log(exist);
					console.log(exist);
					
					existSplit = exist.split(",");
					for( var e in existSplit){
						if(existSplit[e] != str_new){
							$("#result_MAG"+str_new).clone().appendTo("#ui_msgAddrPeop");
						}
					}
					
				});
				
			}
				
			
		
 		}); */
 		
 		
 		
 		$("#checked_complete").click(function(){
 			//#result_msgAddrGroup > li:nth-child(1) > input[type=checkbox]
 			////#result_MAG111910 > input[type=hidden]:nth-child(2)
 			var people = $("#result_msgAddrGroup input[type=checkbox]:checked");
			var str = "";
			for( var i=0; i<people.length; i++){
				str += $(people[i]).val()+",";
			}
			
			$.ajax({
				url:'<c:url value="/message/msgAddr_group.do" />',
				type:"get",
				data: "people="+ str,
				dataType: 'json',
				success:function(res){
					
				}
				
			});
			
			$("#checked_msgAddrPeop").val(str);
 			
 			
 			var peopleList = $("#checked_msgAddrPeop").val();
 			
 			$(opener.document).find("#recMemNo").val(peopleList);
			self.close();		
 		});
 	});
 </script>
</head>
<body>
	<!-- Begin Page Content -->

<div class="container-fluid">

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-4 " style="margin-top: 30px;">
			<div class="card shadow mb-4" style="height: 500px;">
				<!-- Card Header - Dropdown -->
				<form name="msgAddrFrm" method="post" action="<c:url value='/message/msgClose.do' />">
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">쪽지 주소록</h6>
						<input type="button" value="선택완료" id="checked_complete" class="btn btn-success">
						<input type="hidden" id="checked_msgAddrPeop"  > 
					</div>
					
					<!-- Card Body -->
					<input type="hidden" id = "openAddrMsg_memNo" name = "memNo" value="${sessionScope.identNum }">
					<div class="card-body" style="text-align: center">
						<table class="table table-condensed " >
							<tr style="height: 50px;" >
								<th style="width: 37%">주소록 그룹</th> 
								<th style="width: 63%">검색</th>
								<!-- <th style="width: 40%" rowspan="2">
									
										
									
								</th> -->	 
							
							</tr>
							<tr>
								<td>
									<div id="msgAddrGroup" >
										<ul class="list-group" id="ui_msgAddrGroup" >
											<c:forEach var="deptVo" items="${deptList }">
												<li class="list-group-item list-group-item-action "   
												value="${deptVo.deptCode }"> ${deptVo.deptName }</li>
											</c:forEach>
										</ul>
									</div>
								</td>
								<td>
									<div id="search_msgAddrGroup">
										<ul id="result_msgAddrGroup" style="height:320px;  padding-left: 0px; overflow:scroll; overflow-x: hidden ">
										
										</ul>
									</div>
									<%-- <div id="search_move_msgAddrGroup">
										<input type="button" id="goRight" class="btn btn-success" value=" > " style="margin-bottom: 5px"><br>
										<input type="button" id="goLeft" class="btn btn-success" value=" < ">
									</div> --%>
								
								</td>
							</tr>
							
						
						</table>
					</div>
						
				</form>


			</div>
		</div>
	</div>
</div>
	
</body>
</html>