<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
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
	    width: 30%;
	}
	
	.All {
	 	margin-left: 5%;  
	 	margin-bottom: 3%; 
	}
	
	input#email1 {
	    width: 15%;
	}

	.form-control{
		max-width: 30%;
	}
	
	#btZipcode {
	    position: absolute;
	    margin-left: 26%;
	    margin-top: -2%;
	}
	
	#zipInput{
		max-width: 30%;
	}
	
	#hp1{
		width: 80px;
		height: 38px; 
		display: inline-block;
	}
	#email{
		max-width: 15%;
		display: inline-block;
	}
	#email2{
		max-width: 15%;
		display: inline-block;
	}
	#email3{
		max-width: 15%;
		display: inline-block;
		height: 45px;
	}
	
	#pwd1, #pwd2{
		max-width: 30%;
	}

</style>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/mypage/member.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/mypage/paging.js'/>"></script>
=======
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

label {
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
	width: 30%;
}

.All {
	margin-left: 5%;
	margin-bottom: 3%;
}

input#email1 {
	width: 15%;
}

.form-control {
	max-width: 30%;
}

#btZipcode {
	position: absolute;
	margin-left: 26%;
	margin-top: -2%;
}

#zipInput {
	max-width: 30%;
}

#hp1 {
	width: 80px;
	height: 38px;
	display: inline-block;
}

#email {
	max-width: 15%;
	display: inline-block;
}

#email2 {
	max-width: 15%;
	display: inline-block;
}

#email3 {
	max-width: 15%;
	display: inline-block;
	height: 45px;
}

#pwd1, #pwd2 {
	max-width: 30%;
}
</style>
<script src="<c:url value = "/resources/vendor/jquery/jquery.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/mypage/member.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/mypage/paging.js'/>"></script>
>>>>>>> master

