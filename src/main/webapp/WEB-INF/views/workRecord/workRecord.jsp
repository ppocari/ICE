<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/inc/top.do"/> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style type="text/css">
	/*top*/
	div#work {
	    background: white;
	    height: 10%;
	}

	#btStart {
	   width: 100px;
	}

	#btEnd {
	   width: 100px;
	}
	
	#h2{
		font-weight: bold;
		margin-left: 2%;
	}
	
	
	/*SearchForm*/
	form#workSearchFrm {
	    width: 80%;
	}
	
	#btSearch{
		float: right;
		width: 10%;
    	margin-right: 3%;
	}	
	
	span#spanDate {
    	margin-top: 1%;
    	margin-left: 55%;
	}
	
	
	/*table*/
	#divName{
		margin-top: 1%;
	}
	
	#name{
	    font-weight: bold;
	    font-size: 1.3em;
	}
	
</style>
<link type="text/css" href="<c:url value='/resources/css/sb-admin-2.min.css'/>">
<script type="text/javascript">
	$(function() {
		$("form[name=workSearchFrm]").submit(function(){
			var year = $("#year option:selected").val();
			var month = $("#month option:selected").val();

			event.preventDefault();
			$.ajax({
				url:"/ice/workRecord/searchWork.do?month="+month+"&year="+year+"",
				type:"get",
				datatype:"json",
				success:function(res){
					makeList(res);	
				},
				error:function(xhr, status, error){
					alert(status + ", " + error);
				}
			});
			
			//$(this).attr("action","searchWork.do?selectDate="+choiceDate);
		});
	});//doc
	
	function makeList(xmlStr){
		var str = "<table class='table table-bordered table-hover' style='margin: 10px; width: 98%;'>";
			str += "<tr><th>오늘날짜</th>";
			str += "<th>출근시간</th>";
			str += "<th>퇴근시간</th>";
			//str += "<th>근무상태</th></tr>";
			str += "</tr>";
			
		if(xmlStr==''){
			str += "<tr><td colspan='4' style='text_align:center'>해당 날짜에 근태 기록이 없습니다.</td></tr>";
			str += "</table>";
			$("#ajaxTable").html(str);
			
			return;
		}else{
			$(xmlStr).each(function(idx, item){
				var cmpRegdate = item.cmpRegdate;
				var cmpIn = item.cmpIn;
				var cmpOut = item.cmpOut;
				var cmpStatus = item.cmpStatus;
				
		
				
				str += "<tr>";
				str += "<td>"+cmpRegdate+"</td>";
				str += "<td>"+cmpIn+"</td>";			
				str += "<td>"+cmpOut+"</td>";	
				/*if(cmpStatus == '지각'){
					str += "<td style='color:red';>"+cmpStatus+"</td>";			
				}
				if(cmpStatus == '반차'){
					str += "<td style='color:orange';>"+cmpStatus+"</td>";			
				}
				if(cmpStatus == '초과근무'){
					str += "<td style='color:green';>"+cmpStatus+"</td>";			
				}
				if(cmpStatus == '퇴근'){
					str += "<td>"+cmpStatus+"</td>";			
				}*/
				
			
				str += "</tr>"; 	
			});
			
			str += "</table>";
			
			$("#ajaxTable").html(str);
		}
	}
	
	function start() {
		if(confirm("출근하시겠습니까?")){
			location.href="<c:url value='/workRecord/start.do'/>";
			alert("출근처리 되었습니다.");
		}
	}
	
	function end() {
		if(confirm("퇴근하시겠습니까?")){
			location.href="<c:url value='/workRecord/end.do'/>";
			alert("퇴근처리 되었습니다.");
		}
	}
