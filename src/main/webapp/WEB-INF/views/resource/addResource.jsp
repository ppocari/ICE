<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자원 등록</title>
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
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/divForm/divForm.css'/>"/>
  <script src="<c:url value = "/resources/vendor/jquery/jquery.min.js"/>"></script>
<script type="text/javascript">
$(function(){
	$('input[type=reset]').click(function(){
		self.close();
	});
	
	$('input[type=submit]').click(function(){
		var resName= $('input[name=resName]').val();
		var rkSelect= $('select[name=rkNo]').val();

		if(resName.length < 1) {
			alert('자원명을 입력하세요!');
			$('input[name=resName]').focus();
			event.preventDefault();
		}else if(rkSelect==0) {
			alert('종류를 선택하세요!');
			event.preventDefault();
		}
		
	});
		
});


</script>
<style type="text/css">

.divForm fieldset {
	width: 550px;
}

.divForm div {
	margin-left: 40px;
	width: 400px;
}

.divForm .firstDiv {
	border-top: 2px solid #e2e2e2;
}

article{
	font-size: 1.25em;
}

.la_left{
	width: 25%;
}


.col-xl-4{
	margin-top:10px;
}


</style>
</head>
<body>
<section>
	<article>

		<div class="col-xl-4 ">
			<div id="divMain" class="card shadow mb-4">
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">자원 예약 거절 사유</h6>
				</div>
				<div class="card-body">
					<div class="divForm">
						<form method="post" action="<c:url value='/resource/addResource.do'/>" enctype="multipart/form-data">
							<div>
								<label class="la_left">자원명</label> 
								<input style="width:200px" class="input_m borderStyle" type="text" name="resName"> 
							</div>
							<div>
								<label class="la_left">이미지 첨부</label>
								<input style="width:300px" type="file" name="upfile" id="upfile">
							</div>
							<div>
								<label class="la_left">종류</label>
								<select name="rkNo">
									<option value="0">전체</option>
									<c:forEach var="rk" items="${rkList }">
										<option value="${rk.rkNo }">${rk.rkKind }</option>
									</c:forEach>
								</select>
							</div>
							<div>
								<label class="la_left">장소</label>
								<input style="width:200px" class="borderStyle" type="text" name="resLocation">
							</div>
							<div>
								<label class="la_left">상세설명</label>
								<textarea class="borderStyle" rows="5" cols="30" name="resSubdesc"></textarea>
							</div>
							<div id="add_inputs">
								<input type="submit" value="등록"> 
								<input type="reset"	value="취소">
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</article>
</section>
</body>
</html>