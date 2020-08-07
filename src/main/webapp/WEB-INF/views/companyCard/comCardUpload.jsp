<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

.search input {
	width: 150px;
}
</style>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="http://malsup.github.com/jquery.form.js"></script>
<script type="text/javascript">

</script>
<!-- Begin Page Content -->

<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">파일 업로드</h1>

		<a href="#"
			class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
			class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
	</div>

	<!-- Content Row -->
	<!-- https://shinsunyoung.tistory.com/71 -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-12 " >
			<div class="card shadow mb-4" style="height: 500px">
				<!-- Card Header - Dropdown -->
				<form name="memRegisterFrm" method="post"  
				action="<c:url value='/excel.do'/> ">
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">파일 업로드</h6>
						<div style="float: right">
							<button type="submit" class="btn btn-info">파일 불러오기</button>
							<input type="button" class="btn btn-info" value="사용내역 업로드">
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

