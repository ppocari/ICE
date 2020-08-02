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
.search input{
	width:150px;
}


</style>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function(){
		

	});
	
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

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-12 " >
			<div class="card shadow mb-4" style="height: 500px">
				<!-- Card Header - Dropdown -->
				<!-- Card Header - Dropdown -->
				<form id="massiveForm" name="massiveForm" enctype="multipart/form-data" method="post" action="<c:url value="/board/massiveWrite"/>" >
        <input type="file" name="excelFile"/>
        <input type="submit" value="업로드"/> 
    </form>


				
				<form name="memRegisterFrm" method="post"  
				action="<c:url value='/member/memList.do?searchKeyWord=all'/> ">
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">파일 목록</h6>
						<div style="float: right">
							<button type="submit" class="btn btn-info"
							 >파일 업로드</button>
						</div>
						
					</div>		
					<!-- Card Body -->
					<div class="card-body">
						<div class="chart-area" style="overflow: scroll;">

										
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

