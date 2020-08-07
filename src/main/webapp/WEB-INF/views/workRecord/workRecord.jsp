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
		var choiceDate;
		
		$("#btDetail").click(function() {
			event.preventDefault();
			location.href="#";
			/*
			window.open('<c:url value="/workRecord/detail.do?Start=${vo.cmpIn}&End=${vo.cmpOut}"/>','workDetail',
		'width=600,height=500,left=0,top=0,location=yes,resizable=yes');
			*/
		});
		
		
		$("#selectDate").datepicker({
	         dateFormat:'yy-mm',
	            changeYear:true,
	            changeMonth:true,
	            dayNamesMin:['일','월','화','수','목','금','토'],
	            monthNamesShort: ['1월', '2월', '3월', '4월', '5월',
	            	'6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	      });
		
		$("form[name=workSearchFrm]").submit(function(){
			if($("#selectDate").val() == ""){
				event.preventDefault();
				$('#selectDate').focus();
				alert("날짜를 선택해주세요!");
			}
			var choiceDate = $("#selectDate").val();
			$(this).attr("action","searchWork.do?selectDate="+choiceDate);
			
		});
		
	});//doc
	
	function start() {
		if(confirm("출근하시겠습니까?")){
			location.href="<c:url value='/workRecord/start.do'/>";
			alert("출근처리 되었습니다.");
		}
	}
	
	function end() {
		if(confirm("출근하시겠습니까?")){
			location.href="<c:url value='/workRecord/end.do'/>";
			alert("퇴근처리 되었습니다.");
		}
	}
</script>
<c:if test="${empty searchVo}">
<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">근태관리</h1>
		<a href="#"
			class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
			class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
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
					<!-- 출퇴근 찍을 화면 -->
					<tr>
						<th>오늘날짜</th>
						<th>출근시간</th>
						<th>퇴근시간</th>
						<th>근무상태</th>
						<th></th>
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
							<c:set var="cmpIn_Str" value="${fn:substring(vo.cmpIn,0,2)}${fn:substring(vo.cmpIn,3,5)}"/>
							<c:set var="nine" value="0900"/>
							<c:set var="result" value="${nine-cmpIn_Str}"/>
								<c:if test="${result < 0}">
									<td id="status" style="color: red">
										${fn:substring(result,0,2)}:${fn:substring(result,2,5)} 지각
									</td>
								</c:if>
							<!-- 사유서 작성 필요 -->
							<c:if test="${vo.cmpStatus == '퇴근(미달)'}">
								<td><button id="btDetail" class="btn btn-primary">사유서 작성</button></td>
							</c:if>
							<c:if test="${vo.cmpStatus == '퇴근(초과)'}">
								<td><button id="btDetail" class="btn btn-primary">사유서 작성</button></td>
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
</c:if>
<!-- Area Chart -->
<div class="col-xl-12 " >
	<div class="card shadow mb-4" style="height: 500px">
		<!-- 근태관리 조회 -->
		<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
			<h5 class="m-0 font-weight-bold text-primary">근태관리 조회</h5>
			<form name="workSearchFrm" id="workSearchFrm" method="post"
				action="<c:url value='/workRecord/searchWork.do'/>">
				<span id="spanDate">
					<img alt="" src="<c:url value='/resources/img/workRecord/circle.jpg'/>">
					<label>근무일자</label>&nbsp;&nbsp;&nbsp;
					<input id="selectDate"></input>
				</span>
				<input type="submit" id="btSearch" value="조회" class="btn btn-primary">
			</form>
		</div>
		<!-- Card Header - Dropdown -->
		<div style="overflow:auto; width:1630px; height:500px;"> 
		<table class="table table-hover">
			<!-- 출퇴근 조회 -->
			<tr>
				<th>오늘날짜</th>
				<th>출근시간</th>
				<th>퇴근시간</th>
				<th>근무상태</th>
				<th></th>
			</tr>
			<c:if test="${!empty searchVo}">
				<c:forEach var="Svo" items="${Slist}">
					<tr>
						<td id="regdate">${Svo.cmpRegdate}</td>
						<td id="start">${Svo.cmpIn}</td>
						<td id="end">${Svo.cmpOut}</td>
						<td id="status">${Svo.cmpStatus}</td>
						<c:if test="${Svo.cmpStatus == '퇴근(초과)' || Svo.cmpStatus == '퇴근(미달)'}">
							<td><button id="btDetail" class="btn btn-primary">사유서 작성</button></td>
						</c:if>
						<c:if test="${Svo.cmpStatus == '퇴근'}">
							<td><button id="btDetail" class="btn btn-primary" disabled>사유서 작성</button></td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		</div>
	</div>
</div>






<%@include file="../inc/bottom.jsp"%>