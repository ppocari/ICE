<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/inc/top.do"/> 

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

</style>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

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
						<label>주문시각 : ${vo.TICREGDATE }</label><br>
					
						<label>상품명 : 식권 ${vo.TICQUANTITY }장</label><br>
						<label>결제수단 : Card</label><br>
						<label>구매자	: ${memVo.name }</label><br>
						<c:if test="${!empty memVo.hp1}">
						<label>전화번호 : ${memVo.hp1} - ${memVo.hp2} - ${memVo.hp3 }</label><br>
						</c:if>
						<c:if test="${empty memVo.hp1}">
						</c:if>
						<c:if test="${!empty memVo.email1}">
							<label>이메일 : ${memVo.email1}${memVo.email2 }</label><br>
						</c:if>					
						<c:if test="${empty memVo.email1}">
						</c:if>	
						
						<!-- 10장이상이면 할인 -->
						<c:if test="${vo.TICQUANTITY >=10}">
							<label>할인 : 10%</label><br>
						</c:if>
						<c:if test="${vo.TICQUANTITY < 10}">
						</c:if>
					<hr>
					<div class="p-3" style="text-align: center;">
						<label>결제 금액 :	<fmt:formatNumber value="${vo.TICPRICE * vo.TICQUANTITY}" 
	        				pattern="#,###"/>원</label><br>
						<label>카드 승인번호 : *********</label><br>
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