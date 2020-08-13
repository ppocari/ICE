<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../inc/top.jsp" />

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
								<div class="area">
									<label for="memNo">사원번호</label> <input type="text" name="memNo"
										id="memNo">
								</div>
								<div class="area">
									<label for="email">이메일</label> <input type="text"
										name="email" id="email">
								</div>

								<div class="align_right" style="text-align: right">
									<input type="submit" id="wr_submit" value="비밀번호 찾기">
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


