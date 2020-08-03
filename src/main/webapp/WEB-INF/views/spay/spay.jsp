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
		margin-left: 20%;
		margin-top: 80px;
		background: #f8f9fc;
		padding: 10px;
		width: 50%;
	}

</style>
</head>

<body>
	<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">결제확인</h1>

		<a href="#"
			class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
			class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
	</div>

	<!-- Content Row -->

	<div class="center">

		<!-- Area Chart -->
		<div class="col-xl-11 " style="left: 5%;">
			<div class="card shadow mb-4" style="height: 100%">
				<!-- Card Header - Dropdown -->
				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">결제정보</h6>
				</div>
				<!-- Card Body -->
				<!-- 가격설정 -->
				<c:set var="now" value="<%=new java.util.Date()%>" />
				<c:set var="date" value="sysdate"/>
				<c:set var="sum" value="${sVo.TICPRICE * sVo.TICQUANTITY}"/>
				<c:set var="saleprice" value="0.9"/>

				<c:if test="${sum >= 70000}">
					<c:set var="sale" value="${sum * saleprice}"/>
					<fmt:parseNumber var= "sale" integerOnly= "true" value="${sale}"/>
				</c:if>
				<c:if test="${sum < 70000}">
					<c:set var="sale" value="${sum}"/>
				</c:if>
						
				<div class="card-body">
					<label>현재시각 : <fmt:formatDate value="${now}" pattern="yyyy-MM-dd hh:mm:ss" /></label><br> 
					<label>구매매수 : ${sVo.TICQUANTITY }장</label><br> 
					<label>결제수단 : Card</label><br> 
					
					<!-- 10장이상이면 할인 -->
					<c:if test="${sVo.TICQUANTITY >=10}">
						<label>할인 : 10%</label><br>
					</c:if>
					<c:if test="${sVo.TICQUANTITY < 10}">
						<label>할인 : 0%</label><br>
					</c:if>
					
					<hr>
					<label>구매자	: ${memVo.name }</label><br>
					<label>전화번호 : ${memVo.hp1} - ${memVo.hp2} - ${memVo.hp3 }</label><br>
					<label>이메일 : ${memVo.email1}${memVo.email2 }</label><br>
					<hr>
					<label>상점 거래ID : "지하 1층 사내 직원 식당"</label><br> 
					<label>결제 금액 : <fmt:formatNumber value="${sale }" 
        				pattern="#,###"/>원</label><br>
					<hr>
					<div style="text-align: center;">
						<button onclick="requestPay()" class="btn btn-primary btn-user btn-block">결제하기</button>
						<button onclick="back()" class="btn btn-primary btn-user btn-block">돌아가기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
    function requestPay() {
		var IMP = window.IMP; // 생략가능
		IMP.init('imp61833107'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(), // 구매일
		    name : '주문명:식권 결제',
		    amount : '${sale }',
		    buyer_email : '${memVo.email1}${memVo.email2}',
		    buyer_name : '${memVo.name}',
		    buyer_tel : '${memVo.hp1}-${memVo.hp2}-${memVo.hp3}',
		    TICQUANTITY: '${sVo.TICQUANTITY }',
    		TICPRICE: '${sVo.TICPRICE }'
	    }, function(rsp) {
	        if ( rsp.success ) {
	        	jQuery.ajax({
	        		url: "<c:url value='/spay/sok.do'/>", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {
	    	    		TICQUANTITY: ${sVo.TICQUANTITY },
	    	    		TICPRICE: ${sVo.TICPRICE }
	        		}
	        	});
	        	location.href="<c:url value='/spay/sok.do'/>";
	        	
	            var msg = '결제가 완료되었습니다.';
	            msg += '결제 금액 : ' + rsp.paid_amount;
	            msg += '카드 승인번호 : ' + rsp.apply_num;
	        } else {
	            var msg = '결제에 실패하였습니다.';
	            msg += '에러내용 : ' + rsp.error_msg;
	        }
	        alert(msg);
	    });
    }
	function back() {
		location.href="<c:url value='/spay/sbuy.do'/>"
	}
</script>
</html>

<%@ include file="../inc/bottom.jsp" %>