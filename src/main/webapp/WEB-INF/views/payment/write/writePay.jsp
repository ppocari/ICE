<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICE</title>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.5.1.min.js'/> "></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/js/jquery-ui.min.css' />">
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
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
		
	});
</script>
</head>
<body>
<form class="form-inline" name="payInfoFrm" method="post" 
	action="<c:url value='/payment/write/insertPaydoc.do'/>"
	enctype="multipart/form-data">
	<h2>${typeName } 작성</h2>
	<div class="form-group">
			<label for="docNo">문서 번호</label> 
				<input type="text" class="form-control" id="docNo" readonly="readonly">
			<label for="keep">보존 기간</label> 
			<select class="form-control" id="keep" name="keep">
				<option value="1">1년</option>
				<option value="2">2년</option>
				<option value="3">3년</option>
				<option value="4">4년</option>
				<option value="5">5년</option>
			</select>
	</div>
	<div class="form-group">
		<label for="department">기안 부서</label> 
			<input type="text" class="form-control" id="department"
				value="개발팀" readonly="readonly">
		<label for="name">기안자</label> &ensp;&ensp;
			<input type="text" class="form-control" id="name"
				value="정그래" readonly="readonly">
			<input type="hidden" id="memNo" name="memNo"
				value="202007262001">
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
		<label for="docForm">기안 양식</label> 
		<select class="form-control" id="formNo" name="formNo">
			<!-- 반복시작 -->
			<option value="0">선택</option>
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