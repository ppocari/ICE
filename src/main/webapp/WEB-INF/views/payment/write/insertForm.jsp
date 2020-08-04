<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICE</title>
<script src="<c:url value = "/resources/vendor/jquery/jquery.min.js"/>"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/payment/payment.css'/>">
<style type="text/css">
#IF{overflow: hidden;}
#IFformNo,#IFformName{width:200px;}
#IFheaderDiv{background-color: #4e73df; color:white;font-size: 1.3em;font-weight: 600;height: 40px;}
#IFheaderDiv p{padding-left: 8px;padding-top: 8px;}
#IFbtwriteForm{background-color: #4e73df; color:white;}
#IFsummerDiv{padding-top: 10px;padding-bottom: 10px;}
#IFformDiv{border: 1px solid #dedede; width: 95%; padding: 10px 10px 10px 10px;margin-left: 18px;margin-top: 8px;text-align: center;}
</style>
<script type="text/javascript">
window.onload = function() {
	window.resizeTo(790, 700);
}
</script>
</head>
<body id="IF">
	<div id="bigDiv">
		<div id="IFheaderDiv">
			<p>문서 양식 등록</p>
		</div>
		<div id="IFformDiv">
			<form class="form-inline" method="post" name="formInfoFrm"
				action="<c:url value='/payment/write/insertForm.do'/>">
				<div class="form-group">
					<label for="formNo">양식코드</label> 
					<input type="text" class="form-control" id="IFformNo" readonly="readonly">
				</div>
				<div class="form-group">
					<label for="formName">양식이름</label> 
					<input type="text" class="form-control" id="IFformName" name="formName">
				</div><br>
				<div class="form-group" id="IFsummerDiv">
					<%@include file="../summer.jsp" %>
				</div>
				<div id="lastDiv">
					<button type="submit" class="btn btn-default" id="IFbtwriteForm">저장</button>
				</div>
			</form>
		</div>

	</div>
</body>
</html>