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
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<style type="text/css">
	body{overflow: hidden;}#cancelBt,#acceptBt{background-color: #4e73df; color:white;position:relative;left:80px;}#headerDiv{background-color: #4e73df; color:white;font-size: 1.3em;font-weight: 600;height: 40px;}#headerDiv p{padding-left: 8px;padding-top: 8px;}#docTable{text-align: center;height: 790px;}#docType{font-size: 1.5em;font-weight: 600;}#title,#content{text-align: left;}#content{height: 50%;}#comment{width:400px;}
</style>
</head>
<body>
<div id="bigDiv">
	<div id="headerDiv">
		<p>문서보기</p>
	</div>
	<div id="tableDiv">
		<table id="docTable" class="table table-bordered">
			<tr>
				<td rowspan="2" colspan="6" id="docType">${payVo.typeName }</td>
				<td>문서번호</td>
				<td>${payVo.docNo }</td>
			</tr>
			<tr>
				<td>보존연한</td>
				<td><fmt:formatNumber value="${payVo.keep/12 }" pattern="#"/>년</td>
			</tr>
			<tr height="10">
				<td>기안부서</td>
				<td>영업팀</td>
				<td rowspan="3" width="15">기안부서</td>
				<c:forEach var="vo" items="${plList }">
					<td>결재</td>
				</c:forEach>
			</tr>
			
			<tr height="80">
				<td rowspan="2">기안자</td>
					<td rowspan="2">${payVo.name }</td>
				<c:forEach var="vo" items="${plList }">
					<td>${vo.payDate }</td>
				</c:forEach>
			</tr>
			<tr height="10">
				<c:forEach var="vo" items="${plList }">
					<td>${vo.deptName } ${vo.posName } ${vo.name }</td>
				</c:forEach>
			</tr>
			<tr height="10">
				<td rowspan="2">기안일자</td>
				<td rowspan="2">${payVo.writedate }</td>
				<td rowspan="2" width="15">첨부파일</td>
				<td rowspan="2" colspan="5">
					<c:if test="${!empty fileVo.fileName }">
						<a href="<c:url value='/payment/download.do?docNo=${fileVo.docNo }&fileName=${fileVo.fileName }' />" 
							id="fileName" style="position: relative;top: 30px;">
							${fileVo.originalFileName} (<fmt:formatNumber value="${fileVo.fileSize/1024}" pattern="###.#"/>KB)
						</a>
					</c:if>
				</td>
			</tr>
			<tr height="10">
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="7" id="title">${payVo.title }</td>
			</tr>
			<tr>
				<td colspan="8" id="content">${payVo.content }</td>
			</tr>
		</table>
	</div>
	<div id="lastDiv">
		<form class="form-inline" name="confirmFrm" method="post" enctype="multipart/form-data">
			<div class="form-group" id="commentDiv">&nbsp;
				의견&nbsp;<input type="text" id="comment" name="content" class="form-control">&nbsp;
				서명 첨부&nbsp;<input type="file" class="form-control" name="upfile">
				<input type="hidden" name="docNo" value="${payVo.docNo }">
			</div>
			<button type="submit" class="btn btn-default" id="cancelBt"
				formaction="<c:url value='/payment/reject.do' />">반려</button>
			<button type="submit" class="btn btn-default" id="acceptBt"
				formaction="<c:url value='/payment/approve.do' />">승인</button>
		</form>
	</div>
</div>
</body>
</html>