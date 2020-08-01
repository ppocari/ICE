<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- Custom fonts for this template-->
<link
	href="<c:url value="/resources/vendor/fontawesome-free/css/all.min.css"/>"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="<c:url value="/resources/css/sb-admin-2.min.css"/>"
	rel="stylesheet">
<!-- Bootstrap core JavaScript-->
 
  <script src="<c:url value = "/resources/vendor/jquery/jquery.min.js"/>"></script>
  <script src="<c:url value = "/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

  <!-- Core plugin JavaScript-->
  <script src="<c:url value = "/resources/vendor/jquery-easing/jquery.easing.min.js"/>"></script>

  <!-- Custom scripts for all pages-->
  <script src="<c:url value = "/resources/js/sb-admin-2.min.js"/>"></script>

 <%--  <!-- Page level plugins -->
  <script src="<c:url value = "/resources/vendor/chart.js/Chart.min.js"/>"></script>

  <!-- Page level custom scripts -->
  <script src="<c:url value = "/resources/js/demo/chart-area-demo.js"/>"></script>
  <script src="<c:url value = "/resources/js/demo/chart-pie-demo.js"/>"></script> --%>


<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script> 
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script> 

<style type="text/css">
	#registerTableTR td{
		width: 120px;
	}
	
	.registerTableTR input {
	
	width: 110px;
	
}
</style>

<script>
	$(function(){
		$( "input[name=hiredate]" ).datepicker({
			dateFormat:'yy-mm-dd',
	         changeYear:true,
	         dayNamesMin:['일','월','화','수','목','금','토'],
	         monthNames:['1월','2월','3월','4월','5월','6월',
	            '7월','8월','9월','10월','11월','12월']
		} );
		
		$("#del_mem").click(function(){
			var del_memeNo = $(this).val();
			alert("정말로 삭제하시겠습니까?");
			location.href = "/ice/member/memDelete.do?memNo="+del_memeNo;
		});
	});
</script>
<!-- Begin Page Content -->

<div class="container-fluid">

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-12 " >
			<div class="card shadow mb-4" style="height: 300px">
				<!-- Card Header - Dropdown -->
				<!-- 페이징 처리를 위한 form 시작-->
				<!-- 페이징 처리 form 끝 -->
				
				<form name="memEditFrm" method="post"  
					action="<c:url value='/member/memEdit.do'/> ">
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">수정하기</h6>
						
						<div style="float: right">
							<button type="submit" class="btn btn-info">수정하기</button>
							<button type="button" id = "del_mem" value="${vo.memNo }" class="btn btn-danger">삭제하기</button>
							
						</div>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div class="chart-area" >
							<table class="table table-bordered table-hover" id="dynamicTable">
								<thead>
									<tr>
										<th>사원번호</th>
										<th>이름</th>
										<th>비밀번호</th>
										<th>입사일</th>
										<th>부서명</th>
										<th>직급</th>
										<th>계약연봉</th>
									</tr>
								</thead>
								<tbody id="dynamicTbody">
									<!-- 반복시작 -->
										<tr class="registerTableTR">
											<td><input value="${vo.memNo }" name ="memNo" readonly="readonly"></td>
											<td><input value="${vo.name }" name ="name" ></td>
											<td><input value="${vo.pwd }" name ="pwd" readonly="readonly"></td>
											<td>
												 <c:set var = "hiredate" value = "${fn:substring(vo.hiredate,0,10)}" />
												<input value="${ hiredate }" name="hiredate">
												
											</td>
											<td>
												<select name="deptCode">
													<!-- option 반복 -->
													<option>전체</option>
													<c:forEach var="deptvo" items="${deptList }">
														<option value="${deptvo.deptCode }"
															<c:if test="${ vo.deptName == deptvo.deptName}">
																selected="selected"
															</c:if>
														>${deptvo.deptName }</option>
													</c:forEach>
												</select>
											</td>
											<td>
												<select name="posCode">
													<!-- option 반복 -->
													<option>전체</option>
													<c:forEach var="posvo" items="${posList }">
														<option value="${posvo.posCode }"
															<c:if test="${ vo.posName == posvo.posName}">
																selected="selected"
															</c:if>
														>${posvo.posName }
														 </option>
													</c:forEach>
												</select>
											</td>
											<td><input value="<fmt:formatNumber value="${vo.salary }"  pattern="" />" name ="salary" >만원</td>										
										</tr>
									
								</tbody>
						</table>
										
						</div>
					</div>		
				</form>
				
				
			</div>
		</div>
	</div>
</div>
