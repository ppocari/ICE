<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/divForm/divForm.css'/>"/>

<!-- Custom styles for this template-->
<link href="<c:url value="/resources/css/sb-admin-2.min.css"/>"
   rel="stylesheet">
<!-- Bootstrap core JavaScript-->
  <script src="<c:url value = "/resources/vendor/jquery/jquery.min.js"/>"></script>
  <script src="<c:url value = "/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
  <script type="text/javascript" src="<c:url value='/resources/js/address/inputCheck.js'/>"></script>
<script type="text/javascript">
$(function(){
	$('input[type=reset]').click(function(){
		self.close();
	});
});
		
</script>
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

.hp {
	width: 35px;
}

.email3 {
	width: 69px;
}

.email{
	width: 69px;
}

</style>
</head>
<body style="overflow: hidden;">
<section>
	<article>
	<!-- Area Chart -->
		<div class="card shadow mb-4" style="width: 99%;">
		<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between" style="background-color: #F8F9FC;">
			<h6 class="m-0 font-weight-bold text-primary">주소록 수정하기</h6>
		</div>
		<div class="divForm">
			<form name="editForm" method="post" action="<c:url value='/address/editAddress.do'/>">
				<fieldset>
					<legend>기본 정보</legend>
					<div>
						<label class="la_left">이름</label> 
						<input class="etc borderStyle" type="text" name="name" value="${adVo.name }">
					</div>
					<div>
						<label class="la_left">전화번호</label> 
						<select name="hp1" class="borderStyle">
							<option value="">전체</option>
							<c:forEach var="hp" items="${phList }">
								<option value="${hp }" >${hp }</option>
							</c:forEach>
						</select>   
						- <input class="hp borderStyle" type="text" name="hp2" value="${adVo.hp2 }">  
						- <input class="hp borderStyle" type="text" name="hp3" value="${adVo.hp3 }">
					</div>
					<div>
						<label class="la_left">이메일</label> 
						<input class="email borderStyle" type="text" name="email1" value="${adVo.email1 }">@ 
						<select class="borderStyle" name="email2" id="email2">
							<c:forEach var="em" items="${emList }">
								<option value="${em }" 
									<c:if test="${em eq adVo.email2 }">
										selected="selected"
									</c:if>
								>${em }</option>
							</c:forEach>
						</select>
						  <input class="email3" type="text" name="email3" id="email3" title="직접입력인 경우 이메일주소 뒷자리"
      							style="visibility:hidden">
					</div>
					<div>
						<label class="la_left">회사명</label> 
						<input class="etc borderStyle" type="text" name="company" value="${adVo.company }">
					</div>
					<div>
						<label class="la_left">부서</label> 
						<input class="etc borderStyle" type="text" name="deptName" value="${adVo.deptName }">
					</div>
					<div>
						<label class="la_left">직책</label> 
						<input class="etc borderStyle" type="text" name="posName" value="${adVo.posName }">
					</div>
					<div>
						<label class="la_left">그룹 선택</label>
						<select class="borderStyle" name="adgNo">
							<!-- adVo.groupName: 수정하려는 주소의 그룹 이름,
								 adg.groupName: 해당 회원의 그룹 이름 전체 중 1개씩 -->
							<c:forEach var="adg" items="${adgList }">
								<option value="${adg.adgNo }" 
									<c:if test="${adVo.groupName eq adg.groupName }">
										selected="selected" 
									</c:if>
								> ${adg.groupName }</option>
							</c:forEach>
						</select>
						<input type="hidden" value="${adVo.adNo }" name="adNo">
					</div>

					<legend>추가 정보</legend>
					<div>
						<label class="la_left">주소</label> 
						<input class="etc borderStyle" type="text" name="homeAddress" value="${adVo.homeAddress }">
					</div>
					<div>
						<label class="la_left">홈페이지</label> 
						<input class="etc borderStyle" type="text" name="homePage" value="${adVo.homePage }">
					</div>
					<div>
						<label class="la_left">메신저</label> 
						<input class="etc borderStyle" type="text" name="messenger" value="${adVo.messenger }">
					</div>
					<div>
						<label class="la_left">SNS</label> 
						<input class="etc borderStyle" type="text" name="SNS" value="${adVo.SNS }">
					</div>
					<div>
						<label class="la_left">메모</label><br>
						<textarea class="borderStyle" rows="4" cols="35" name="memo" >${adVo.memo }</textarea>
					</div>
					<div id="add_inputs">
						<input type="submit" value="수정"> 
						<input type="reset"	value="취소">
					</div>
				</fieldset>
			</form>
		</div>
		</div>
	</article>
</section>
</body>
</html>
