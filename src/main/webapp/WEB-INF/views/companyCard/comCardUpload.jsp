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
		$("#excelUpForm").change(function(){
		                var form = $("#excelUpForm")[0];
		 
		                var data = new FormData(form);
		                $.ajax({
		                   enctype:"multipart/form-data",
		                   method:"POST",
		                   url: './excelUp.do',
		                   processData: false,   
		                   contentType: false,
		                   cache: false,
		                   data: data,
		                   success: function(result){  
		                       alert("업로드 성공!!");
		                   }
		                });
		            });


		
		
		
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
				엑셀업로드 : <br/>
				<form name="excelUpForm" id="excelUpForm" enctype="multipart/form-data" method="POST" action="./excelDown.do">
				    <input type="file" id="excelFile" name="excleFile" value="엑셀 업로드" />
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

