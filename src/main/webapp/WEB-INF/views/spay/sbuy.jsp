<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">식권구매</h1>

		<a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
		<i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
	</div>

	<!-- Content Row -->
	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-12 ">
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
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="../inc/bottom.jsp"%>