<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/inc/top.do"></c:import>

<script type="text/javascript">
	$(function(){
		var memNo = $("#openAddrMsg_memNo").val();
		$("#openAddrMsg").click(function(){
			
			console.log(memNo);
			window.open('/ice/message/msgAddr.do?memNo='+memNo,'mem',
			'width=650,height=550,left=50,top=50,location=yes,resizable=yes');			
		});
		
	
		
		
		
		
	});
</script>

<!-- Begin Page Content -->

<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">쪽지</h1>

		<a href="#"
			class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
			class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
	</div>

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-6 ">
			<div class="card shadow mb-4" style="height: 500px;">
				<!-- Card Header - Dropdown -->
				<form name="memRegisterFrm" method="post" action="<c:url value='/message/msgWrite_send.do' />">
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">주소록</h6>
						
					</div>
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<div>
							<button type="submit" class="btn btn-primary" id = "sengMsg">보내기 </button>
							<!-- <input type="button" class="btn btn-info" id = "openWinMsg" value="새창"> -->
						</div>
						<hr>
						<div>
							<label for="recMemNo">받는 사람</label>
							<!-- <input name="reciMsgMe" id="reciMsgMe" type="checkbox">
							<label for="reciMsgMe">내게 쓰기</label> -->
							<input type="text" id="recMemNo" name="recMemNo" style="width: 280px;"  placeholder="여러 명은 쉼표(,) 또는 세미콜론(;) 구분 (최대 10 명)"
							value="${param.memNo }">
							<input type="button" class="btn btn-success"  id = "openAddrMsg" value="주소록">
							<input type="hidden" id = "openAddrMsg_memNo" name = "sendMemNo" value="${sessionScope.identNum }">
						</div>
					</div>
					<!-- Card Body -->
					<div class="card-body" style="text-align: center">
						<textarea style="width: 98%;  height: 320px;" id="msgContent" name="msgContent"></textarea>
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

