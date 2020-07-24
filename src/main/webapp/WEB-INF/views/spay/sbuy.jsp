<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식권 구매</title>
<style type="text/css">
	.center {
		margin-left: 20%;
		margin-top: 80px;
		background: #f8f9fc;
		padding: 10px;
		width: 50%;
	}
	
	.bt5 {
		box-shadow: inset 0px 1px 0px 0px #bbdaf7;
		background: linear-gradient(to bottom, #79bbff 5%, #378de5 100%);
		background-color: #79bbff;
		border-radius: 6px;
		border: 1px solid #84bbf3;
		display: inline-block;
		cursor: pointer;
		color: #ffffff;
		font-family: Arial;
		font-size: 15px;
		font-weight: bold;
		padding: 6px 24px;
		text-decoration: none;
		text-shadow: 0px 1px 0px #528ecc;
		width: 20%
	}
	
	.bt5:hover {
		color: rgb(255, 255, 255);
		background-color: rgb(46, 89, 217);
		border-color: rgb(38, 83, 212);
	}
	
	.bt5:active {
		position: relative;
		top: 1px;
	}
	
	.p-5 {
		padding: 2rem !important;
		text-align: center;
		border: solid;
	}
	
	.pname{
		background: #808080;
		margin-top: 0px;
		margin-bottom: 0px;
		color: white;
	}

</style>

</head>
<body>
	<form name="frmbuy" method="post" action="<c:url value='/spay/spay.do'/>">
	<div class="center">
		<p class="pname">식권 구매</p>
		<div style="background-color: white;">
			<div class="p-5">
				<div style="text-align: center;">
					<p style="font-size: larger">영업 시간</p>
					<label>평일 오전 7시 ~ 저녁 9시</label><br> 
					<label>식당위치 : 지하 1층</label><br>
					<hr>
					<div>
						<label>식권구매 수량 : </label> 
						<select name="sg">
							<option value="sg1">1장 구매</option>
							<option value="sg2">10장 구매</option>
							<option value="sg3">30장구매</option>
							<option value="sg4">직접입력</option>
						</select>
						<!-- 선택별로 할인율 보여주기 -->
					</div>
					<hr>
					<label>식권 가격 : 7000원</label><br> <label>총 상품 가격 :
						7000원</label><br>
				</div>
			</div>
		</div>
		<hr>
		<div style="text-align: center;">
			<button class="btn btn-primary btn-user btn-block">결제하기</button>
		</div>
	</div>
	</form>
</body>
</html>

<%@ include file="../inc/bottom.jsp"%>