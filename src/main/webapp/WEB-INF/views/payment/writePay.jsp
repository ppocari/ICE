<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재작성창</title>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.5.1.min.js'/> "></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/js/jquery-ui.min.css' />">
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
	
<style type="text/css">
form {width: 80%;position: relative;left: 150px;}
input[type="text"], #keeping, #docForm {width: 200px;margin-top: 10px;margin-bottom: 10px;
margin-right: 100px}
div button {position: relative;text-align: right;}
#title {width: 570px;}
#confirmBt {position: relative;left: 180px;}
</style>

</head>
<body>
<form class="form-inline">
	<h2>문서 작성</h2>
	<div class="form-group">
			<label for="docNo">문서 번호</label> 
				<input type="text" class="form-control" id="docNo" placeholder="">
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
		<label for="writer">기안자</label> &ensp;&ensp;
			<input type="text" class="form-control" id="writer" placeholder="">
	</div><br>
	<div class="form-group">
		<label for="writeDay">기안 일자</label> 
			<input type="text" class="form-control" id="writeDay" name="writeDay">
	</div><br>
	<div>
		<label for="title">제목</label> &ensp;&ensp;&ensp;&ensp;
			<input type="text" class="form-control" id="title" name="title">
	</div>
	<div>
		<label for="docForm">기안 양식</label> 
		<select class="form-control" id="docForm">
			<!-- 반복시작 -->
			<option value="1">선택</option>
			<!-- 반복끝 -->
		</select>
	</div><br>
	<div class="form-group">
		<%@ include file="summer.jsp" %>
	</div><br><br>
	<div class="form-group">
		<label for="upfile">첨부파일</label>
		<input type="file" class="form-control" id="upfile" name="upfile">
		<a href="#">삭제</a>
	</div><br><br>
	<div class="form-group">
		<button type="button" class="btn btn-default" id="setpayLine">결재선 지정</button>
		<button type="button" class="btn btn-default" id="setrefLine">참조선 지정</button>
	</div>
	<div class="form-group" id="confirmBt">
		<button type="submit" class="btn btn-primary">결재상신</button>
		<button type="button" class="btn btn-primary" id="">임시저장</button>
		<button type="button" class="btn btn-primary" id="">미리보기</button>
	</div>
</form>
</body>
</html>