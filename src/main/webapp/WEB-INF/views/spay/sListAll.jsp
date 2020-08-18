<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/inc/top.do"/> 
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
	function pageFunc(curPage){
		$('input[name=currentPage]').val(curPage);
		$("form[name=frmPage]").submit();
	}
</script>

<!-- 페이징 처리를 위한 form 시작-->
<form name="frmPage" method="post"
	action="<c:url value='/spay/sListAll.do'/>">
	<input type="hidden" name="startDay" value="${param.startDay }">
	<input type="hidden" name="endDay" value="${param.endDay }"> <input
		type="hidden" name="currentPage">
</form>
<!-- 페이징 처리 form 끝 -->

<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">식권구매</h1>
		<a href="<c:url value='/spay/excelDown.do?startDay=${param.startDay }&endDay=${param.endDay }'/>" 
			class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
			class="fas fa-download fa-sm text-white-50"></i> excel 파일 다운</a>
	</div>

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-12 ">
			<div class="card shadow mb-4" style="height: 500px">
				<!-- Card Header - Dropdown -->
				<form name="sListAllFrm" method="post"
					action="<c:url value='/spay/sListAll.do'/> ">
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">식권구매</h6>
						<div style="float: right">
							<button type="submit" class="btn btn-info">조회</button>
						</div>
					</div>
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<label for="department" style="margin-left: 10px;">구매 일자</label>
							<%@include file="../inc/dateTerm.jsp" %>
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
									<c:if test="${empty list }">
										<tr style="text-align: center;">
											<td colspan="5">주문 내역이 존재하지 않습니다.</td>
										</tr>
									</c:if>
									<c:if test="${!empty list }">
										<c:forEach var="vo" items="${list }">
											<tr>
												<td><fmt:formatDate value="${vo.TICREGDATE }"
														pattern="yyyy-MM-dd hh:mm:ss" /></td>
												<td>${vo.TICQUANTITY }</td>
												<td>${vo.NAME }</td>
												<c:if test="${empty vo.HP1}">
													<td></td>
												</c:if>
												<c:if test="${!empty vo.HP1}">
													<td>${vo.HP1}-${vo.HP2}-${vo.HP3}</td>
												</c:if>
												<td>${vo.EMAIL1}${vo.EMAIL2 }</td>
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
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:if test="${pagingInfo.firstPage>1 }">
				<li class="page-item disabled"><a class="page-link" href="#"
					onclick="pageFunc(${pagingInfo.firstPage-1})">previous</a></li>
			</c:if>

			<!-- [1][2][3][4][5][6][7][8][9][10] -->
			<c:forEach var="i" begin="${pagingInfo.firstPage }"
				end="${pagingInfo.lastPage }">
				<c:if test="${i==pagingInfo.currentPage }">
					<li class="page-item active"><a class="page-link" href="#">${i }
					</a></li>
				</c:if>
				<c:if test="${i!=pagingInfo.currentPage }">
					<li class="page-item"><a class="page-link" href="#"
						onclick="pageFunc(${i})">${i }</a></li>
				</c:if>
			</c:forEach>

			<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
				<li class="page-item"><a class="page-link" href="#"
					onclick="pageFunc(${pagingInfo.lastPage+1})">Next</a></li>
			</c:if>
			<!--  페이지 번호 끝 -->
		</ul>
	</nav>
</div>

<%@ include file="../inc/bottom.jsp"%>