<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICE</title>
<script src="<c:url value = "/resources/vendor/jquery/jquery.min.js"/>"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link href="<c:url value="/resources/css/sb-admin-2.min.css"/>" rel="stylesheet"> 
<script type="text/javascript">
	$(function(){
		$('#btForm').click(function(){
			location.href="<c:url value='/payment/write/insertForm.do'/>";
		});
		$('.chk').click(function(){
			$(this).next().attr("disabled", false);
		});
	});
</script>
</head>
<body id="SF">
<!-- Content Row -->
<div id="bigDiv">
	<div id="SFheaderDiv">
		<p>문서 양식 등록</p>
	</div>
	<form name="formFrm" method="post" 
		action="<c:url value='/payment/deleteForm.do' />">
	<div class="row" style="padding-left: 15px;">
	<!-- Area Chart -->
	<div class="col-xl-12 ">
	<div class="card shadow mb-4" style="height:400px;width: 99%;padding: 10px 10px 10px 10px;">
	<div id="SFformlistDiv">
		<table class="table" id="SFformTable">
			<thead>
				<tr>
					<td>양식코드</td>
					<td>양식이름</td>
				</tr>
			</thead>
			<!-- 반복 시작 -->
			<tbody>
				<c:set var="idx" value="0"/>
				<c:forEach var="docformVo" items="${formlist }">
				<tr>
					<td>
						<label class="checkbox-inline">
							<input type="checkbox" class="chk">${docformVo.formNo }
							<input type="hidden" name="formItems[${idx }].formNo" id="formNo" value="${docformVo.formNo }" disabled="disabled">
						</label>
					</td>
					<td>${docformVo.formName }</td>
				</tr>
				<c:set var="idx" value="${idx+1 }"/>
				</c:forEach>
				<!-- 반복 끝 -->
			</tbody>
		</table>
	</div>
	</div>
	</div>
	</div>
	<div id="SFlastDiv">
		<button type="submit" class="btn btn-default" id="SFbtDel">선택삭제</button>
		<button type="button" class="btn btn-default" id="SFbtForm">등록</button>
	</div>
	</form>
</div>
</body>
</html>