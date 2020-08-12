<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자원관리 수정 화면 보기</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/divForm/divForm.css'/>"/>

<style type="text/css">

.divForm fieldset {
	width: 550px;
}

.divForm div {
	margin-left: 40px;
	width: 400px;
}

.divForm .firstDiv {
	border-top: 2px solid #e2e2e2;
}

.divForm span{
	display: inline-block;
}

.divForm textarea {
	border: none;
}

.textareaSize{
	width: 610px;
	height: 100px;
}

article{
	font-size: 1.25em;
}


</style>
</head>
<body>
<section>
	<article>
		<div class="divForm">
			<form method="post" action="<c:url value='/resource/editResource.do'/>" 
				enctype="multipart/form-data">
				<!-- 수정시 no 가 필요하므로  hidden 필드에 담아서 보낸다 -->
				<input type="hidden" name="resNo" value="${param.resNo}">
				<input type="hidden" name="oldFileName" value="${rmVo.resImage}">
				
				<fieldset>
					<legend>자원 정보</legend>
					<div>
						<label class="la_left">자원명</label> 
						<input style="width:200px" class="input_m borderStyle" type="text" name="resName"
						value="${rmVo.resName }"> 
					</div>
					<div>
						<label class="la_left">이미지 첨부</label>
						<input type="file" name="upfile" id="upfile"><br>
			        	<c:if test="${!empty rmVo.resImage }">
			        		<span class="sp1"></span>
			        		<span style="color:green; font-weight: bold">첨부파일을 새로 지정할 경우 기존 파일 ${fileInfo }은 삭제됩니다.</span>
			        	</c:if>
					</div>
					<div>
						<label class="la_left">장소</label>
						<input style="width:50px" class="borderStyle" type="text" name="resLocation"
						value="${rmVo.resLocation}">
					</div>
					<div>
						<label class="la_left">상세설명</label>
						<textarea class="borderStyle" rows="5" cols="30" name="resSubdesc">${rmVo.resSubdesc }</textarea>
					</div>
					<div id="add_inputs">
						<input type="submit" value="수정"> 
						<input type="reset"	value="취소">
					</div>
				</fieldset>
			</form>
		</div>
	</article>
</section>
</body>
</html>