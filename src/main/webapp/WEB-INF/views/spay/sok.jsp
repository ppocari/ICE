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
	margin-left: 250px;
	margin-top: 80px;
	background: white;
	padding: 10px;
	width: 57%;
}

.p-5 {
	padding: 2rem !important;
}

.sick {
	text-align: center;
}

.imgsick {
	width: 80%;
	line-height: 100px;
}
</style>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<body>
	<form action="">
	<div class="center">
		<p style="font-size: larger">결제 확인</p>
		<div class="row" style="background-color: white;">
			<div class="p-5">
				<label>주문시각 : "yyyy-MM-dd"</label><br> <label>주문자명 :
					"주문명"</label><br> <label>구매자 : "구매자"</label><br> <label>메일
					: "ice@naver.com"</label><br> <label>전화번호 : "010-1111-2222"</label><br>
				<label>주소 : "서울시 하수구 A동"</label><br> <label>우편번호 :
					"123-456"</label><br> <label>결제수단 : "카드"</label><br>
			</div>
		</div>
		<hr>
		<div class="p-3" style="text-align: center;">
			<label>상점 거래ID : "상점 거래ID"</label><br>
			<label>결제 금액 :	"결제 금액"</label><br>
			<label>카드 승인번호 : "카드 승인번호"</label><br>
		</div>
	</div>
	</form>

</body>
</html>

<%@ include file="../inc/bottom.jsp"%>