<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICE</title>
<script src="<c:url value = "/resources/vendor/jquery/jquery.min.js"/>"></script>
<style type="text/css">
body{overflow: hidden;}
form {width: 80%;position: relative;left: 150px;}
input[type="text"], #keep, #docForm {width: 200px;margin-top: 10px;margin-bottom: 10px;
margin-right: 100px}
div button {position: relative;text-align: right;}
#title {width: 570px;}
#confirmBt {position: relative;left: 180px;}
form[name=payInfoFrm] h2{font-weight: 600; color:#4e73df;}
#sendBt,#saveBt,#lookBt{background-color: #4e73df; color:white;}
</style>
<script type="text/javascript">
	$(function(){
		$('#formNo').change(function(){
			
		});
	});
	
</script>
</head>
<body>
<form class="form-inline" name="payInfoFrm" method="post" 
	action="<c:url value='/payment/write/insertPaydoc.do'/>"
	enctype="multipart/form-data">
	<h2>${typeName } 작성</h2>
	<input type="hidden" id="typeNo" name="typeNo" value="${param.typeNo }">
	<div class="form-group">
			<label for="docNo">문서 번호</label> 
				<input type="text" class="form-control" id="docNo" readonly="readonly">
			<label for="keep">보존 기간</label> 
			<select class="form-control" id="keep" name="keep">
				<option value="12">1년</option>
				<option value="24">2년</option>
				<option value="36">3년</option>
				<option value="48">4년</option>
				<option value="60">5년</option>
			</select>
	</div>
	<div class="form-group">
		<label for="department">기안 부서</label> 
			<input type="text" class="form-control" id="department"
				value="${memVo.deptName }" readonly="readonly">
		<label for="name">기안자</label> &ensp;&ensp;
			<input type="text" class="form-control" id="name"
				value="${memVo.name }" readonly="readonly">
			<input type="hidden" id="memNo" name="memNo"
				value="${memVo.memNo }">
	</div><br>
	<div class="form-group">
		<label for="writeDay">기안 일자</label> 
			<input type="text" class="form-control" id="writeDay"
				value="" readonly="readonly">
	</div><br>
	<div>
		<label for="title">제목</label> &ensp;&ensp;&ensp;&ensp;
			<input type="text" class="form-control" id="title" name="title">
	</div>
	<div>
		<label for="formNo">기안 양식</label> 
		<select class="form-control" id="formNo" name="formNo">
			<!-- 반복시작 -->
			<option></option>
			<c:forEach var="docformVo" items="${formlist }">
				<option value="${docformVo.formNo }">${docformVo.formName }</option>
			</c:forEach>
			<!-- 반복끝 -->
		</select>
	</div><br>
	<div class="form-group">
		<%@ include file="../summer.jsp" %>
	</div><br><br>
	<div class="form-group">
		<label for="upfile">첨부파일</label>
		<input type="file" class="form-control" id="upfile">
		<a href="#">삭제</a>
	</div><br><br>
	<div class="form-group">
		<button type="button" class="btn btn-default" id="setpayLine"
			onclick="parent.location.href='selectPayLine.do'">결재선 지정</button>
		<button type="button" class="btn btn-default" id="setrefLine">참조선 지정</button>
	</div>
	<div class="form-group" id="confirmBt">
		<button type="submit" class="btn btn-default" id="sendBt">결재상신</button>
		<button type="button" class="btn btn-default" id="saveBt">임시저장</button>
		<button type="button" class="btn btn-default" id="lookBt">미리보기</button>
	</div>
</form>
</body>
</html>