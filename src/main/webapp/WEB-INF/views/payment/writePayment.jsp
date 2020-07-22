<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/js/jquery-ui.min.css' />">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#writeDay').datepicker({
			dateFormat:'yy-mm-dd',
			changeYear:true,
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNames:['1월','2월','3월','4월','5월','6월',
				'7월','8월','9월','10월','11월','12월']
		});
	});
</script>
<h2>문서 작성</h2>
<form class="form-horizontal">
	  <div class="form-group">
	    <label for="docNo">문서 번호</label>
	    <input type="text" class="form-control" id="docNo" placeholder="">
	  </div>
	  <div class="form-group">
	    <label for="keeping">보존 기간</label> 
	    <select class="form-control" id="keeping">
			<option value="1">1년</option>
			<option value="2">2년</option>
			<option value="3">3년</option>
			<option value="4">4년</option>
			<option value="5">5년</option>
		</select>
	  </div>
	  <div class="form-group">
	    <label for="department">기안 부서</label>
	    <input type="text" class="form-control" id="department" placeholder="">
	  </div>
	  <div class="form-group">
	    <label for="writer">기안자</label>
	    <input type="text" class="form-control" id="writer" placeholder="">
	  </div>
	  <div class="form-group">
	    <label for="writeDay">기안 일자</label>
	    <input type="text" id="writeDay">
	  </div>
	  <button type="submit" class="btn btn-default">기안 작성</button>
</form>

<%@ include file="../inc/bottom.jsp"%>