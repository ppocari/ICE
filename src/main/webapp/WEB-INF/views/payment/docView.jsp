<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICE</title>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.5.1.min.js'/> "></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<style type="text/css">
body{overflow: hidden;}
#cancelBt{background-color: #4e73df; color:white;}
#headerDiv{background-color: #4e73df; color:white;font-size: 1.3em;font-weight: 600;height: 40px;}
#headerDiv p{padding-left: 8px;padding-top: 8px;}
#docTable{text-align: center;height: 790px;}
#docType{font-size: 1.5em;font-weight: 600;}
#title,#content{text-align: left;}
#content{height: 50%;}
#lastDiv{position: relative;left: 88%;}
</style>
</head>
<body>
<div id="bigDiv">
	<div id="headerDiv">
		<p>문서보기</p>
	</div>
	<div id="tableDiv">
		<table id="docTable" class="table table-bordered">
			<tr>
				<td rowspan="2" colspan="6" id="docType">품의서</td>
				<td>문서번호</td>
				<td>ED20200721001</td>
			</tr>
			<tr>
				<td>보존연한</td>
				<td>N년</td>
			</tr>
			<tr height="10">
				<td>기안부서</td>
				<td>영업팀</td>
				<td rowspan="3" width="15">기안부서</td>
				<td>결재</td>
				<td>결재</td>
				<td>결재</td>
				<td>결재</td>
				<td>결재</td>
			</tr>
			<tr height="80">
				<td rowspan="2">기안자</td>
				<td rowspan="2">정은경</td>
				<td>완료 2020-07-21</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr height="10">
				<td>대주주 정은경</td>
				<td></td>
				<td></td>
				<td>대리 홍길동</td>
				<td>차장 박길동</td>
			</tr>
			<tr height="10">
				<td>기안일자</td>
				<td>2020-07-10</td>
				<td rowspan="3" width="15">참고부서</td>
				<td>참고인</td>
				<td>참고인</td>
				<td>참고인</td>
				<td>참고인</td>
				<td>참고인</td>
			</tr>
			<tr height="80">
				<td rowspan="2">참고부서</td>
				<td rowspan="2">개발팀</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr height="10">
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="7" id="title">품의서입니다</td>
			</tr>
			<tr>
				<td colspan="8" id="content">호왕</td>
			</tr>
		</table>
	</div>
	<div id="lastDiv">
		<button type="submit" class="btn btn-default" id="cancelBt">결재상신 취소</button>
	</div>
</div>
</body>
</html>