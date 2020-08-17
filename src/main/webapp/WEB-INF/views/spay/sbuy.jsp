<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/inc/top.do"/> 
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
<script type="text/javascript">
	$(function(){
		$('form[name=form]').submit(function(){
			if(!$('#chkAgree').is(':checked')){
				alert("구매에 동의하셔야 합니다!");
				$('#chkAgree').focus();
				event.preventDefault();
			}
		});
	});

	var TICPRICE;
	var TICQUANTITY;

	function init () {
		TICPRICE = document.form.TICPRICE.value;
		TICQUANTITY = document.form.TICQUANTITY.value;
		document.form.sum.value = TICPRICE;
		change();
	}

	function add () {
		hm = document.form.TICQUANTITY;
		sum = document.form.sum;
		hm.value ++ ;

		sum.value = parseInt(hm.value) * TICPRICE;
	}

	function del () {
		hm = document.form.TICQUANTITY;
		sum = document.form.sum;
			if (hm.value > 1) {
				hm.value -- ;
				sum.value = parseInt(hm.value) * TICPRICE;
			}
	}

	function change () {
		hm = document.form.TICQUANTITY;
		sum = document.form.sum;

			if (hm.value < 0) {
				hm.value = 0;
			}
		sum.value = parseInt(hm.value) * TICPRICE;
	}  
</script>
<body onload="init();">
<div class="container-fluid">
	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">식권구매</h1>

		
	</div>

	<!-- Content Row -->
	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-7 " style="left: 20%;">
			<div class="card shadow mb-4" style="height: 100%">
				<!-- Card Header - Dropdown -->
				<form name="form" method="post" action="<c:url value='/spay/spay.do'/> ">
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">식권구매</h6>
					</div>
					<!-- Card Body -->
					
					<div class="card-body">
					<!-- 가격 설정 -->
						<div>
							<iframe src="<c:url value='/inc2/warring.html'/>" width="60%"
								height="400"></iframe>
							<div class="date">
								<div style="text-align: center;">
								<p style="font-size: larger">영업 시간</p>
								<label>점심 오후12시 ~ 2시 </label><br> <label>저녁 오후5시 ~
									7시 </label><br> <label>식당위치 : 지하 1층</label><br>
									<!-- 선택별로 할인율 보여주기 -->
								</div>
									<hr>
									<div style="text-align:center;">
								    	<label>식권구매 수량 : </label><br>
								    	<input type=hidden name="TICPRICE" value="7000">
										<input type="button" value=" - " onclick="del();">
										<input type="text" name="TICQUANTITY" value="1" size="3" onchange="change();">
										<input type="button" value=" + " onclick="add();" style="margin-right: 7px;">
										<br>
										총 금액 : <input type="text" name="sum" size="10" readonly>원
									</div>
								<hr>
								<div style="float: right;">
									<input type="checkbox" id="chkAgree"> 
									<label for="chkAgree">구매 동의</label>
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
</body>
<%@ include file="../inc/bottom.jsp"%>