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
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<style type="text/css">
body{overflow: hidden;}
#headerDiv{background-color: #4e73df; color:white;font-size: 1.3em;font-weight: 600;height: 40px;}
#headerDiv p{padding-left: 8px;padding-top: 8px;}
#formTable tr:first-of-type{background-color: #858796; color:white;}
#btForm{background-color: #4e73df; color:white;position: relative;left: 80%;}
#lastDiv{padding-left: 8px;}
</style>
<script type="text/javascript">
	$(function(){
		$('#btForm').click(function(){
			location.href="<c:url value='/payment/write/insertForm.do'/>";
		});
	});
</script>
</head>
<body>
<div id="bigDiv">
	<div id="headerDiv">
		<p>문서 양식 등록</p>
	</div>
	<div id="formlistDiv">
		<table class="table" id="formTable">
			<tr>
				<td>양식코드</td>
				<td>양식이름</td>
			</tr>
			<!-- 반복 시작 -->
			<c:forEach var="docformVo" items="${formlist }">
			<tr>
				<td>
					<label class="checkbox-inline">
						<input type="checkbox" id="inlineCheckbox1">${docformVo.formNo }
					</label>
				</td>
				<td>${docformVo.formName }</td>
			</tr>
			</c:forEach>
			<!-- 반복 끝 -->
		</table>
	</div>
	
	<div id="lastDiv"><hr>
		<button type="submit" class="btn btn-default" id="btDel">선택삭제</button>
		<button type="button" class="btn btn-default" id="btForm">등록</button>
	</div>
</div>
</body>
</html>