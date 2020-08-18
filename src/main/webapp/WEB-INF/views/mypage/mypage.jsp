<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/inc/top.do"/> 
<style type="text/css">
.data {
	position: relative;
	border: 1px solid gray;
}

.center {
	margin-left: 5%;
	margin-top: 18%;
	margin-bottom: 5%;
	background: white;
	padding: 10px;
	width: 57%;
}

.data div p {
	border: 1px solid gray;
	width: 35%;
	border: 1px solid gray;
	margin: 0px;
	height: 50px;
}

.sp1 {
	margin-left: 119px;
}

.data div input[type="text"] {
	height: 46px;
	width: 30%;
	margin-left: 1%;
}

.data div span {
	margin-left: 13%;
}

label#lb_zipcode {
	position: absolute;
	height: 138px;
}

#div_zipcode input[type=text] {
	margin-left: 21%;
}

input#zipcode {
	width: 15%;
}

input#Btzipcode {
	width: 116px;
	height: 40px;
}

.img_ch {
	background: gray;
	border: 1px solid gray;
	color: white;
	margin-bottom: 2%;
	width: 250px;
}

.All {
	margin-left: 5%;
	margin-bottom: 3%;
}

input#email1 {
	width: 15%;
}

#hp1 {
	width: 80px;
	height: 38px;
	display: inline-block;
}

#email {
	width: 22%;
	display: inline-block;
}

#email2 {
	width: 22%;
	display: inline-block;
}

#email3 {
	width: 22%;
	display: inline-block;
	height: 45px;
}





.form-group {
	
}

.form-group label {
	float: left;
	width: 150px;
}

.form-control {
	display: inline-block;
	width: 180px;
}

#mypage_div1 {
	float: left;	
	text-align: center;
    width: 250px;
    margin-right: 70px;
}

#mypage_div2 {
	float: left;
	
}


</style>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/mypage/member.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/mypage/paging.js'/>"></script>
<script type="text/javascript">
	$(function() {
		$('#pwd').keyup(function() {
			$.ajax({
				url : "<c:url value='/member/memCheck.do'/>",
				type : "post",
				data : "pwd=" + pwd,
				success : function(res) {

				},
				error : function(xhr, status, error) {
					alert(status + "," + error);
				}

			});
		});

		$('#pwd2').keyup(function() {

			if ($('#pwd').val() != $('#pwd2').val()) {
				$("#result_p").css("color", "red");
				$("#result_p").text("비밀번호가 일치 하지 않습니다");
			} else {
				$("#result_p").css("color", "green")
				$("#result_p").text("비밀번호가 일치합니다");
			}
		});

		$("form[name=mypageFrm]").submit(function() {
					var pwd = $('#pwd').val();
					var pwd2 = $('#pwd2').val();
					if (pwd != pwd2) {
						alert("비밀번호가 일치 하지 않습니다.")
						event.preventDefault();
					}else if (!validate_phone($('#hp2').val())
							|| !validate_phone($('#hp3').val())) {
						alert('핸드폰은 숫자만 가능합니다!');
						$('#hp2').focus();
						event.preventDefault();
					}else if (!validate_pwd($('#pwd1').val())
							|| !validate_pwd($('#pwd2').val())) {
						alert('비밀번호는 영문 대소문자,숫자,_만 가능합니다!');
						$('#pwd1').focus();
						event.preventDefault();
					}
				});
		$('#btZipcode').click(function() {
			window.open(contextPath + '/mypage/zipcode.do','zip',
				'width=500,height=500,left=0,top=0,location=yes,resizable=yes');
		});

		function validate_pwd(pwd) {
			var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
			return pattern.test(pwd);
			/* 정규식  /^[a-zA-Z0-9_]+$/g
			a에서 z 사이의 문자, A~Z사이의 문자, 0 에서 9사이의 숫자나 _로 시작하거나 
			끝나야 한다는 의미
			닫기 대괄호(]) 뒤의 + 기호는 이 패턴이 한 번 또는 그 이상 반복된다는 의미 */
		}

		function validate_phone(tel) {
			var pattern = new RegExp(/^[0-9]*$/g);
			return pattern.test(tel);
			/* 정규식  /^[0-9]*$/g
			0 에서 9사이의 숫자로 시작하거나 끝나야 한다는 의미 (^는 시작, $는 끝을 의미)
			닫기 대괄호(]) 뒤의 * 기호는 0번 이상 반복 */
		}

	});//doc
