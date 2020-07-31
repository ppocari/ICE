<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICE</title>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.5.1.min.js'/> "></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<style type="text/css">
body{overflow: hidden;}
#cancelBt{background-color: #4e73df; color:white;}
#headerDiv{background-color: #4e73df; color:white;font-size: 1.3em;font-weight: 600;height: 40px;}
#headerDiv p{padding-left: 8px;padding-top: 8px;}
#docTable{text-align: center;height: 790px;}
#docType{font-size: 1.5em;font-weight: 600;}
#title,#content{text-align: left;}
#content{height: 50%;}
#lastDiv{position: relative;left: 88%;}
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
				<td rowspan="2" colspan="5"></td>
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
		<button type="button" class="btn btn-default" id="cancelBt" onclick="location.href='<c:url value="/payment/deletePayline.do?docNo=${payVo.docNo }"/>'">
			결재상신 취소
		</button>
	</div>
</div>
</body>
</html>