</script>
<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">근태관리</h1>
	</div>
	<!-- Content Row -->
	<div class="row">
		<!-- Area Chart -->
		<div class="col-xl-7 " >
			<div class="card shadow mb-4" style="height: 190px">
				<!-- 근태관리 조회 -->
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h5 class="m-0 font-weight-bold text-primary">출퇴근</h5>
					<!-- 출퇴근 등록 -->
					<div style="float: right;">
						<button class="btn btn-primary" id="btStart" onclick="start()"
							<c:if test="${not null && vo.cmpIn != null && date == vo.cmpRegdate}">
								disabled
							</c:if>
							>출근
						</button>
						<button class="btn btn-danger" id="btEnd" onclick="end()"
							<c:if test="${not null && vo.cmpOut != null && date == vo.cmpRegdate}">
							disabled
							</c:if>
							>퇴근
						</button>
					</div>
				</div>
				<!-- Card Header - Dropdown -->
				<table class="table table-bordered table-hover" style="margin: 10px; width: 98%;">
					<c:set var="cmpIn_Str" value="${fn:substring(vo.cmpIn,0,2)}${fn:substring(vo.cmpIn,3,5)}"/>
					<c:set var="nine" value="0900"/>
					<c:set var="result" value="${nine-cmpIn_Str}"/>
					
					<!-- 출퇴근 찍을 화면 -->
				
						<tr  >
							<th>오늘날짜</th>
							<th>출근시간</th>
							<th>퇴근시간</th>
							<!-- <th>근무상태</th> 
							<c:if test="${result < 0}">
								<th>
									지각시간
								</th>
							</c:if>-->
						</tr>
						<c:if test="${empty vo}">
							<tr id="workList">
								<td colspan="5" align="center">출근 전입니다</td>
							</tr>
						</c:if>
						
						<c:if test="${!empty vo && date == vo.cmpRegdate}">
							<tr id="workList">
								<td id="regdate">${vo.cmpRegdate}</td>
								<td id="start">${vo.cmpIn}</td>
								<td id="end">${vo.cmpOut}</td>
								<%-- <c:if test="${vo.cmpStatus == '지각'}">
									<td id="status">지각</td>
								</c:if>
								<c:if test="${vo.cmpStatus == '반차'}">
									<td id="status">반차</td>
								</c:if>
								<c:if test="${vo.cmpStatus == '초과근무'}">
									<td id="status">초과근무</td>
								</c:if>
								<c:if test="${vo.cmpStatus == '퇴근'}">
									<td id="status">퇴근</td>
								</c:if>
								<!-- 지각시간 -->
								<c:if test="${result < 0}">
									<td id="status" style="color: red">
										${fn:substring(result,0,2)}시 ${fn:substring(result,2,5)}분
									</td>
								</c:if> --%>
							</tr>
						</c:if>
	
				</table>
			</div>
		</div>
	</div>	
</div>
<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Content Row -->
	<div class="row">
		<!-- Area Chart -->
		<div class="col-xl-7 " >
			<div class="card shadow mb-4" style="height: 500px">
				<!-- 근태관리 조회 -->
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h5 class="m-0 font-weight-bold text-primary">근태관리 조회</h5>
					<form name="workSearchFrm" id="workSearchFrm">
						<span id="spanDate">
							<input type="text" id="year" value="2020" readonly="readonly" style="width: 100px;">년
							&nbsp;&nbsp;&nbsp;
							<select id="month">
								<option value="01">1월</option>
								<option value="02">2월</option>
								<option value="03">3월</option>
								<option value="04">4월</option>
								<option value="05">5월</option>
								<option value="06">6월</option>
								<option value="07">7월</option>
								<option value="08">8월</option>
								<option value="09">9월</option>
								<option value="10">10월</option>
								<option value="11">11월</option>
								<option value="12">12월</option>
							</select>
						</span>
						<button id="btSearch" class="btn btn-primary">조회</button>
					</form>
				</div>
				<!-- Card Header - Dropdown -->
				<div style="overflow: scroll; overflow-x: hidden; height: 380px;" > 
				
				<!-- 조회시 테이블 생성 -->
				<div id="ajaxTable"></div>
				
				</div>
			</div>
		</div>
	</div>
</div>





<%@include file="../inc/bottom.jsp"%>