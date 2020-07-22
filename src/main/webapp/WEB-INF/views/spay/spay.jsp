<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 확인 및 결제창</title>
<style type="text/css">
	.center {
	    margin-left: 250px;
	    margin-top: 80px;
	    background: white;
	    padding: 10px;
	    width: 57%;
	}
	.p-5{
		padding:2rem !important;
		width:50%;
		text-align: center;
		border: solid;
	}
	
	.sick{
		text-align: center;
	}
	.imgsick{
		width: 80%;
		line-height: 100px;
	}
	

    
</style>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
    function requestPay() {
		var IMP = window.IMP; // 생략가능
		IMP.init('imp61833107'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : 14000,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		   
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
    }
</script>
<body>
	<div class="center">
		<p style="font-size:larger">결제 확인</p>
		<div class="row" style="background-color: white;">
			<div class="col-lg-6 d-none d-lg-block bg-login-image">
				<div class="sick">
					<img alt="차후 수정예정" src="<c:url value='/resources/img/sanae.jpg'/>"
					class="imgsick">
				</div>
			</div>
			<div class="p-5">
				<label>주문시각 : "yyyy-MM-dd"</label><br>
				<label>상품명 : "식권"</label><br>
				<label>결제수단 : "카드"</label><br>
				<label>할인율 : </label><br>
			</div>
		</div>
		<hr>
			<div class="p-3" style="text-align: center;">
				<label>상점 거래ID : "상점 거래ID"</label><br>
				<label>결제 금액 : "결제 금액"</label><br>
				<label>카드 승인번호 : "카드 승인번호"</label><br>
			</div>
		<button onclick="requestPay()" class="btn btn-primary btn-user btn-block">결제하기</button>
	</div>

</body>
</html>

<%@ include file="../inc/bottom.jsp" %>