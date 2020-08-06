<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/top.jsp" %>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script> 
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/payment/payment.css'/>">
<style type="text/css">
	#UDdatefrm{text-align: center;height:120px;}#UDdatefrm label, #UDdatefrm input[type=submit]{margin-left: 10px;margin-right: 10px;}#UDpaylist{margin-top: 20px;}#UDpayTable{width:100%;text-align: center;}#UDpayTable thead tr{background-color: gray;color:white;}#UDupperDiv{background-color: #4e73df;color:white;font-size: 1.3em;font-weight: 600;height: 40px;}#UDupperDiv p{padding-top: 5px;padding-left: 5px;}#UDwholeDiv{padding-left: 20px;padding-right: 20px;}#UDpaylist{overflow-y:auto; overflow-x:hidden;height: 500px;}.UDdocNoInfo{cursor: pointer;}.card-header {padding: .75rem 1.25rem;margin-bottom: 0;background-color: #f8f9fc;border-bottom: 1px solid #e3e6f0;}
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
	<h1 class="h3 mb-0 text-gray-800" style="padding-left: 1.5%;">미결함</h1>
</div>
<div class="row" style="padding-left: 15px;">
	<!-- Area Chart -->
	<div class="col-xl-12 ">
	<div class="card shadow mb-4" style="height:800px;width: 99%;padding: 0px 0px 10px 0px;">
	<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
		<h6 class="m-0 font-weight-bold text-primary">미결문서 목록</h6>
	</div>
	<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
		<form name="searchDateFrm" method="post" class="form-inline"
				id="UDdatefrm" action="<c:url value='/payment/confirm/undecided.do' />">
				<div class="form-group">
					<label for="startDay">작성일</label>
					<div class="input-group date" id="datetimepicker1"
						data-target-input="nearest">
						<input type="text" class="form-control datetimepicker-input" style="margin-left: 2%;"
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
						<input type="text" class="form-control datetimepicker-input" style="margin-left: 2%;"
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
					<input type="text" class="form-control" id="title" name="searchKeyword" value="${paysearchVo.searchKeyword }"> 
					<input class="btn btn-primary" type="submit" value="검색">
				</div>
			</form>
	</div>
	
	<div id="UDwholeDiv">
	<div class="form-group" id="UDpaylist">
	<table id="UDpayTable" class="table table-hover">
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
				<c:forEach var="vo" items="${list }">
					<tr onclick="window.open('../docView.do?docNo=${vo.docNo}','Docviewer','width=1000,height=900,left=0,top=0,location=no,resizable=no,scroll=no');">
						<td>
							<a class="UDdocNoInfo">
								${vo.docNo }
							</a>
						</td>
						<td>${vo.typeName }</td>
						<td>${vo.writedate }</td>
						<td>${vo.name }</td>
						<td>${vo.title }</td>
						<td>${vo.hasFile }</td>
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