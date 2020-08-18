<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/inc/top.do"></c:import>

<style>
.table td {
	width: 90px;
}

.table .registerTable {
	
	width: 110px;
	border: 1px solid white;
}


.search input{
	width:150px;
}


</style>
<script type="text/javascript">
	
	$(function(){
		
		
		$( "input[name=hiredate1]" ).datepicker({
			dateFormat:'yy-mm-dd',
	         changeYear:true,
	         changeMonth:true,
	         dayNamesMin:['일','월','화','수','목','금','토'],
	         monthNames:['1월','2월','3월','4월','5월','6월',
	            '7월','8월','9월','10월','11월','12월']
		} );
		
		$( "input[name=hiredate2]" ).datepicker({
			dateFormat:'yy-mm-dd',
	         changeYear:true,
	         changeMonth:true,
	         dayNamesMin:['일','월','화','수','목','금','토'],
	         monthNames:['1월','2월','3월','4월','5월','6월',
	            '7월','8월','9월','10월','11월','12월']
		} );
		
		
		$("#dynamicTbody tr").click(function(){
			var edit_memNo = $(this).children().eq(0).text();
			window.open('/ice/member/memEdit.do?memeNo='+edit_memNo,'mem',
			'width=1400,height=300,left=50,top=50,location=yes,resizable=yes');
		});
		 
		
	});
	
</script>
<!-- Begin Page Content -->

<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">사원조회</h1>

		
	</div>

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-12 " >
			<div class="card shadow mb-4" style="height: fit-content;">
				<!-- Card Header - Dropdown -->
				<!-- 페이징 처리를 위한 form 시작-->
				<form name="frmPage" method="post" 
					action="<c:url value='/member/memList.do'/>">
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">검색하기</h6>
						
						<div style="float: right">
							<button type="submit" class="btn btn-info"
							 >조회</button>
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
							<label for="hiredate1" style="margin-right: 20px;">입사일별</label>
							<input type="text" name="hiredate1" value="${dpdvo.hiredate1  }"> ~
							<input type="text" name="hiredate2" value="${dpdvo.hiredate2  }">
						</div>
					
					</div>
				
				<!-- 페이징 처리 form 끝 -->
			
					<!-- Card Body -->
					<div class="card-body">
						<div  style="overflow: scroll; overflow-x: scroll; height: 570px;">


							<table class="table table-bordered table-hover" id="dynamicTable">
								<thead>
									<tr>
										<th>사원번호</th>
										<th>이름</th>
										<th>입사일</th>
										<th>부서명</th>
										<th>직급</th>
										<th>계약연봉</th>
										
									</tr>
								</thead>
								<tbody id="dynamicTbody">
									<!-- 반복시작 -->
									
									<c:set var="i" value="${1 }" />	
									<c:forEach var="vo" items="${list }">
										<tr id = "edit_tr${i}">
											<td id = "edit_td${i}">${vo.memNo }</td>
											<td>${vo.name }</td>
											<td>
												 <c:set var = "hiredate"  value = "${fn:substring(vo.hiredate,0,10)}" />
												${ hiredate }
											</td>
											<td>${vo.deptName }</td>
											<td>${vo.posName }</td>
											<td><fmt:formatNumber value="${vo.salary }" pattern="#,###"/>만원</td>											
										</tr>
										<c:set var="i" value="${i+1 }" />	
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

