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
	width: 100px;
}
</style>
<script type="text/javascript">
	
</script>
<!-- Begin Page Content -->

<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">사원등록</h1>

		<a href="#"
			class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
			class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
	</div>

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-12 ">
			<div class="card shadow mb-4" style="height: 500px;">
				<!-- Card Header - Dropdown -->
				<form name="frm" action="<c:url value ='/member/memWrite.do'/>"
					method="post">

					<input type="text"  name="memNo"> 
					<input type="text"  name="pwd"> 
					<input type=text name="name" /> 
					<input type=text name="deptCode"  />
					<input type=text name="posCode" />
					<input type=text name="hiredate"  />
					<input type=text name="salary"  /> 
					


					<input type="submit" value="전송"> 
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

