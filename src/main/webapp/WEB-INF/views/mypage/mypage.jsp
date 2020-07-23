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
	    width: 30%;
	}
	
	.All {
	 	margin-left: 5%;  
	 	margin-bottom: 3%; 
	}
	
	input#email1 {
	    width: 15%;
	}

	#input{
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
	
</style>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function() {
		$('#email2').change(function() {
			if($(this).val()=='etc'){
				$('#email3').val("");
				$('#email3').css('visibility','visible');
				$('#email3').focus();	
			}else{
				$('#email3').css('visibility','hidden');
			}
		});
	});
</script>

	<div class="All">
		<h1 id="change_h1">기본정보수정</h1> 
		<div class="noimg1">
			<img alt="" src="<c:url value='/resources/img/noimg.png'/>">
		</div>
		<div class="imgbt">
			<p>*120 X 150</p>
			<input type="file" value="사진변경" class="img_ch">
		</div>
	
		<form name="frm" enctype="multipart/form-data"
			action="<c:url value='/mypage/mypage.do'/>" >
			<div class="form-group">
				사원번호
				<input type="text" class="form-control" id="input" name="memNo" value="${param.empNo}" readonly="readonly">
			</div>
			<div class="form-group">
				이름
				<input type="text" class="form-control" id="input" name="name" value="${vo.name }">
			</div>
			<div class="form-group">
				패스워드
				<input type="password" class="form-control" id="input" placeholder="암호">
			</div>
			<div class="form-group">
				패스워드 확인
				<input type="text" class="form-control" id="input" name="pwd">
			</div>
			<div class="form-group">
				직무
				<input type="text" class="form-control" id="input" readonly="readonly">
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
		        <input type="text" name="hp2" class="form-control" id="input" 
		        	value="${vo.hp2 }" maxlength="4" title="휴대폰 가운데자리" style="width: 80px; display: inline-block;">-
		        <input type="text" name="hp3" class="form-control" id="input" 
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
				<input type="text" name="gender" class="form-control" id="input" value="${vo.gender }">
			</div>
			<div class="form-group">
				입사일
				<input type="text" name="hireDate" class="form-control" id="input" value="${date }" readonly="readonly">
			</div>
			<div class="form-group">
				주소
				<div id="divZip">
					<input type="text" name="zipcode" class="form-control" id="zipInput" 
						value="${vo.zipcode}" ReadOnly title="우편번호">
				</div>
		        	<input type="Button" value="우편번호 찾기" id="btZipcode" title="새창열림">
		        <div id="divZip">
			        <input type="text" name="address" class="form-control" id="zipInput" value="${vo.addr}" 
			        	ReadOnly title="주소">
	        	</div>
	        	<div id="divZip">
			        <input type="text" name="addressDetail" class="form-control" id="zipInput" 
			        	value="${vo.addrDetail}" title="상세주소">
	        	</div>
	        </div>
			
			<input type="submit" class="form-control" id="input" value="수정하기">
		</form>
	</div>
	
<%@include file="../inc/bottom.jsp"%>