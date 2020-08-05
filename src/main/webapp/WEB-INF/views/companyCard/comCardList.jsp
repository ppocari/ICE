<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../inc/top.jsp" />

<style>
.table td {
	width: 90px;
}

.table .registerTable {
	width: 90px;
	border: 1px solid white;
}

.register_text {
	width: 110px;
}
.search input{
	width:120px;
}


</style>
<script type="text/javascript">
	$(function(){
		$( "input[name=usedate1]" ).datepicker({
			dateFormat:'yy-mm-dd',
	         changeYear:true,
	         changeMonth:true,
	         dayNamesMin:['일','월','화','수','목','금','토'],
	         monthNames:['1월','2월','3월','4월','5월','6월',
	            '7월','8월','9월','10월','11월','12월']
		} );
		
		$( "input[name=usedate2]" ).datepicker({
			dateFormat:'yy-mm-dd',
	         changeYear:true,
	         changeMonth:true,
	         dayNamesMin:['일','월','화','수','목','금','토'],
	         monthNames:['1월','2월','3월','4월','5월','6월',
	            '7월','8월','9월','10월','11월','12월']
		} );
		
	});
	
</script>
<!-- Begin Page Content -->

<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">법인카드 조회</h1>

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
				action="<c:url value='/companyCard/comCardList.do'/> ">
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">법인카드 조회</h6>
						<div style="float: right">
							<button type="submit" class="btn btn-info"
							 >전체조회</button>
						</div>
						
					</div>
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<div class="search" style="margin-left: 10px;">
							<label for="deptCode" style="margin-right: 20px;">부서별 조회</label>
							<select name="deptCode">
								<!-- option 반복 -->
								<option value="">전체</option>
								<c:forEach var="deptvo" items="${deptList }">
									<option value="${deptvo.deptCode }" 
										<c:if test="${dpdvo.deptCode == deptvo.deptCode }">
											selected="selected"
										</c:if>
										>${deptvo.deptName }</option>
								</c:forEach>
							</select>
						</div>
						<div class="search">
							<label for="posCode" style="margin-right: 20px;">직급별 조회</label>
							<select name="posCode">
								<!-- option 반복 -->
								<option value="">전체</option>
								<c:forEach var="posvo" items="${ posList }">
									<option value="${posvo.posCode }">${posvo.posName }</option>
								</c:forEach>
							</select>
						</div>
						<div class="search" style="margin-right: 20px;">
							<label for="price1" style="margin-right: 20px;">금액별</label>
							<input type="text" name="price1" value="${dpdvo.price1 }"> ~
							<input type="text" name="price2" value="${dpdvo.price2 }">
						</div>
						<div class="search" style="margin-right: 20px;">
							<label for="usedate1" style="margin-right: 20px;">사용일별</label>
							<input type="text" name="usedate1" id="usedate1" value="${dpdvo.usedate1 }"> ~
							<input type="text" name="usedate2" id="usedate2" value="${dpdvo.usedate2 }">
						</div>
						
						
						
					</div>
					
					<!-- Card Body -->
					<div class="card-body">
						<div class="chart-area" style="overflow: scroll;">
							<table class="table table-bordered table-hover" id="dynamicTable">
								<thead>
									<tr>
										<th>카드번호</th>
										<th>사원이름</th>
										<th>계정코드</th>
										<th>사용금액</th>
										<th>사용처</th>
										<th>사용일</th>
										<th>부서</th>
										<th>직급</th>
										
									</tr>
								</thead>
								<tbody id="dynamicTbody">
									<!-- 반복시작 -->
										
									<c:forEach var="vo" items="${list }">
										
										<tr>
											<td>${vo.cardNo }</td>
											<td>${vo.name }</td>
											<td>${vo.accCode }</td>
											<td>${vo.price }</td>
											<td>${vo.usePlace }</td>
											<td>${vo.useDate } </td>
											<td>${vo.deptName }</td>
											<td>${vo.posName }</td>
															
										</tr>
									</c:forEach>
								</tbody>
						</table>
										
						</div>
					</div>		
				</form>
				
				
			</div>
		</div>
	</div>
</div>






<!-- /.container-fluid -->
<div></div>
<div></div>

<!-- End of Main Content -->

<jsp:include page="../inc/bottom.jsp" />

