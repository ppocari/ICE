<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자원예약 거절사유 자세히 보기</title>
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
  <script src="<c:url value = "/resources/js/demo/chart-pie-demo.js"/>"></script>  --%>


<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css"/>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
	$('#btClose').click(function(){
		self.close();
	});
	
});
</script>
<style type="text/css">
	.card-body{
		text-align: center;
	}
	
	#btClose{
		border: 1px solid lightgray;
	}
	
	#divMain{
		margin:5px;
		margin-top: 10px;
	}
</style>
</head>
<body>
	<section>
		<article>
			<div class="col-xl-2 ">
				<div id="divMain" class="card shadow mb-4">
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">자원 예약 거절 사유</h6>
					</div>
					<div class="card-body">
						<div>
							<c:if test="${!empty rsVo }">
								${rsVo.rvCantReason }
							</c:if>
						</div>
						<br>
						<div><button id="btClose">닫기</button></div>
					</div>
				</div>
			</div>
		</article>
	</section>
</body>
</html>