<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script> 
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css" />

 <style type="text/css">
	input[type="text"]{width: 200px;margin: 0px 0px 10px 10px;}
	#datefrm{padding-top: 10px;text-align: center;height:120px;}
	#datefrm label, 
	#datefrm input[type=submit]{margin-left: 10px;margin-right: 10px;}
	#searchDateDiv,#paylist{background-color: white;}
	#paylist{margin-top: 20px;}
	#payTable{width:100%;text-align: center;}
	#payTable thead tr{background-color: gray;color:white;}
	#div3 button,#div3 select{margin-left: 10px;}
	#upperDiv{color: #4e73df;font-size: 1.3em;font-weight: 600;}
</style>

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
            format: 'L',
            date: moment()
        });
		$('#datetimepicker2').datetimepicker({
            format: 'L',
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
<div style="padding: 5rem !important">
	<div id="upperDiv">
		<p>구매 기록</p>
	</div>
	<div class="form-group" id="searchDateDiv">
		<form name="searchDateFrm" method="post" class="form-inline"
			id="datefrm" action="<c:url value='/payment/payList.do' />">
			<div class="form-group">
				<label for="startDay">구매일자</label>
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
			<div class="form-group">
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
			<br>
		</form>
	</div>

	<div class="form-group" id="paylist">
	<table id="payTable" class="table table-hover">
		<thead>
			<tr>
				<th width="20%;">구매일자</th>
				<th width="10%;">구매매수</th>
				<th width="10%;">구매자</th>
				<th width="15%;">휴대폰 번호</th>
			</tr>
		</thead>
		<!-- 반복 시작 -->
		<tbody>
			<tr>
				<td>2020-07-10</td>
				<td>10</td>
				<td>정시하</td>
				<td>010-1111-2222</td>
			</tr>
		</tbody>
		<!-- 반복 끝 -->
	</table>
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
</div>

<%@ include file="../inc/bottom.jsp"%>