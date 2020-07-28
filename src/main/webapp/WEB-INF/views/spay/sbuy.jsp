<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<<<<<<< HEAD
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>

<script type="text/javascript">
	$(function() {
		$('#datetimepicker1').datetimepicker({
			format : 'YYYY-MM-DD',
			date : moment()
		});
	});
</script>
<style>
.date {
	width: 250px;
	float: right;
	margin-right: 50px;
}
</style>
=======
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
>>>>>>> master

<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">식권구매</h1>

<<<<<<< HEAD
		<a href="#"
			class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
			class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
	</div>

	<!-- Content Row -->

=======
		<a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
		<i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
	</div>

	<!-- Content Row -->
>>>>>>> master
	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-12 ">
<<<<<<< HEAD
			<div class="card shadow mb-4" style="height: 100%">
				<!-- Card Header - Dropdown -->
				<form name="memRegisterFrm" method="post"
					action="<c:url value='/spay/sList.do?searchKeyWord=all'/> ">
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">식권구매</h6>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div>
							<iframe src="<c:url value='/inc2/warring.html'/>" width="60%"
								height="350"></iframe>
							<div class="date">
								<div style="text-align: center;">
								<p style="font-size: larger">영업 시간</p>
								<label>점심 오후12시 ~ 2시 </label><br> <label>저녁 오후5시 ~
									7시 </label><br> <label>식당위치 : 지하 1층</label><br>
								</div>
								<div class="search">
									<div class="input-group date" id="datetimepicker1"
										data-target-input="nearest" style="margin-right: 0;">
										<input type="text" class="form-control datetimepicker-input"
											data-target="datetimepicker1" id="datetimepicker1" value="">
										<div class="input-group-append" data-target="#datetimepicker1"
											data-toggle="datetimepicker">
											<div class="input-group-text">
												<i class="fa fa-calendar"></i>
											</div>
										</div>
									</div>
								</div>
								<br>
								<div>
									<br>
									<!-- 선택별로 할인율 보여주기 -->
									<label>식권구매 수량 : </label> <select name="sg">
										<option value="sg1">1장 구매</option>
										<option value="sg2">2장 구매</option>
									</select>
								</div>
								<hr>
								<label>식권 가격 : 7000원</label><br> 
								<label>총 상품 가격 : 7000원</label><br>
								<hr>
								<div style="float: right;">
									<input type="checkbox" id="chkAgree1"> 
									<label for="chkAgree1">구매 동의</label>
								</div>

								<div style="text-align: center;">
									<button class="btn btn-primary btn-user btn-block">결제하기</button>
								</div>
							</div>
=======
			<div class="card shadow mb-4" style="height: 500px">
				<!-- Card Header - Dropdown -->
				<form name="frmbuy" method="post"
					action="<c:url value='/spay/spay.do'/>">
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<div class="center" style="width: -webkit-fill-available;">
							<h6 class="m-0 font-weight-bold text-primary">식권구매</h6>
							
							<div style="background-color: white;">
								<div style="text-align: center;">
									<p style="font-size: larger">영업 시간</p>
									<label>평일 오전 7시 ~ 저녁 9시</label><br> <label>식당위치
										: 지하 1층</label><br>
									<hr>
									<div>
										<label>식권구매 수량 : </label>

										<c:set var="sprice" value="7000" />
										<c:set var="sumPrice" value="0" />

										<select name="sg">
											<option value="sg1">1장 구매</option>
											<option value="sg2">10장 구매</option>
											<option value="sg3">30장구매</option>
											<option value="sg4">직접입력</option>
										</select>
										<!-- 선택별로 할인율 보여주기 -->
									</div>
									<hr>
									<label>식권 가격 : 7000원 </label><br> <label>총 상품 가격
										: <fmt:formatNumber value="${vo.sumPrice }" pattern="#,###" />원
									</label><br>
								</div>
							</div>
							<hr>
							<div style="text-align: center;">
								<button class="btn btn-primary btn-user btn-block">결제하기</button>
							</div>
>>>>>>> master
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
<<<<<<< HEAD
	<hr>
=======
>>>>>>> master
</div>

<%@ include file="../inc/bottom.jsp"%>