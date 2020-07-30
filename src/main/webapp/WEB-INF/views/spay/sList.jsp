<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script> 
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script> 

<!-- 페이징 처리를 위한 form 시작-->
<form name="frmPage" method="post" 
	action="<c:url value='/shop/order/orderList.do'/>">
	<input type="hidden" name="startDay" value="${param.startDay }">
	<input type="hidden" name="endDay" value="${param.endDay }">
	<input type="hidden" name="currentPage">	
</form>
<!-- 페이징 처리 form 끝 -->

<script type="text/javascript">
	$(function() {
		$('#datetimepicker1').datetimepicker({
            format: 'YYYY-MM-DD',
            date: moment().add(-7,"days")
        });

		$('#datetimepicker2').datetimepicker({
		    format: 'YYYY-MM-DD',
		    date: moment()
		});
		$("#datetimepicker1").on("change.datetimepicker", function(e) {
			$('#datetimepicker2').datetimepicker('minDate', e.date);
		});
		$("#datetimepicker2").on("change.datetimepicker", function(e) {
			$('#datetimepicker1').datetimepicker('maxDate', e.date);
		});
	});
</script>

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
		<div class="col-xl-12 " >
			<div class="card shadow mb-4" style="height: 500px">
				<!-- Card Header - Dropdown -->
				<form name="memRegisterFrm" method="post"  
				action="<c:url value='/spay/sList.do?selectAll='/> ">
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">식권구매</h6>
						<div style="float: right">
							<button type="submit" class="btn btn-info">조회</button>
						</div>
					</div>
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<label for="department" style="margin-left: 10px;">구매 일자</label>
						<div class="search" style="margin-left: auto;">
							<div class="input-group date" id="datetimepicker1"
								data-target-input="nearest">
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
						<div class="search" style="margin-left: 10px;">
							<div class="input-group date" id="datetimepicker2"
								data-target-input="nearest">
								<input type="text" class="form-control datetimepicker-input"
									data-target="datetimepicker2" id="datetimepicker2" value="">
								<div class="input-group-append" data-target="#datetimepicker2"
									data-toggle="datetimepicker">
									<div class="input-group-text">
										<i class="fa fa-calendar"></i>
									</div>
								</div>
							</div>
						</div>
					</div>					
					<!-- Card Body -->
					<div class="card-body">
						<div class="chart-area" style="overflow: auto;">
							<table class="table table-bordered table-hover" id="dynamicTable">
								<thead>
									<tr>
										<th>구매일자</th>
										<th>구매매수</th>
										<th>구매자</th>
										<th>전화번호</th>
										<th>이메일</th>
									</tr>
								</thead>
								<tbody id="dynamicTbody">
									<!-- 반복시작 -->
									<c:if test="${empty sVo }">
										<tr style="text-align: center;">
											<td colspan="5">주문 내역이 존재하지 않습니다.</td>
										</tr>
									</c:if>
									<c:if test="${!empty sVo }">
										<c:forEach var="map" items="${sVo }">
											<tr>
												<td>
												<fmt:formatDate value="${map['TICREGDATE'] }"
													pattern="yyyy-MM-dd hh:mm:ss"/></td>
												<td>${map['TICQUANTITY'] }</td>
												<td>${map['NAME'] }</td>
												<td>${map['TEL']}-${map['HP2']}-${map['HP3'] }</td>
												<td>${map['EMAIL1']}${map['EMAIL2'] }</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
						</table>
						</div>
					</div>		
				</form>
			</div>
		</div>
	</div>
</div>

<div class="divPage" style="text-align: center;">			
	<!-- 페이지 번호 추가 -->		
	<c:if test="${pagingInfo.firstPage>1 }">
		<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">			
		    <img src='<c:url value="/resources/images/first.JPG" />'  border="0">	</a>
	</c:if>
					
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<c:forEach var="i" begin="${pagingInfo.firstPage }" 
	end="${pagingInfo.lastPage }">
		<c:if test="${i==pagingInfo.currentPage }">
			<span style="color:blue;font-weight:bold">${i }</span>
		</c:if>
		<c:if test="${i!=pagingInfo.currentPage }">						
			<a href="#" onclick="pageFunc(${i})">
				[${i }]
			</a>
		</c:if>
	</c:forEach>
		
	<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
		<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">			
			<img src="<c:url value="/resources/images/last.JPG" />" border="0">
		</a>
	</c:if>
	<!--  페이지 번호 끝 -->
</div>

<%@ include file="../inc/bottom.jsp"%>