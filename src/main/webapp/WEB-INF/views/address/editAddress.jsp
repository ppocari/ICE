<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Custom fonts for this template-->
<%-- <link
   href="<c:url value="/resources/vendor/fontawesome-free/css/all.min.css"/>"
   rel="stylesheet" type="text/css">
<link
   href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
   rel="stylesheet"> --%>

<!-- Custom styles for this template-->
<link href="<c:url value="/resources/css/sb-admin-2.min.css"/>"
   rel="stylesheet">
<!-- Bootstrap core JavaScript-->
 
  <script src="<c:url value = "/resources/vendor/jquery/jquery.min.js"/>"></script>
  <script src="<c:url value = "/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

  <!-- Core plugin JavaScript-->
 <%--  <script src="<c:url value = "/resources/vendor/jquery-easing/jquery.easing.min.js"/>"></script>
 --%>
  <!-- Custom scripts for all pages-->
 <%--  <script src="<c:url value = "/resources/js/sb-admin-2.min.js"/>"></script> --%>

<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css"/>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script> 
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>  -->

<script type="text/javascript">
$(function(){
	$('input[type=reset]').click(function(){
		self.close();
	});
	
	/* 이메일 직접 입력 처리 */
	$('#email2').change(function(){
		if($(this).val()=='직접 입력') {
			$('#email3').val("");
			$('#email3').css('visibility','visible');
			$('#email3').focus();
		}else{
			$('#email3').css('visibility','hidden');
		}
	});
	
	$('input[type=submit]').click(function(){
		
		var name=$('input[name=name]').val();
		var hp2=$('input[name=hp2]').val();
		var hp3=$('input[name=hp3]').val();
		var em=$('#email3').val();
		
		var check_num = /[0-9]/; // 숫자 
		var check_eng = /[a-zA-Z]/; // 문자 
		var check_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글
		
		if(name.length==0) {
			alert('이름은 필수입니다!');
			$('input[name=name]').focus();
			return false;
		}else if(!check_num.test(name) && !check_eng.test(name) && !check_kor.test(name)) {
			alert('이름은 한글, 영어, 숫자만 입력할 수 있습니다!');
			$('input[name=name]').focus();
		}
		
		if(hp2.length!=0) {
			if(hp3.length==0) {
				hp_empty();
				$('input[name=hp3]').focus();
				return false;
			}else if(!validate_phone(hp2)) {
				hp_error();
				$('input[name=hp2]').focus();
				return false;
			}
		}
		if(hp3.length!=0) {
			if(hp2.length==0) {
				hp_empty();
				$('input[name=hp2]').focus();
				return false;
			}else if(!validate_phone(hp3)) {
				hp_error();
				$('input[name=hp3]').focus();
				return false;
			}
		}
		
		if(em.length>0) {
			if(em.length==0 || !email_check(em)) {
				email_alert();
				event.preventDefault();
			}
		}
	});

	function hp_error(){
		alert('전화번호는 숫자만 입력할 수 있습니다.');
	}
	
	function hp_empty(){
		alert('전화번호 양식에 맞지 않습니다.');
	}
	
	function validate_phone(hp) {
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(hp); 
	}
	
	function email_alert(){
		alert('이메일 형식이 올바르지 않습니다.');
	}
	
	function email_check(em) {
		var isPoint=em.indexOf(".");
		var isLen=em.length;
		if(isPoint==-1 || isPoint==0){
			return false;
		}else if(isPoint>=1 && isPoint+1!=isLen){
			return true;
		}else{
			return false;
		}
	}
});
		
</script>
<style type="text/css">
.divForm div, .divForm label, .divForm {
	font-size: 0.9em;
}

.divForm fieldset {
	width: 550px;
	padding: 0;
	border: 0;
}

.divForm legend {
	font-weight: bold;
	color: #555555;
	padding: 10px 0;
	margin-left: 15%;
	font-size: 1.3em;
}

