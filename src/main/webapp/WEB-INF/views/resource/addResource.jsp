<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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


</style>
</head>
<body>
<section>
	<article>
		<div class="divForm">
			<form method="post" action="<c:url value='/resource/addresource.do'/>">
				<fieldset>
					<legend>자원 정보</legend>
					<div>
						<label class="la_left">자원명</label> 
						<input style="width:200px" class="input_m borderStyle" type="text" name="resName"> 
					</div>
					<div>
						<label class="la_left">이미지</label>
						<input type="file" name="upfile">
					</div>
					<div>
						<label class="la_left">장소</label>
						<select class="borderStyle" name="locNo">
							<option value="">전체</option>
							<c:forEach var="loc" items="${locList }">
								<option value="${loc.locNo }">${loc.locName }</option>
							</c:forEach>
						</select>
						<input style="width:150px" class="borderStyle" type="text" name="resPerson">
					</div>
					<div>
						<label class="la_left">인원</label>
						<input style="width:50px" class="borderStyle" type="text" name="resPerson">명
					</div>
					<div>
						<label class="la_left">상세설명</label>
						<textarea class="borderStyle" rows="5" cols="30" name="locDetail"></textarea>
					</div>
					<div id="add_inputs">
						<input type="submit" value="등록"> 
						<input type="reset"	value="취소">
					</div>
				</fieldset>
			</form>
		</div>
	</article>
</section>
</body>
</html>