<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICE</title>
<script src="<c:url value = "/resources/vendor/jquery/jquery.min.js"/>"></script>
<style type="text/css">
body{overflow: hidden;}
#formNo,#formName{width:200px;}
#headerDiv{background-color: #4e73df; color:white;font-size: 1.3em;font-weight: 600;height: 40px;}
#headerDiv p{padding-left: 8px;padding-top: 8px;}
#btwriteForm{background-color: #4e73df; color:white;}
#summerDiv{padding-top: 10px;padding-bottom: 10px;}
#formDiv{border: 1px solid #dedede; width: 95%; padding: 10px 10px 10px 10px;margin-left: 18px;margin-top: 8px;text-align: center;}
</style>

</head>
<body>
	<div id="bigDiv">
		<div id="headerDiv">
			<p>문서 양식 등록</p>
		</div>
		<div id="formDiv">
			<form class="form-inline" method="post" name="formInfoFrm"
				action="<c:url value='/payment/write/insertForm.do'/>">
				<div class="form-group">
					<label for="formNo">양식코드</label> 
					<input type="text" class="form-control" id="formNo" readonly="readonly">
				</div>
				<div class="form-group">
					<label for="formName">양식이름</label> 
					<input type="text" class="form-control" id="formName" name="formName">
				</div><br>
				<div class="form-group" id="summerDiv">
					<%@include file="../summer.jsp" %>
				</div>
				<div id="lastDiv">
					<button type="submit" class="btn btn-default" id="btwriteForm">저장</button>
				</div>
			</form>
		</div>

	</div>
</body>
</html>