.divForm div {
	margin-left: 40px;
	clear: both;
	border-bottom: 1px solid #eee;
	padding: 5px 0;
	overflow: auto;
}

.divForm .firstDiv {
	border-top: 2px solid #e2e2e2;
}

.divForm div {
	width: 400px;
}

.la_left  {
	float: left;
	width: 20%;
	text-align: right;
	padding: 3px 15px 0 0;
	font-weight: bold;
}

.etc {
	border: 1px solid #DCDDE3;
	width: 240px;
}

.hp {
	border: 1px solid #DCDDE3;
	width: 35px;
}

.em3 {
	border: 1px solid #DCDDE3;
	width: 69px;
}

.email{
	border: 1px solid #DCDDE3;
	width: 69px;
}

.divForm textarea {
	border: 1px solid #DCDDE3;
}

.divForm.text_width input[type="text"], .divForm.text_width input[type="password"]
	{
	width: 55%;
	height: 1.2em;
	font-size: 0.9em;
}

.divForm select {
	border: 1px solid #DCDDE3;
	font-size: 0.9em;
}

.divForm input[type=submit], input[type=reset] {
	font-size: 1.0em;
	margin-left: 5px;
	background-color: #f3f3f3;
	border-radius: 5px 5px 5px 5px;
	border: 1px solid gray;
}

#add_inputs {
	border:none;
	text-align: center;
}
</style>
</head>
<body>
<section>
	<article>
		<div class="divForm">
			<form name="editForm" method="post" action="<c:url value='/address/editAddress.do'/>">
				<fieldset>
					<legend>기본 정보</legend>
					<div>
						<label class="la_left">이름</label> 
						<input class="etc" type="text" name="name" value="${adVo.name }">
					</div>
					<div>
						<label class="la_left">전화번호</label> 
						<select name="hp1">
							<c:forEach var="hp" items="${phList }">
								<option value="${hp }" >${hp }</option>
							</c:forEach>
						</select>   
						- <input class="hp" type="text" name="hp2" value="${adVo.hp2 }">  
						- <input class="hp" type="text" name="hp3" value="${adVo.hp3 }">
					</div>
					<div>
						<label class="la_left">이메일</label> 
						<input class="email" type="text" name="email1" value="${adVo.email1 }">@ 
						<select name="email2" id="email2">
							<c:forEach var="em" items="${emList }">
								<option value="${em }" 
									<c:if test="${em eq adVo.email2 }">
										selected="selected"
									</c:if>
								>${em }</option>
							</c:forEach>
						</select>
						  <input class="em3" type="text" name="email3" id="email3" title="직접입력인 경우 이메일주소 뒷자리"
      							style="visibility:hidden">
					</div>
					<div>
						<label class="la_left">회사명</label> 
						<input class="etc" type="text" name="company" value="${adVo.company }">
					</div>
					<div>
						<label class="la_left">부서</label> 
						<input class="etc" type="text" name="deptName" value="${adVo.deptName }">
					</div>
					<div>
						<label class="la_left">직책</label> 
						<input class="etc" type="text" name="posName" value="${adVo.posName }">
					</div>
					<div>
						<label class="la_left">그룹 선택</label>
						<select name="adgNo">
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
						<input class="etc" type="text" name="homeAddress" value="${adVo.homeAddress }">
					</div>
					<div>
						<label class="la_left">홈페이지</label> 
						<input class="etc" type="text" name="homePage" value="${adVo.homePage }">
					</div>
					<div>
						<label class="la_left">메신저</label> 
						<input class="etc" type="text" name="messenger" value="${adVo.messenger }">
					</div>
					<div>
						<label class="la_left">SNS</label> 
						<input class="etc" type="text" name="SNS" value="${adVo.SNS }">
					</div>
					<div>
						<label class="la_left">메모</label><br>
						<textarea rows="4" cols="35" name="memo" >${adVo.memo }</textarea>
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
