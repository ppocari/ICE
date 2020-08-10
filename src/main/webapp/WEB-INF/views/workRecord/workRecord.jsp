<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style type="text/css">
	/*top*/
	div#work {
	    background: white;
	    height: 10%;
	}

	#btStart {
	    width: 20%;
	    margin-left: 54%;
	    float: left;
        font-weight: bold;
    	font-size: 1.3em;

	}

	#btEnd {
	    width: 20%;
	    margin-left: 2%;
	    float: left;
	    font-weight: bold;
    	font-size: 1.3em;
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
			alert(year+month);

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
		if(xmlStr==''){
			$("#ajaxCount")
				.html("<p style='text_align:center'>해당 날짜에 근태 기록이 없습니다.</p>");
			return;
		}
		
		var str = "<table class='table table-hover'>";
		str += "<tr><th>오늘날짜</th>";
		str += "<th>출근시간</th>";
		str += "<th>퇴근시간</th>";
		str += "<th>근무상태</th></tr>";
		
		$(xmlStr).each(function(idx, item){
			var cmpRegdate = item.cmpRegdate;
			var cmpIn = item.cmpIn;
			var cmpOut = item.cmpOut;
			var cmpStatus = item.cmpStatus;
			
			str += "<tr>";
			str += "<td>"+cmpRegdate+"</td>";
			str += "<td>"+cmpIn+"</td>";			
			str += "<td>"+cmpOut+"</td>";			
			str += "<td>"+cmpStatus+"</td>";			
			str += "</tr>"; 	
		});
		
		str += "</table>";
		
		$("#ajaxTable").html(str);
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
	<div><span id="name">${userName}님</span></div>
	<!-- Content Row -->
	<div class="row">
		<!-- Area Chart -->
		<div class="col-xl-12 " >
			<div class="card shadow mb-4" style="height: 300px">
				<!-- 근태관리 조회 -->
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h5 class="m-0 font-weight-bold text-primary">출퇴근</h5>
					<!-- 출퇴근 등록 -->
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
				<!-- Card Header - Dropdown -->
				<table class="table table-hover">
					<c:set var="cmpIn_Str" value="${fn:substring(vo.cmpIn,0,2)}${fn:substring(vo.cmpIn,3,5)}"/>
					<c:set var="nine" value="0900"/>
					<c:set var="result" value="${nine-cmpIn_Str}"/>
					
					<!-- 출퇴근 찍을 화면 -->
					<tr>
						<th>오늘날짜</th>
						<th>출근시간</th>
						<th>퇴근시간</th>
						<th>근무상태</th>
						<c:if test="${result < 0}">
							<th>
								지각시간
							</th>
						</c:if>
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
							<c:if test="${vo.cmpStatus == '퇴근(미달)'}">
								<td id="status">퇴근(미달)</td>
							</c:if>
							<c:if test="${vo.cmpStatus == '퇴근(초과)'}">
								<td id="status">퇴근(초과)</td>
							</c:if>
							<c:if test="${vo.cmpStatus == '퇴근'}">
								<td id="status">퇴근</td>
							</c:if>
							
							<!-- 지각시간 -->
							<c:if test="${result < 0}">
								<td id="status" style="color: red">
									${fn:substring(result,0,2)}:${fn:substring(result,2,5)} 지각
								</td>
							</c:if>
							
							<!-- 정상 퇴근 -->
							<c:if test="${vo.cmpStatus == '퇴근'}">
								<td></td>
							</c:if>
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
		<div class="col-xl-12 " >
			<div class="card shadow mb-4" style="height: 500px">
				<!-- 근태관리 조회 -->
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h5 class="m-0 font-weight-bold text-primary">근태관리 조회</h5>
					<form name="workSearchFrm" id="workSearchFrm">
						<span id="spanDate">
							<img alt="" src="<c:url value='/resources/img/workRecord/circle.jpg'/>">
							<label>연도</label>&nbsp;&nbsp;&nbsp;
							<select id="year">
								<option value="2019">2019년</option>
								<option value="2020">2020년</option>
							</select>
							<label>월</label>&nbsp;&nbsp;&nbsp;
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
				<div style="overflow:auto; width:1630px; height:500px;"> 
				
				<div id="ajaxCount"></div>
				<div id="ajaxTable"></div>
				<!-- <table class="table table-hover">
					출퇴근 조회
					<tr>
						<th>오늘날짜</th>
						<th>출근시간</th>
						<th>퇴근시간</th>
						<th>근무상태</th>
					</tr>
					<tr id="ajaxTd">
						<td id="regdate"></td>
						<td id="start"></td>
						<td id="end"></td>
						<td id="status"></td>
					</tr>
				</table> -->
				</div>
			</div>
		</div>
	</div>
</div>





<%@include file="../inc/bottom.jsp"%>