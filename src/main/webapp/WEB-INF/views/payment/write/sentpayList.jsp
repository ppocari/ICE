<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="../../inc/top.jsp"/>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css" />
<style type="text/css">
	input[type="text"]{width: 200px;margin: 0px 0px 10px 10px;}#datefrm{padding-top: 10px;text-align: center;height:120px;}#datefrm label, #datefrm input[type=submit]{margin-left: 10px;margin-right: 10px;}#searchDateDiv,#paylist{background-color: white;}#paylist{margin-top: 20px;}#payTable{width:100%;text-align: center;}#payTable thead tr{background-color: gray;color:white;}#div3 button,#div3 select{margin-left: 10px;}#div2{position: absolute;top: 740px;}#div3{position: absolute;top: 740px;right:1%;}#upperDiv{background-color: #4e73df;color:white;font-size: 1.3em;font-weight: 600;height: 40px;}#upperDiv p{padding-top: 5px;padding-left: 5px;}#wholeDiv{padding-left: 20px;padding-right: 20px;}#paylist{overflow-y:auto; overflow-x:hidden;height: 500px;}.docNoInfo{cursor: pointer;}.card-header {padding: .75rem 1.25rem;margin-bottom: 0;background-color: #f8f9fc;border-bottom: 1px solid #e3e6f0;}
</style>
<script type="text/javascript">
	$(function() {
		$('#datetimepicker1').datetimepicker({
            format: 'YYYY-MM-DD',
        });
		$('#datetimepicker2').datetimepicker({
            format: 'YYYY-MM-DD',
        });
		$("#datetimepicker1").on("change.datetimepicker", function(e) {
			$('#datetimepicker2').datetimepicker('minDate', e.date);
		});
		$("#datetimepicker2").on("change.datetimepicker", function(e) {
			$('#datetimepicker1').datetimepicker('maxDate', e.date);
		});
	});
</script>
<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h1 class="h3 mb-0 text-gray-800" style="padding-left: 1.5%;">기안완료함</h1>
</div>
<!-- Content Row -->
<div class="row" style="padding-left: 15px;">
	<!-- Area Chart -->
	<div class="col-xl-12 ">
	<div class="card shadow mb-4" style="height:800px;width: 99%;padding: 0px 0px 10px 0px;">
	<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
		<h6 class="m-0 font-weight-bold text-primary">기안완료 목록</h6>
	</div>
	<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
		<form name="searchDateFrm" method="post" class="form-inline"
			id="datefrm" action="<c:url value='/payment/write/sentpayList.do' />">
			<div class="form-group">
				<label for="startDay">작성일</label>
				<div class="input-group date" id="datetimepicker1"
					data-target-input="nearest">
					<input type="text" class="form-control datetimepicker-input"
						data-target="datetimepicker1" id="datetimepicker1" name="startDay" value="${paysearchVo.startDay }">
					<div class="input-group-append" data-target="#datetimepicker1"
						data-toggle="datetimepicker">
						<div class="input-group-text">
							<i class="fa fa-calendar"></i>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="input-group date" id="datetimepicker2"
					data-target-input="nearest">
					<input type="text" class="form-control datetimepicker-input"
						data-target="datetimepicker2" id="datetimepicker2" name="endDay" value="${paysearchVo.endDay }">
					<div class="input-group-append" data-target="#datetimepicker2"
						data-toggle="datetimepicker">
						<div class="input-group-text">
							<i class="fa fa-calendar"></i>
						</div>
					</div>
				</div>
			</div>
			<br>
			<div class="form-group">
				<label for="docType">문서종류</label> 
				<select class="form-control" id="docType" name="searchCondition">
					<!-- 반복 시작 -->
					<c:forEach var="doctypeVo" items="${doctypelist }">
						<option value="${doctypeVo.typeNo }"
							<c:if test="${paysearchVo.searchCondition==doctypeVo.typeNo }">
								selected="selected"
							</c:if>
						>${doctypeVo.typeName}</option>
					</c:forEach>
					<!-- 반복 끝 -->
				</select> 
				<label for="title">제목</label> 
				<input type="text" class="form-control" id="title" name="searchKeyword" value="${paysearchVo.searchKeyword }" style="position: relative;top: 5px;"> 
				<input class="btn btn-primary" type="submit" value="검색">
			</div>
		</form>
	</div>
	
	<div id="wholeDiv">
		<div class="form-group" id="paylist">
		<table id="payTable" class="table table-hover">
			<thead>
				<tr>
					<th width="15%;">문서번호</th>
					<th width="10%;">문서종류</th>
					<th width="15%;">신청일</th>
					<th width="10%;">작성자</th>
					<th>제목</th>
					<th width="10%;">첨부</th>
				</tr>
			</thead>
			<tbody>
			<!-- 반복 시작 -->
				<c:forEach var="i" begin="0" end="${fn:length(list) }">
					<tr onclick="window.open('../checkDocView.do?docNo=${list[i].docNo}','Docviewer','width=1000,height=900,left=0,top=0,location=no,resizable=no,scroll=no');">
						<td>
							<a class="docNoInfo">
								${list[i].docNo}
							</a>
						</td>
						<td>${list[i].typeName}</td>
						<td>${list[i].writedate}</td>
						<td>${list[i].name}</td>
						<td>${list[i].title}</td>
						<td>${list[i].hasFile}</td>
					</tr>
				</c:forEach>
			<!-- 반복 끝 -->
			</tbody>
		</table>
	</div>
	</div><br>
</div>
</div>
</div>
<%@include file="../../inc/bottom.jsp"%>