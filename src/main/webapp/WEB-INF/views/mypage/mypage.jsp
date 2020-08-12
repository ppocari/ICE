<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
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
	
	label{
		font-weight: bold;
		width: 20%;
    	background: #dedfe2;
    	border: 1px solid gray;
    	height: 50px;
	    line-height: 3;
	    padding-left: 10px;
	}
	
	.data div p {
	    border: 1px solid gray;
	    width: 35%;
	    border: 1px solid gray;
	    margin: 0px;
	    height: 50px;
	}
	
	.sp1{
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
	    width: 75%;
	}
	
	.All {
	 	margin-left: 5%;  
	 	margin-bottom: 3%; 
	}
	
	input#email1 {
	    width: 15%;
	}
	
	#btZipcode {
	    position: absolute;
	    margin-left: 156px;
	    margin-top: -39px;
	    width: 10%;
	}
	
	#hp1{
		width: 80px;
		height: 38px; 
		display: inline-block;
	}
	#email{
		width: 35%;
		display: inline-block;
	}
	#email2{
		width: 22%;
		display: inline-block;
	}
	#email3{
		width: 22%;
		display: inline-block;
		height: 45px;
	}
	
	#mypageFrm{
		padding: 60px;
	}
	
	#a_a,#a_b,#a_c{
		float: left;
	}
	
	#a_a{
		width: 25%;
	}
	#a_b, #a_c {
	    width: 18%;
	}
	
	
	#b_a{
		float: left;
		width: 25%;
	}
	#b_b{
		float: left;
		width: 50%;
	}
	
	div#a_c {
	    margin-right: 30%;
	}
	
	#c{
		
	}
	
	input#mypageEdit {
	    width: 50%;
	    position: absolute;
	    bottom: 0;
	    left: 0;
	    margin-left: 4%;
	}
	 
