<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>

<style>
	.date {
		width: 250px;
		float: right;
		margin-right: 25px;
	}

</style>

<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">식권구매</h1>

		<a href="#"
			class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
			class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
	</div>

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-7 " style="left: 20%;">
			<div class="card shadow mb-4" style="height: 100%">
				<!-- Card Header - Dropdown -->
				<form name="fFrm" method="post"
					action="<c:url value='/spay/spay.do'/> ">
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">식권구매</h6>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div>
							<iframe src="<c:url value='/inc2/warring.html'/>" width="60%"
								height="400"></iframe>
							<div class="date">
								<div style="text-align: center;">
								<p style="font-size: larger">영업 시간</p>
								<label>점심 오후12시 ~ 2시 </label><br> <label>저녁 오후5시 ~
									7시 </label><br> <label>식당위치 : 지하 1층</label><br>
									<!-- 선택별로 할인율 보여주기 -->
									<label>식권구매 수량 : </label> <select name="sg">
										<option value="sg1">1장 구매</option>
										<option value="sg2">10장 구매</option>
										<option value="sg2">직접입력</option>
									</select>
								</div>
								<!-- 가격 -->
								<c:set var="sum" value="0"/>
								<c:set var="sale" value="0.1"/>
								<c:set var="TICPRICE" value="7000"/>
								
								<c:forEach var="map" items="${list }">
									<c:set var="sum" value ="${TICPRICE * TICQUANTITY}" />
								
								</c:forEach>
								<hr>
									<label>식권 가격 : <fmt:formatNumber value="${TICPRICE }" 
										pattern="#,###"/>원</label><br> 
									<label>총 상품 가격 : <fmt:formatNumber value="${sum }" 
										pattern="#,###"/>원</label><br>
								<hr>
								<div style="float: right;">
									<input type="checkbox" id="chkAgree1"> 
									<label for="chkAgree1">구매 동의</label>
								</div>

								<div style="text-align: center;">
									<button class="btn btn-primary btn-user btn-block">결제하기</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<hr>
</div>

<%@ include file="../inc/bottom.jsp"%>