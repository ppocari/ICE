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
<script type="text/javascript">
	
</script>
<body>
	<!-- Begin Page Content -->

<div class="container-fluid">

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-3" style="margin-top: 30px;">
			<div class="card shadow mb-4" style="height: 380px;">
				<!-- Card Header - Dropdown -->
				<form name="memRegisterFrm" method="post" action="<c:url value='/message/msgWrite.do' />">
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">보낸 쪽지 내용</h6>
						
						<input type="hidden" value="${msgvo.recMemNo }" name="recMemNo">
					</div>
					
					<!-- Card Body -->
					<div class="card-body" style="text-align: center">
						<textarea style="width: 98%;  height: 280px;" readonly="readonly" id="msgContent" name="msgContent">${msgvo.msgContent }</textarea>
					</div>
						
				</form>


			</div>
		</div>
	</div>
</div>
	
</body>
</html>