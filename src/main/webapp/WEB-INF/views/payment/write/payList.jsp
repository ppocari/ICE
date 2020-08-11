<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/top.jsp" %>
 <script src="<c:url value = "/resources/vendor/jquery/jquery.min.js"/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/payment/payment.css'/>">
<style type="text/css">
	#writeupperDiv{background-color: #4e73df;color:white;font-size: 1.3em;font-weight: 600;height: 40px;}#writeupperDiv p{padding-top: 5px;padding-left: 5px;}#writewholeDiv{padding-left: 20px;padding-right: 20px;height:fit-content;}#writelabel1 {position: relative;top: 40px;}#writedocNo {position: relative;left: 70px;width: 200px;margin: 0px 0px 10px 10px;}#writelabel2 {top: -40px;left: 310px;position: relative;}#writekeep {position: relative;top: -80px;left: 400px;width: 200px;}#writelabel3 {position: relative;top: -60px;}#writedepartment {position: relative;top: -100px;left: 70px;width: 200px;margin: 0px 0px 10px 10px;}#writelabel4 {position: relative;top: -140px;left: 310px;}#writename {position: relative;top: -180px;left: 390px;width: 200px;margin: 0px 0px 10px 10px;}#writelabel5 {position: relative;top:-142px;}#writewriteDay {position: relative;top: -210px;left: 70px;width: 200px;margin: 0px 0px 10px 10px;}#writelabel6 {position: relative;top:-176px;}#writetitle {width: 92%;position: relative;top:-214px;left: 79px;}#writelabel7 {position: relative;top: -200px;}#writeformNo {width: 200px;position: relative;top: -237px;left: 80px;}.note-editor.note-frame.card {position: relative;top: -216px;}.note-editable.card-block {height: 600px;}#writelabel8 {position: relative;top: -193px;}#writeupfile {position: relative;top: -231px;left: 75px;width: 93%;}#writedocForm {position: relative;top:-213px;}#writesendBt {position: absolute;top: 81%;right: 1%;}#writesaveBt {position: absolute;top: 81%;right: 10%;}#writetypeNo {position: absolute;top: 81%;right: 19%;width:200px;}
</style>

<script type="text/javascript">
	$(function() {
		$('#writeformNo').change(function(){
			$.ajax({
				url:"<c:url value='/payment/getForm.do'/>",
				type:"get",
				data:"formNo="+$(this).val(),
				success:function(res){
					$('#summernote').summernote('code',res.content);
				},
				error:function(xhr, status, error){
					alert(status+", "+error);
				}
			});
		});
	});
	function imsy(){
		$('form[name=writepayInfoFrm]').attr("action","<c:url value='/payment/write/imsyInsert.do?imsy=Y'/>")
	}
	
	function payline(){
		var pop = "opener";
		window.open("", opener, "width= 790,height=620,left=0,top=0,location=no,resizable=no,scroll=no");
		var writepayInfoFrm = document.writepayInfoFrm;
		writepayInfoFrm.target = opener;
		writepayInfoFrm.action = "<c:url value='/payment/write/insertPaydoc.do'/>";
		writepayInfoFrm.submit();
	}
</script>
<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h1 class="h3 mb-0 text-gray-800" style="padding-left: 1.5%;">기안 작성</h1>
</div>
<!-- Content Row -->
<div class="row" style="padding-left: 15px;">
	<!-- Area Chart -->
	<div class="col-xl-12 ">
	<div class="card shadow mb-4" style="height:fit-content;width: 99%;padding: 0px 0px 10px 0px;">
		<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
			<h6 class="m-0 font-weight-bold text-primary">새 문서 작성하기</h6>
		</div>
	<div id="writewholeDiv">
		<form name="writepayInfoFrm" method="post" enctype="multipart/form-data" style="color: black;">
			<label for="docNo" id="writelabel1">문서 번호</label> 
				<input type="text" class="form-control" id="writedocNo" readonly="readonly"
					placeholder="작성중">
			<label for="keep" id="writelabel2">보존 기간</label> 
			<select class="form-control" id="writekeep" name="keep">
				<option value="12">1년</option>
				<option value="24">2년</option>
				<option value="36">3년</option>
				<option value="48">4년</option>
				<option value="60">5년</option>
			</select>
			<label for="department" id="writelabel3">기안 부서</label> 
				<input type="text" class="form-control" id="writedepartment"
					value="${memVo.deptName }" readonly="readonly">
			<label for="name" id="writelabel4">기안자</label>
				<input type="text" class="form-control" id="writename"
					value="${memVo.name }" readonly="readonly">
				<input type="hidden" id="writememNo" name="memNo"
					value="${memVo.memNo }">
			<label for="title" id="writelabel6">제목</label>
				<input type="text" class="form-control" id="writetitle" name="title">
			<label for="formNo" id="writelabel7">기안 양식</label> 
			<select class="form-control" id="writeformNo" name="formNo">
				<option value="0"></option>
				<!-- 반복시작 -->
				<c:forEach var="docformVo" items="${formlist }">
					<option value="${docformVo.formNo }">${docformVo.formName }</option>
				</c:forEach>
				<!-- 반복끝 -->
			</select>
		<c:import url="/payment/summer.do"></c:import>
		<label for="upfile" id="writelabel8">첨부파일</label>
		<input multiple="multiple" type="file" class="form-control" id="writeupfile" name="upfile">
			<select class="form-control" id="writetypeNo" name="typeNo" style="width: 200px;">
				<!-- 반복 시작 -->
					<c:forEach var="doctypeVo" items="${doctypelist }">
						<option value="${doctypeVo.typeNo}">${doctypeVo.typeName}</option>
					</c:forEach>
				<!-- 반복 끝 -->
			</select>
		<button type="submit" class="btn btn-primary" id="writesaveBt"
			onclick="imsy()">임시저장</button>
		<button type="submit" class="btn btn-primary" id="writesendBt" onclick="payline()">결재상신</button>
</form>
</div>
</div>
</div>
</div>
<%@include file="../../inc/bottom.jsp"%>