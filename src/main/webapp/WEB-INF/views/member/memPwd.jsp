<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/inc/top.do"></c:import>

<style>
.pwd-area label {
	width: 130px;
}

.pwd-area input {
	width: 220px;
}
</style>
<script type="text/javascript"
	src="<c:url value='/resources/js/mypage/member.js' />"></script>
<script type="text/javascript">
	$(function() {
		$('#pwd').keyup(function() {
			$.ajax({
				url : "<c:url value='/member/memCheck.do'/>",
				type : "post",
				data : "pwd=" + pwd,
				success : function(res) {

				},
				error : function(xhr, status, error) {
					alert(status + "," + error);
				}

			});
		});

		$('#pwd2').keyup(function() {

			if ($('#pwd').val() != $('#pwd2').val()) {
				$("#result_p").css("color", "red");
				$("#result_p").text("비밀번호가 일치 하지 않습니다");
			} else {
				$("#result_p").css("color", "green")
				$("#result_p").text("비밀번호가 일치합니다");
			}
		});
		
		/* var pwd = $('#pwd').val();
		var pwd2 = $('#pwd2').val();
		if(pwd != pwd2){
			alert("비밀번호가 일치 하지 않습니다.")
			event.preventDefault();
		} */

	});
</script>
<!-- Begin Page Content -->

<div class="container-fluid">

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-10 ">
			<div class="card shadow mb-4" style="height: fit-content;">
				<!-- Card Header - Dropdown -->
				<form name="frm1" method="post"
					action="<c:url value='/member/memPwd.do'/>">
					<fieldset >
						<div style="float: left;  margin-left: 10%; " >
							<div style="float: left; ">
								<img alt="i.c.e. logo"
									src="<c:url value = '/resources/img/ICElogo2.png'/>"
									style="width: 600px; height: 600px;">
							</div>
							<div style="float: right; margin-top:200px; ">
								<div class="pwd-area">
									<label for="pwd">비밀번호</label> <input type="Password" name="pwd"
										id="pwd">
								</div>
								<div class="pwd-area">
									<label for="pwd2">비밀번호 확인</label> <input type="Password"
										name="pwd2" id="pwd2">
								</div>
								<div id="result">
									<p id="result_p" style="text-align: right"></p>
								</div>
								<div class="align_right" style="text-align: right">
									<input type="submit" id="wr_submit" value="비밀번호 설정">
								</div>
							</div>
						</div>
					</fieldset>
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