<script type="text/javascript">
	$(function() {
		$("#pwd2").keyup(function() {
			
			if($("#pwd1").val() != $("#pwd2").val()){
				$("#error").html("패스워드가 일치하지 않습니다.").css("color","red");
			}else{
				$("#error").html("패스워드가 일치합니다.").css("color","green");
		}
			/* 
			$.ajax({
				url="<c:url value='/mypage/ajaxPwd.do'/>",
				type="post",
				data="$('form[name=frm]')".serializeArray(),
				dataType:"json",
				success:function(res){
					if(res>0){
						$("#error").html("패스워드가 일치합니다.").css("color","green");
					}else{
						$("#error").html("패스워드가 일치하지 않습니다.").css("color","red");
					}
				},
				error:function(xhr,status,error){
					alert(status+","+error);
				}
			});
			 */
		});
		
<<<<<<< HEAD
		$("form[name=frm]").submit(function() {
=======
		$("form[name=mypageFrm]").submit(function() {
			
>>>>>>> master
			if(!validate_pwd($('#pwd1').val())){
				alert('비밀번호는 영문대소문자,숫자,_만 가능합니다!');
				$('#pwd').focus();
				event.preventDefault();
			}else if(!validate_phone($('input[name=hp2]').val()) || 
					!validate_phone($('input[name=hp3]').val())){
				alert('핸드폰은 숫자만 가능합니다!');
				$('input[name=hp2]').focus();
				event.preventDefault();
			}
		});
		
		$('#btZipcode').click(function(){
			window.open(contextPath+'/mypage/zipcode.do','zip',
	'width=500,height=500,left=0,top=0,location=yes,resizable=yes');
		});
		
	});//doc
</script>

<<<<<<< HEAD
	<div class="All">
		<h1 id="change_h1">기본정보수정</h1> 
		<!-- enctype="multipart/form-data" -->
		<form name="frm"  method="post"
			action="<c:url value='/mypage/mypage.do'/>" >
			<input type="text" value="${vo.pwd}">
			
			<div class="noimg1">
				<img alt="" src="<c:url value='/resources/img/noimg.png'/>">
			</div>
			<div class="imgbt">
				<p>*120 X 150</p>
				<input type="file" value="사진변경" name="imgUP" class="img_ch">
			</div>
			<div class="form-group">
				사원번호
				<input type="text" class="form-control" id="memNo" name="memNo" value="${vo.memNo}" readonly="readonly">
			</div>
			<div class="form-group">
				부서코드
				<input type="text" class="form-control" id="deptCode" name="deptCode" value="${vo.deptCode}" readonly="readonly">
			</div>
			<div class="form-group">
				직급코드
				<input type="text" class="form-control" id="posCode" name="posCode" value="${vo.posCode}" readonly="readonly">
			</div>
			<div class="form-group">
				부서
				<input type="text" class="form-control" value="${vo.dname }" name="dname"  readonly="readonly">
			</div>
			<div class="form-group">
				직책
				<input type="text" class="form-control" value="${vo.pname }" name="pname"  readonly="readonly">
			</div>
			<div class="form-group">
				이름
				<input type="text" class="form-control" id="name" name="name" value="${vo.name }">
			</div>
			<div class="form-group">
				연봉
				<input type="text" class="form-control" id="salary" name="salary" value="${vo.salary }">
			</div>
			<div class="form-group">
				패스워드
				<input type="password" class="form-control" id="pwd1" name="pwd" placeholder="암호">
			</div>
			<div class="form-group">
				패스워드 확인
				<input type="text" class="form-control" id="pwd2" name="pwd">
				<span id="error"></span>
			</div>
			<div class="form-group">
				휴대폰<br>
				<select name="hp1" id="hp1" title="휴대폰 앞자리" class="form-control">
		            <option value="010">010</option>
		            <option value="011">011</option>
		            <option value="016">016</option>
		            <option value="017">017</option>
		            <option value="018">018</option>
		            <option value="019">019</option>
		       	</select>
		        -
		        <input type="text" name="hp2" class="form-control" id="hp2" 
		        	value="${vo.hp2 }" maxlength="4" title="휴대폰 가운데자리" style="width: 80px; display: inline-block;">-
		        <input type="text" name="hp3" class="form-control" id="hp3" 
		        	value="${vo.hp3 }" maxlength="4" title="휴대폰 뒷자리" style="width: 80px; display: inline-block;">
			</div>
			<div class="form-group">
				이메일<br>
				<input type="text" name="email1" value="${vo.email1 }" class="form-control" 
					id="email" title="이메일주소 앞자리" placeholder="이메일을 입력하세요">@
		        <select name="email2" class="form-control" id="email2" title="이메일주소 뒷자리" 
		        	style="height: 45px;">
		            <option value="naver.com">naver.com</option>
		            <option value="hanmail.net">hanmail.net</option>
		            <option value="nate.com">nate.com</option>
		            <option value="gmail.com">gmail.com</option>
		            <option value="etc">직접입력</option>
		        </select>
		        <input type="text" name="email3" class="form-control" id="email3"
		         	title="직접입력인 경우 이메일주소 뒷자리" style="visibility:hidden">
		    </div>
		    <div class="form-group">
		    	성별
				<input type="text" name="gender" class="form-control" id="gender" value="${vo.gender }">
			</div>
			<div class="form-group">
				입사일
				<input type="text" name="hireDate" class="form-control" id="hireDate" value="${date }" readonly="readonly">
			</div>
			<div class="form-group">
				주소
				<div id="divZip">
					<input type="text" name="zipcode" class="form-control" id="zipInput" 
						value="${vo.zipcode}" ReadOnly title="우편번호">
				</div>
		        	<input type="Button" value="우편번호 찾기" id="btZipcode" title="새창열림">
		        <div id="divZip">
			        <input type="text" name="address" class="form-control" id="addrInput" value="${vo.addr}" 
			        	ReadOnly title="주소">
	        	</div>
	        	<div id="divZip">
			        <input type="text" name="addressDetail" class="form-control" id="addrDetailInput" 
			        	value="${vo.addrDetail}" title="상세주소">
	        	</div>
	        </div>
			
			<input type="submit" class="form-control" id="input" value="수정하기">
		</form>
	</div>
	
=======
<div class="row">

	<!-- Area Chart -->
	<div class="col-xl-12 ">
		<div class="card shadow mb-4">
			<div class="All">
				<h1 id="change_h1">기본정보수정</h1>
				<!-- enctype="multipart/form-data" -->
				<form name="mypageFrm" method="post"
					action="<c:url value='/mypage/mypage.do'/>">
					<input type="text" value="${vo.pwd}">

					<div class="noimg1">
						<img alt="" src="<c:url value='/resources/img/noimg.png'/>">
					</div>
					<div class="imgbt">
						<p>*120 X 150</p>
						<input type="file" value="사진변경" name="imgUP" class="img_ch">
					</div>
					<div class="form-group">
						사원번호 <input type="text" class="form-control" id="memNo"
							name="memNo" value="${vo.memNo}" readonly="readonly">
					</div>
					<div class="form-group">
						부서코드 <input type="text" class="form-control" id="deptCode"
							name="deptCode" value="${vo.deptCode}" readonly="readonly">
					</div>
					<div class="form-group">
						직급코드 <input type="text" class="form-control" id="posCode"
							name="posCode" value="${vo.posCode}" readonly="readonly">
					</div>
					<div class="form-group">
						부서 <input type="text" class="form-control" value="${vo.dname }"
							name="dname" readonly="readonly">
					</div>
					<div class="form-group">
						직책 <input type="text" class="form-control" value="${vo.pname }"
							name="pname" readonly="readonly">
					</div>
					<div class="form-group">
						이름 <input type="text" class="form-control" id="name" name="name"
							value="${vo.name }">
					</div>
					<div class="form-group">
						연봉 <input type="text" class="form-control" id="salary"
							name="salary" value="${vo.salary }">
					</div>
					<div class="form-group">
						패스워드 <input type="password" class="form-control" id="pwd1"
							name="pwd" placeholder="암호">
					</div>
					<div class="form-group">
						패스워드 확인 <input type="text" class="form-control" id="pwd2"
							name="pwd"> <span id="error"></span>
					</div>
					<div class="form-group">
						휴대폰<br> <select name="hp1" id="hp1" title="휴대폰 앞자리"
							class="form-control">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select> - <input type="text" name="hp2" class="form-control" id="hp2"
							value="${vo.hp2 }" maxlength="4" title="휴대폰 가운데자리"
							style="width: 80px; display: inline-block;">- <input
							type="text" name="hp3" class="form-control" id="hp3"
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
						성별 <input type="text" name="gender" class="form-control"
							id="gender" value="${vo.gender }">
					</div>
					<div class="form-group">
						입사일 <input type="text" name="hireDate" class="form-control"
							id="hireDate" value="${date }" readonly="readonly">
					</div>
					<div class="form-group">
						주소
						<div id="divZip">
							<input type="text" name="zipcode" class="form-control"
								id="zipInput" value="${vo.zipcode}" ReadOnly title="우편번호">
						</div>
						<input type="Button" value="우편번호 찾기" id="btZipcode" title="새창열림">
						<div id="divZip">
							<input type="text" name="address" class="form-control"
								id="addrInput" value="${vo.addr}" ReadOnly title="주소">
						</div>
						<div id="divZip">
							<input type="text" name="addressDetail" class="form-control"
								id="addrDetailInput" value="${vo.addrDetail}" title="상세주소">
						</div>
					</div>

					<input type="submit" id="mypageEdit" value="수정하기">
				</form>

			</div>
		</div>
	</div>
</div>

>>>>>>> master
<%@include file="../inc/bottom.jsp"%>