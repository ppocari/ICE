<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영수증</title>
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
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="jquery-barcode.js">
$("#bcTarget1").barcode("1234567890128", "code128");
</script>

<body>
	<div class="center">
		<p class="pname">결제 확인</p>
		<div style="background-color: white;">
			<div class="p-5">
				<p style="font-size: larger">결제 확인</p>
				
					<div>
						<input type="checkbox" name="chkAgree1" id="chkAgree1"> 
						<label for="chkAgree1">구매 약관</label>
					</div>
					<p>
						<iframe src="<c:url value='/inc2/text.html'/>" 
			width="400" height="300"></iframe>
					</p>
					<label>주문시각 : ${map['TICREGDATE'] }</label><br>
					<label>상품명 : ${map['TICQUANTITY'] }</label><br>
					<label>결제수단 : Card</label><br>
					<label>할인율 : 0%</label><br>
				<hr>
				<div class="p-3" style="text-align: center;">
					<label>상점 거래ID : "상점 거래ID"</label><br>
					<label>결제 금액 :	"결제 금액"</label><br>
					<label>카드 승인번호 : "카드 승인번호"</label><br>
				</div>
			</div>
		</div>
		<hr>
		<div style=" text-align: center;">
			<button class="btn btn-primary btn-user btn-block">목록</button>
		</div>
	</div>
</body>
</html>

<%@ include file="../inc/bottom.jsp"%>