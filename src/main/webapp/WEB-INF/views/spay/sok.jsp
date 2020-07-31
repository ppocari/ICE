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
	<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">결제완료</h1>

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
					<h6 class="m-0 font-weight-bold text-primary">영수증</h6>
				</div>
				<div class="card-body">
					<c:set var="now" value="<%=new java.util.Date()%>" />
						<label>주문시각 : <fmt:formatDate value="${now}" pattern="yyyy-MM-dd hh:mm:ss" /></label><br>
						<label>상품명 : 식권 ${sVo.TICQUANTITY }장</label><br>
						<label>결제수단 : Card</label><br>
						<c:if test="${sVo.TICQUANTITY >=10}">
							<label>할인 : 10%</label><br>
						</c:if>
						<c:if test="${sVo.TICQUANTITY < 10}">
							<label>할인 : 0%</label><br>
						</c:if>
					<hr>
					<div class="p-3" style="text-align: center;">
						<label>상점 거래ID : "상점 거래ID"</label><br>
						<label>결제 금액 :	<fmt:formatNumber value="${sale }" 
	        				pattern="#,###"/>원</label><br>
						<label>카드 승인번호 : "카드 승인번호"</label><br>
						<hr>
						<label>결제가 완료되었습니다.</label><br>
						<label>감사합니다.</label>
					</div>
					<hr>
					<div style=" text-align: center;">
						<a href="<c:url value='/spay/sList.do'/>"><button class="btn btn-primary btn-user btn-block">구매목록</button></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>

<%@ include file="../inc/bottom.jsp"%>