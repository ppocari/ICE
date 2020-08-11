<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../inc/all_css_js.jsp" %>
  
</head>
<body>
	<!-- Begin Page Content -->

<div class="container-fluid">

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-6 " style="margin-top: 30px;">
			<div class="card shadow mb-4" style="height: 500px;">
				<!-- Card Header - Dropdown -->
				<form name="memRegisterFrm" method="post" action="<c:url value='/member/memWrite.do' />">
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">쪽지 쓰기</h6>
						
					</div>
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<div>
							<button type="submit" class="btn btn-primary" id = "sengMsg">보내기 </button>
							<input type="button" class="btn btn-info" id = "openWinMsg" value="새창">
						</div>
						<hr>
						<div>
							<label for="reciMsgPeop">받는 사람</label>
							<input name="reciMsgMe" id="reciMsgMe" type="checkbox">
							<label for="reciMsgMe">내게 쓰기</label>
							<input type="text" id="reciMsgPeop" name="reciMsgPeop" style="width: 280px;"  placeholder="여러 명은 쉼표(,) 또는 세미콜론(;) 구분 (최대 10 명)">
							<input type="button" class="btn btn-success"  id = "openAddrMsg" value="주소록">
							<input type="hidden" id = "openAddrMsg_memNo" name = "memNo" value="${sessionScope.identNum }">
						</div>
					</div>
					<!-- Card Body -->
					<div class="card-body" style="text-align: center">
						<textarea style="width: 98%;  height: 320px;">
						
						</textarea>
					</div>
						
				</form>


			</div>
		</div>
	</div>
</div>
	
</body>
</html>