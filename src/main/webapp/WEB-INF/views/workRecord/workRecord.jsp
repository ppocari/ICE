<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<style type="text/css">
	
	/*top*/
	div#work {
	    background: white;
	    height: 10%;
	}

	#btStart {
	    width: 20%;
	    margin-left: 1%;
	    float: left;
	}

	#btEnd {
	    width: 20%;
	    margin-left: 2%;
	    float: left;
	}
	
	span#spanDate {
	    margin-right: 10%;
    	margin-top: 1%;
    	margin-left: 55%;
	}
	
	#h2{
		font-weight: bold;
		margin-left: 2%;
	}
	
	#btSearch{
		float: right;
		width: 7%;
    	margin-right: 3%;
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
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function() {
		$("#btDetail").click(function() {
			event.preventDefault();
			window.open('<c:url value="/workRecord/detail.do?Start=${list.cmpIn}&End=${list.cmpOut}"/>','workList',
		'width=600,height=500,left=0,top=0,location=yes,resizable=yes');
		});
	});//doc
	
	function start() {
		location.href="<c:url value='/workRecord/start.do'/>";
		alert("출근처리 되었습니다.");
	}
	
	function end() {
		location.href="<c:url value='/workRecord/end.do'/>";
		alert("퇴근처리 되었습니다.");
	}
</script>
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
			<div class="card shadow mb-4" style="height: 500px">
				<!-- 근태관리 조회 -->
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h5 class="m-0 font-weight-bold text-primary">근태관리 조회</h5>
					<span id="spanDate">
						<img alt="" src="<c:url value='/resources/img/workRecord/circle.jpg'/>">
						<label>근무일자</label>&nbsp;&nbsp;&nbsp;<input type="date" name="start">
					</span>
					<button id="btSearch" class="btn btn-primary">조회</button>
				</div>
				<!-- Card Header - Dropdown -->
				<form name="workFrm" method="post"
					action="<c:url value='/workRecord/workRecord.do'/>">
					<table class="table table-hover">
						<tr>
							<th>출근시간</th>
							<th>퇴근시간</th>
							<th>근태상태</th>
							<th></th>
						</tr>
						<tr id="workList">
							<td id="Status">${Sdate}</td>
							<td id="End">${vo.cmpOut}</td>
							<td id=""></td>
							<td><button id="btDetail" class="btn btn-primary">상세보기</button></td>
						</tr>
					</table>
				</form>
				<!-- 출퇴근 등록 -->
				<div id="divName">
					<button class="btn btn-primary" id="btStart" onclick="start()">출근</button>
					<button class="btn btn-primary" id="btEnd" onclick="end()">퇴근</button>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="../inc/bottom.jsp"%>