</script>

<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">마이페이지</h1>
	</div>
	<!-- Content Row -->
	<div class="row">
		<!-- Area Chart -->
		<div class="col-xl-9 ">

			
					<!-- Area Chart -->
					
						<div class="card shadow mb-4" style="height: fit-content;">
							<form name="mypageFrm" id="mypageFrm" method="post"
								enctype="multipart/form-data"
								action="<c:url value='/mypage/mypage.do'/>">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">내 정보</h6>
									<input type="submit" class="btn btn-primary" id="mypageEdit"
											value="수정하기">
									

								</div>
								<div class="card-body">
								<div id="mypage_div1">
									<div class="noimg1">
										<c:if test="${empty vo.proFileURL}">
											<img alt="" src="<c:url value='/resources/img/noimg.png'/>">
										</c:if>

										<c:if test="${!empty vo.proFileURL}">
											<img alt=""
												src="<c:url value='/pd_images/${vo.proFileURL}'/>">
										</c:if>
									</div>
									<div class="imgbt">
										<p>*120 X 150</p>
										<input type="file" value="사진변경" name="imgUP" class="img_ch">
									</div>
								</div>
								<div id="mypage_div2">
									<div class="form-group" id="memNo">
										<label for="memNo">사원번호 </label> <input type="text"
											class="form-control" id="memNo" name="memNo"
											value="${vo.memNo}" readonly>
									</div>
									<div class="form-group">
										<label for="dname">부서</label> <input type="text"
											class="form-control" value="${vo.deptName }" name="dname"
											readonly>
									</div>
									<div class="form-group">
										<label for="pname">직책</label> <input type="text"
											class="form-control" value="${vo.posName }" name="pname"
											readonly>
									</div>
									<div class="form-group">
										<label for="salary">연봉</label> <input type="hidden"
											class="form-control" id="salary" readonly name="salary"
											value='${vo.salary }'>
										<fmt:formatNumber value="${ vo.salary }" pattern="#,###" />만원	
									</div>
									<div class="form-group">
										<label for="name">이름</label> <input type="text"
											class="form-control" id="name" name="name"
											value="${vo.name }">
									</div>


									<div class="form-group">
										<label for="gender">성별 </label> <input type="text"
											name="gender" class="form-control" id="gender"
											value="${vo.gender }">
									</div>
									<div class="form-group">
										<label for="hp1">휴대폰 </label> <select name="hp1" id="hp1"
											title="휴대폰 앞자리" class="form-control">
											<option value="" 
								            	<c:if test="${vo.hp1 == '' }">
								            		selected="selected"
								            	</c:if>
								            >선택하세요</option>
											<option value="010" 
								            	<c:if test="${vo.hp1=='010' }">
								            	      selected="selected"
								            	</c:if>            
								            >010</option>
								            <option value="011"
								            	<c:if test="${vo.hp1=='011' }">
								            	      selected="selected"
								            	</c:if> 
								            >011</option>
								            <option value="016"
								            	<c:if test="${vo.hp1=='016' }">
								            	      selected="selected"
								            	</c:if> 
								            >016</option>
								            <option value="017"
								            	<c:if test="${vo.hp1=='017' }">
								            	      selected="selected"
								            	</c:if> 
								            >017</option>
								            <option value="018"
								            	<c:if test="${vo.hp1=='018' }">
								            	      selected="selected"
								            	</c:if> 
								            >018</option>
								            <option value="019" 
								            	<c:if test="${vo.hp1=='019' }">
								            	      selected="selected"
								            	</c:if> 
								            >019</option>
										</select> - 
										<input type="text" name="hp2" class="form-control" id="hp2"
											value="${vo.hp2 }" maxlength="4" title="휴대폰 가운데자리"
											style="width: 80px; display: inline-block;">- 
										<input type="text" name="hp3" class="form-control" id="hp3"
											value="${vo.hp3 }" maxlength="4" title="휴대폰 뒷자리"
											style="width: 80px; display: inline-block;">
									</div>
									<div class="form-group">
										<c:set var="isEtc" value="true" />
								    	<c:if test="${vo.email2 == 'naver.com' || 
								    		vo.email2 == 'hanmail.net' || vo.email2 == 'nate.com'
								    		|| vo.email2 == 'gmail.com' || empty vo.email2}">
									    	<c:set var="isEtc" value="false" />    		
								    	</c:if>
										<label for="email1">이메일</label> <input type="text"
											name="email1" value="${vo.email1 }" class="form-control"
											id="email" title="이메일주소 앞자리" placeholder="이메일을 입력하세요">@
										<select name="email2" class="form-control" id="email2"
											title="이메일주소 뒷자리" style="height: 45px;">
											<option value="" 
								            	<c:if test="${vo.email2 == '' }">
								            		selected="selected"
								            	</c:if>
								            >선택하세요</option>
											<option value="naver.com" 
								            	<c:if test="${vo.email2 == 'naver.com' }">
								            		selected="selected"
								            	</c:if>
								            >naver.com</option>
								            <option value="hanmail.net"
								            	<c:if test="${vo.email2 == 'hanmail.net' }">
								            		selected="selected"
								            	</c:if>
								            >hanmail.net</option>
								            <option value="nate.com" 
								            	<c:if test="${vo.email2 == 'nate.com' }">
								            		selected="selected"
								            	</c:if>
								            >nate.com</option>
								            <option value="gmail.com"
								            	<c:if test="${vo.email2 == 'gmail.com' }">
								            		selected="selected"
								            	</c:if>
								            >gmail.com</option> 
								            <option value="etc"
								            	<c:if test="${isEtc==true}">
								            		selected="selected"
								            	</c:if>
								            >직접입력</option>
										</select> 
										<input type="text" name="email3" class="form-control"
											id="email3" title="직접입력인 경우 이메일주소 뒷자리"
											<c:if test="${isEtc==true}">
								        		style="visibility:visible;"
								        		value="${vo.email2}"
								        	</c:if>
								        	<c:if test="${isEtc==false}">
								        		style="visibility:hidden"
								        	</c:if>
										>
									</div>
									<div class="form-group">
										<label for="zipcode">우편번호/주소</label>
										<div id="divZip" style="margin-right: 10px;">
											<input type="text" name="zipcode" class="form-control"
												id="zipInput" value="${vo.zipcode}" ReadOnly title="우편번호"
												style="margin-bottom: 5px;"> <input type="Button"
												class="btn btn-primary" value="우편번호 찾기" id="btZipcode"
												title="새창열림">
										</div>
										<label for="addr"></label>

										<div id="divZip1">
											<input type="text" name="addr" class="form-control"
												id="addrInput" value="${vo.addr}" ReadOnly title="주소"
												style="width: 450px; margin-bottom: 5px;">
										</div>
										<label for="addrDetail"></label>
										<div id="divZip2">
											<input type="text" name="addrDetail" class="form-control"
												id="addrDetailInput" value="${vo.addrDetail}" title="상세주소"
												style="width: 450px; margin-bottom: 5px;">
										</div>

									</div>



									<div class="pwd-area form-group">
										<label for="pwd">비밀번호</label> <input type="Password"
											name="pwd" id="pwd" class="form-control">
									</div>
									<div class="pwd-area form-group">
										<label for="pwd2">비밀번호 확인</label> <input type="Password"
											name="pwd2" id="pwd2" class="form-control">
									</div>
									<div id="result">
										<p id="result_p" style="text-align: right"></p>
									</div>


								</div>
							</div>


							</form>

						</div>
					</div>
				
			</div>
		
	
</div>

<!-- /.container-fluid -->
<div></div>
<div></div>

<!-- End of Main Content -->

<jsp:include page="../inc/bottom.jsp" />