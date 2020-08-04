<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../inc/top.jsp" />

<style>
.pwd-area label {
	width: 180px;
	margin-left: 540px;
}
</style>
<script type="text/javascript"
	src="<c:url value='/resources/js/mypage/member.js' />"></script>
<script type="text/javascript">
	$(function() {
		$('#pwd').keyup(function() {
			$.ajax({
				url:"<c:url value='/member/memCheck.do'/>", 
				type:"post",
				data:"pwd=" + pwd,
				success:function(res){
					
				},
				error:function(xhr, status, error){
					alert(status+","+error);
				}
				
			});
		});
		
		$('#pwd2').keyup(function() {
			
			if($('#pwd').val() != $('#pwd2').val()){
				$("#result_p").css("color", "red");
				$("#result_p").text("비밀번호가 일치 하지 않습니다");
			}else{
				$("#result_p").css("color", "green")
				$("#result_p").text("비밀번호가 일치합니다");
			}
		});

	});
</script>
<!-- Begin Page Content -->

<div class="container-fluid">

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-12 ">
			<div class="card shadow mb-4" style="height: 500px;">
				<!-- Card Header - Dropdown -->
				<form name="frm1" method="post"
					action="<c:url value='/member/memPwd.do'/>">
					<fieldset>
						<div>
							<label for="pwd">비밀번호</label> <input type="Password" name="pwd" id="pwd">
						</div>
						<div>
							<label for="pwd2">비밀번호 확인</label> <input type="Password"
								name="pwd2" id="pwd2">
						</div>
						<div id = "result">
							<p id = "result_p"> </p>
						</div>
						<div class="center">
							<input type="submit" id="wr_submit" value="비밀번호 설정">
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