</style>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/mypage/member.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/mypage/paging.js'/>"></script>
<script type="text/javascript">
	$(function() {
		var pwd = $("#pwd2").val();
		var pwdFalse;
		$("#pwd2").keyup(function() {
			if($("#pwd2").val().length>=2){
				$.ajax({
					url:"<c:url value='/mypage/ajaxPwd.do'/>",
					type:"post",
					data:$('form[name=mypageFrm]').serializeArray(),
					dataType:"json",
					success:function(res){
						if(res==1 && $("#pwd2").val() == $("#pwd1").val()){
							pwdFalse = (res==1 && $("#pwd2").val() == $("#pwd1").val());
							$("#error").html("패스워드가 일치합니다.").css("color","green");
						}else if((res==2 && pwd != $("#pwd1").val())){
							pwdFalse = (res==2 && pwd != $("#pwd1").val());
							$("#error").html("패스워드가 일치하지 않습니다.").css("color","red");
							event.preventDefault();
							$('#pwd1').focus();
						}
					},
					error:function(xhr,status,error){
						alert(status+","+error);
					}
				});
			}
		});
		
		$("form[name=mypageFrm]").submit(function() {
			if(!validate_phone($('#hp2').val()) || 
					!validate_phone($('#hp3').val())){
				alert('핸드폰은 숫자만 가능합니다!');
				$('#hp2').focus();
				event.preventDefault();
			}else if(!validate_pwd($('#pwd1').val()) ||
					!validate_pwd($('#pwd2').val())){
				alert('비밀번호는 영문 대소문자,숫자,_만 가능합니다!');
				$('#pwd1').focus();
				event.preventDefault();
			}
		});
			$('#btZipcode').click(function(){
				window.open(contextPath+'/mypage/zipcode.do','zip',
		'width=500,height=500,left=0,top=0,location=yes,resizable=yes');
			});
		
			
			function validate_pwd(pwd){
				var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
				return pattern.test(pwd);
				/* 정규식  /^[a-zA-Z0-9_]+$/g
				a에서 z 사이의 문자, A~Z사이의 문자, 0 에서 9사이의 숫자나 _로 시작하거나 
				끝나야 한다는 의미
				닫기 대괄호(]) 뒤의 + 기호는 이 패턴이 한 번 또는 그 이상 반복된다는 의미 */
			}

			function validate_phone(tel){
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
	<div><span id="name">${userName}님</span></div>
	<!-- Content Row -->
	<div class="row">
		<!-- Area Chart -->
		<div class="col-xl-12 " >
			<div class="card shadow mb-4" style="fit-content">
				<!-- 근태관리 조회 -->
			<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h5 class="m-0 font-weight-bold text-primary">기본정보수정</h5>
			</div>
				<div class="row">
					<!-- Area Chart -->
					<div class="col-xl-12 ">
						<div class="card shadow mb-4">
							<form name="mypageFrm" id="mypageFrm" method="post" enctype="multipart/form-data"
								action="<c:url value='/mypage/mypage.do'/>">
								<div id="a">
									<div id="a_a">
										<div class="noimg1">
											<c:if test="${empty vo.proFileURL}">
												<img alt="" src="<c:url value='/resources/img/noimg.png'/>">
											</c:if>
											
											<c:if test="${!empty vo.proFileURL}">
												<img alt="" src="<c:url value='/pd_images/${vo.proFileURL}'/>">
											</c:if>
										</div>
										<div class="imgbt">
											<p>*120 X 150</p>
											<input type="file" value="사진변경" name="imgUP" class="img_ch">
										</div>
									</div>
									
									<div id="a_b">
										<div class="form-group" id="memNo">
											사원번호 <input type="text" class="form-control" id="memNo"
												name="memNo" value="${vo.memNo}" readonly style="width: 180px;">
										</div>
										<div class="form-group" id="deptCode">
											부서코드 <input type="text" class="form-control" id="deptCode"
												name="deptCode" value="${vo.deptCode}" readonly style="width: 180px;">
										</div>
										<div class="form-group">
											직급코드 <input type="text" class="form-control" id="posCode"
												name="posCode" value="${vo.posCode}" readonly style="width: 180px;">
										</div>
									</div>
									<div id="a_c">
										<div class="form-group">
											부서 <input type="text" class="form-control" value="${vo.deptName }"
												name="dname" readonly style="width: 180px;">
										</div>
										<div class="form-group">
											직책 <input type="text" class="form-control" value="${vo.posName }"
												name="pname" readonly style="width: 180px;">
										</div>
										<div class="form-group">
											연봉 <input type="text" class="form-control" id="salary" readonly
												name="salary" value="${vo.salary }" style="width: 180px;">
										</div>
									</div>
								</div>
								
								
								
								
								<div id="b">
									<div id="b_a">
										<div class="form-group">
											이름 <input type="text" class="form-control" id="name" name="name"
												value="${vo.name }" style="width: 75%;">
										</div>
										<div class="form-group">
											패스워드 <input type="password" class="form-control" id="pwd1"
												name="pwd" placeholder="암호" style="width: 75%;">
										</div>
										<div class="form-group">
											패스워드 확인 <input type="password" class="form-control" id="pwd2"
												name="pwd2" style="width: 75%;"> <span id="error"></span>
										</div>
										<div class="form-group">
											성별 <input type="text" name="gender" class="form-control"
												id="gender" value="${vo.gender }" style="width: 75%;">
										</div>
									</div>
									<div id="b_b">
										<div class="form-group">
											휴대폰<br> <select name="hp1" id="hp1" title="휴대폰 앞자리"
												class="form-control">
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
											</select> - 
											<input type="text" name="hp2" class="form-control" id="hp2"
												value="${vo.hp2 }" maxlength="4" title="휴대폰 가운데자리"
												style="width: 80px; display: inline-block;">- 
											<input type="text" name="hp3" class="form-control" id="hp3"
												value="${vo.hp3 }" maxlength="4" title="휴대폰 뒷자리"
												style="width: 80px; display: inline-block;">
										</div>
										<div class="form-group">
											이메일<br> <input type="text" name="email1"
												value="${vo.email1 }" class="form-control" id="email"
												title="이메일주소 앞자리" placeholder="이메일을 입력하세요">@ <select
												name="email2" class="form-control" id="email2" title="이메일주소 뒷자리"
												style="height: 45px;">
												<option value="naver.com">naver.com</option>
												<option value="hanmail.net">hanmail.net</option>
												<option value="nate.com">nate.com</option>
												<option value="gmail.com">gmail.com</option>
												<option value="etc">직접입력</option>
											</select> <input type="text" name="email3" class="form-control" id="email3"
												title="직접입력인 경우 이메일주소 뒷자리" style="visibility: hidden">
										</div>
										 <div class="form-group">
											주소
											<div id="divZip">
												<input type="text" name="zipcode" class="form-control"
													id="zipInput" value="${vo.zipcode}" ReadOnly title="우편번호"
													style="width: 20%;">
											</div>
											<input type="Button" class="btn btn-primary" value="우편번호 찾기" id="btZipcode" title="새창열림">
											<div id="divZip">
												<input type="text" name="addr" class="form-control"
													id="addrInput" value="${vo.addr}" ReadOnly title="주소"
													style="width: 450px;">
											</div>
											<div id="divZip">
												<input type="text" name="addrDetail" class="form-control"
													id="addrDetailInput" value="${vo.addrDetail}" title="상세주소"
													style="width: 450px;">
											</div>
										 </div>
									</div>
								</div>
								<div id="c">
									<input type="submit" class="btn btn-primary" id="mypageEdit" value="수정하기">
								</div>
							</form>
				
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
</div>
<%@include file="../inc/bottom.jsp"%>