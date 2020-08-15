<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICE</title>
<script src="<c:url value = "/resources/vendor/jquery/jquery.min.js"/>"></script>
<script src="<c:url value = "/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<style type="text/css">
	#CDV{overflow: hidden;}.center{text-align: center;background-color: #f8f9fc;}#docType{font-weight: 600;text-align: center;}.card-header {padding: .75rem 1.25rem;margin-bottom: 0;background-color: #f8f9fc;border-bottom: 1px solid #e3e6f0;}div#tableDiv table {float: left;}#paylineTable table:first-of-type{margin-right: 20px;}
</style>
</head>
<body id="CDV">
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
							<c:if test="${!empty plList2}">
							<c:if test="${!empty vo.payDate}">
								<c:forEach var="vo2" items="${plList2 }">
								<td>
									<img alt="서명" src="<c:url value='/sign_file/${vo2.signName }'/>" width="60%">
								</td>
								</c:forEach>
							</c:if>
							<c:if test="${empty vo.payDate}">
								<td>
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
	<div id="CDVlastDiv">
			<c:if test="${!empty fileVo.fileName }">&nbsp;&nbsp;&nbsp;
				<a href="<c:url value='/payment/download.do?docNo=${fileVo.docNo }&fileName=${fileVo.fileName }' />" 
					id="fileName">
					${fileVo.originalFileName} (<fmt:formatNumber value="${fileVo.fileSize/1024}" pattern="###.#"/>KB)
				</a>
			</c:if>
		<c:if test="${param.flag=='imsy'}">
			<button type="button" class="btn btn-default" id="cancelBt" onclick="location.href='<c:url value="/payment/write/editPayment.do?docNo=${payVo.docNo }"/>'" style="position: relative; right: -72%;top:-7px;background-color: #4e73df; color:white;">
				결재선 지정
			</button>
		</c:if>
		<c:if test="${param.flag!='imsy'}">
			<button type="button" class="btn btn-default" id="CDVcancelBt" onclick="location.href='<c:url value="/payment/deletePayline.do?docNo=${payVo.docNo }"/>'" style="position: relative; right: -72%;top:-7px;background-color: #4e73df; color:white;">
				결재상신 취소
			</button>
		</c:if>
	</div>
	</div>
	</div>
</div>
</body>
</html>