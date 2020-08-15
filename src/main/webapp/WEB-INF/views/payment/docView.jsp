<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICE</title>
<script src="<c:url value = "/resources/vendor/jquery/jquery.min.js"/>"></script>
<script src="<c:url value = "/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<style type="text/css">
	body{overflow-x: hidden;}#cancelBt,#acceptBt{background-color: #4e73df; color:white;position:relative;left:80px;}#headerDiv{background-color: #4e73df; color:white;font-size: 1.3em;font-weight: 600;height: 40px;}#headerDiv p{padding-left: 8px;padding-top: 8px;}#docType{font-weight: 600;text-align: center;}#title,#content{text-align: left;}#content{height: 50%;}#comment{width:400px;}.center{text-align: center;background-color: #f8f9fc;}div#tableDiv table {float: left;}#paylineTable table:first-of-type{margin-right: 20px;}
</style>
<script type="text/javascript">
	function checkReject(){
		if($('#comment').val().length<1){
			alert("의견을 작성해주세요!");
			event.preventDefault();
			$('#comment').focus();
		}
	}
	function checkApprove(){
		if($('#comment').val().length<1){
			alert("의견을 작성해주세요!");
			event.preventDefault();
			$('#comment').focus();
		}else if($('#signfile').val().length<1){
			alert("서명을 등록해주세요!");
			event.preventDefault();
			$('#signfile').focus();
		}
	}
</script>
</head>
<body>
<div class="row" style="padding-left: 15px;">
	<!-- Area Chart -->
	<div class="col-xl-12 ">
	<div class="card shadow mb-4" style="height:fit-content;width: 99%;">
	<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
		<h6 class="m-0 font-weight-bold text-primary">문서보기</h6>
	</div>
	<div id="tableDiv">
		<h3 id="docType">${payVo.typeName}</h3>
		<div>
			<table id="docTable" class="table table-bordered" style="width: 30%;margin-left: 20px;">
				<tr>
					<td class="center">기안자</td>
					<td>${payVo.name }</td>
				</tr>
				<tr>
					<td class="center">소속</td>
					<td>${payVo.deptName }</td>
				</tr>
				<tr>
					<td class="center">기안일</td>
					<td>${payVo.writedate }</td>
				</tr>
				<tr>
					<td class="center">문서번호</td>
					<td>${payVo.docNo}</td>
				</tr>
			</table>
		</div>
		
		<div id="paylineTable">
			<c:forEach var="vo" items="${plList }">
				<table class="table table-bordered" style="width: 15%;float: right;">
						<tr>
							<td rowspan="3" width=8%; class="center">결재</td>
							<td>${vo.posName }</td>
						</tr>
						<tr>
							<c:if test="${!empty comVo}">
							<c:if test="${!empty vo.payDate}">
								<td>
								<c:forEach var="vo2" items="${comVo }">
									<c:if test="${!empty vo2.signName}">
									<c:if test="${vo.memNo == vo2.memNo}">
										<img alt="서명" src="<c:url value='/sign_file/${vo2.signName }'/>" width="60%">
									</c:if>
									</c:if>
									<c:if test="${empty vo2.signName}">
										반려
									</c:if>
								</c:forEach>
								</td>
							</c:if>
							</c:if>
							<c:if test="${empty plList2 }">
								<td></td>
							</c:if>
						</tr>
						<tr>
							<td>${vo.name }</td>
						</tr>
				</table>
			</c:forEach>
		</div>
		<div>
			<table class="table table-bordered" style="width: 96%;margin-left: 20px;">
				<tr>
					<td width="10%" class="center">제목</td>
					<td>${payVo.title }</td>
				</tr>
				<tr>
					<td colspan="2" style="height: 500px;">${payVo.content}</td>
				</tr>
				
			</table>
		</div>
	</div>
	<c:if test="${!empty fileVo.fileName }">&nbsp;&nbsp;&nbsp;
		<a href="<c:url value='/payment/download.do?docNo=${fileVo.docNo }&fileName=${fileVo.fileName }' />" 
			id="fileName" style="margin-left: 2%;">
			${fileVo.originalFileName} (<fmt:formatNumber value="${fileVo.fileSize/1024}" pattern="###.#"/>KB)
		</a>
	</c:if>
	<div id="lastDiv" class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
		<form class="form-inline" name="confirmFrm" method="post" enctype="multipart/form-data">
			<div class="form-group" id="commentDiv">&nbsp;
				의견&nbsp;<input type="text" id="comment" name="content" class="form-control">&nbsp;
				서명 첨부&nbsp;<input type="file" class="form-control" name="upfile" id="signfile">
				<input type="hidden" name="docNo" value="${payVo.docNo }">
			</div>
			<button type="submit" class="btn btn-default" id="cancelBt" onclick="checkReject()"
				formaction="<c:url value='/payment/reject.do' />" value="reject" style="margin-left: 98px;">반려</button>
			<button type="submit" class="btn btn-default" id="acceptBt" onclick="checkApprove()"
				formaction="<c:url value='/payment/approve.do' />" value="approve" style="margin-left: 10px;">승인</button>
		</form>
	</div>
	</div>
	</div>
</div>
</body>
</html>