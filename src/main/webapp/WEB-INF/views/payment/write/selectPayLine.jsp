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
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/payment/payment.css'/>">
<style type="text/css">body{overflow: hidden;}</style>
<script type="text/javascript">
	$(function(){
		$('form[name=lineFrm]').submit(function(){
			$('.chk:checked').parent().next().next().next().find('input[name=getmemNo]').attr("disabled", false);
			
			if(!$('.chk').is(':checked')){
				alert("결재선을 선택해주세요!");
				event.preventDefault();
				$('#emplist').focus();
			}
		});
		
		window.resizeTo(1000,450);
	});
	
</script>
</head>
<body>
	<div id="paylinebigDiv">
		<div id="paylineheaderDiv">
			<p>결재선 지정하기</p>
		</div>
		<div id="paylineformDiv">
			<form class="form-inline" method="post" name="lineFrm" 
				<c:if test="${update==1 }">
					action="<c:url value='/payment/write/updatePayLine.do' />"
				</c:if>
				<c:if test="${update==0 }">
					action="<c:url value='/payment/write/selectPayLine.do' />"
				</c:if>
				>
				<input type="hidden" id="writememNo" name="writememNo" value="${pldVo.writememNo }">
				<c:if test="${update==1 }">
					<input type="hidden" id="writedocNo" name="docNo" value="${pldVo.docNo }">
				</c:if>
				<input type="hidden" id="formNo" name="formNo" value="${pldVo.formNo }">
				<input type="hidden" id="typeNo" name="typeNo" value="${pldVo.typeNo }">
				<input type="hidden" id="title" name="title" value="${pldVo.title }">
				<textarea id="content" name="content" hidden="hidden">${pldVo.content }</textarea>
				<input type="hidden" id="keep" name="keep" value="${pldVo.keep }">
				<input type="hidden" id="imsy" name="imsy" value="${pldVo.imsy }">
				<input type="hidden" id="progress" name="progress" value="${pldVo.progress }">
				<input type="hidden" id="oldfileName" name="oldfileName2" value="${oldfileName }">
			
				<c:set var="idx" value="0"/>
				<c:forEach var="fListVo" items="${fileListDB }">
					<input type="hidden" id="oldfileName" name="oldfileName" value="${fListVo.fileName }">
					<input type="hidden" name="fileItems[${idx }].fileName" value="${fListVo.fileName }">
					<input type="hidden" name="fileItems[${idx }].fileSize" value="${fListVo.fileSize }">
					<input type="hidden" name="fileItems[${idx }].originalFileName" value="${fListVo.originalFileName }">
					<c:set var="idx" value="${idx+1 }"/>
				</c:forEach>
				<div class="form-group">
					<label for="deptName">부서</label> 
						<input type="text" class="form-control" id="deptName">
				</div>
				<div class="form-group">
					<label for="name">성명</label> 
						<input type="text" class="form-control" id="name">
				</div><br>
				<div class="form-group" id="empListDiv" style="height:200px; overflow: auto;">
					<table id="empList" class="table-hover">
						<tr>
							<th width="10%"></th>
							<th width="20%">부서</th>
							<th width="10%">직급</th>
							<th width="30%">사원코드</th>
							<th width="30%">사원명</th>
						</tr>
						<!-- 반복시작 -->
						<c:forEach var="memVo" items="${memlist }">
							<tr>
								<td>
									<input type="checkbox" class="chk" name="chkbox">
								</td>
								<td>${memVo.deptName }</td>
								<td>${memVo.posName }</td>
								<td>
									${memVo.memNo }
									<input type="hidden" name="getmemNo" value="${memVo.memNo }" disabled="disabled">
								</td>
								<td>${memVo.name }</td>
							</tr>
						</c:forEach>
						<!-- 반복끝 -->
					</table>
				</div><br>
				<div id="payline3">
					<button type="submit" class="btn btn-default" id="btSavePayLine">저장</button>
					<button type="button" class="btn btn-default" id="btCancel"
						onclick="<c:url value='/payment/close.do' />">취소</button>
				</div>
			</form>
		</div>

	</div>
</body>
</html>