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
<style type="text/css">
body{overflow: hidden;}
#formNo,#formName{width:200px;}
#headerDiv{background-color: #4e73df; color:white;font-size: 1.3em;font-weight: 600;height: 40px;}
#headerDiv p{padding-left: 8px;padding-top: 8px;}
#btwriteForm{background-color: #4e73df; color:white;}
#empList,#paylineList{width: 700px;}
#empListDiv,#paylineListDiv,#controllDiv{padding-top: 10px;}
#empList *,#paylineList *{text-align: center;}
#formDiv{border: 1px solid #dedede; width: 95%; padding: 10px 10px 10px 10px;margin-left: 18px;margin-top: 8px;text-align: center;}
#empList tr:first-of-type,#paylineList tr:first-of-type{background-color: #808080;color:white;}
</style>

</head>
<body>
	<div id="bigDiv">
		<div id="headerDiv">
			<p>결재선 지정하기</p>
		</div>
		<div id="formDiv">
			<form class="form-inline" method="post" action="">
				<div class="form-group">
					<label for="deptName">부서</label> 
						<input type="text" class="form-control" id="deptName">
				</div>
				<div class="form-group">
					<label for="name">성명</label> 
						<input type="text" class="form-control" id="name">
				</div><br>
				<div class="form-group" id="empListDiv">
					<table id="empList" class="table-hover">
						<tr>
							<th width="10%"></th>
							<th width="20%">부서</th>
							<th width="10%">직급</th>
							<th width="30%">사원코드</th>
							<th width="30%">사원명</th>
						</tr>
						<!-- 반복시작 -->
							<tr>
								<td>
									<input type="checkbox" class="chk">
								</td>
								<td>자제관리팀</td>
								<td>과장</td>
								<td>M007</td>
								<td>정은경</td>
							</tr>
						<!-- 반복끝 -->
					</table>
				</div><br>
				<div class="form-group" id="controllDiv">
					<button type="button" class="btn btn-primary" id="down">▼</button>
					<button type="button" class="btn btn-primary" id="up">▲</button>
				</div><br>
				<div class="form-group" id="paylineListDiv">
					<table id="paylineList">
						<tr>
							<th width="10%"></th>
							<th width="20%">부서</th>
							<th width="10%">직급</th>
							<th width="30%">사원코드</th>
							<th width="30%">사원명</th>
						</tr>
							<!-- <tr>
								<td>
									<input type="checkbox" class="chk">
								</td>
								<td>자제관리팀</td>
								<td>과장</td>
								<td>M007</td>
								<td>정은경</td>
							</tr> -->
					</table>
				</div>
				<div id="lastDiv">
					<button type="submit" class="btn btn-default" id="btSavePayLine">저장</button>
				</div>
			</form>
		</div>

	</div>
</body>
</html>