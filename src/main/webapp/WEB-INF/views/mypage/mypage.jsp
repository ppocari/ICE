<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<style type="text/css">
	.noimg1 {
	    position: absolute;
	    border: 1px solid gray;
	}
	
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
	
	.imgbt {
	    position: absolute;
	    margin-top: 150px;
	}
	
	h1#change_h1 {
	    margin-left: 10%;
	    margin-top: 3%;
	}
	
	img#list{
		position: absolute;
		margin-left: 3%;
		margin-top: 1%;
	}
	
	.img_ch {
	    background: gray;
	    border: 1px solid gray;
	    color: white;
	}
	
	.imgAll {
	    margin-left: 5%;
	    margin-top: -13%;
	    position: absolute;
	}
	
	input#email1 {
    width: 15%;
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
	
	<img id="list" src="${pageContext.request.contextPath }/resources/img/list.jpg">
	<h1 id="change_h1">기본정보수정</h1>
	<form action="<c:url value='/mypage/mypage.do'/>" method="post" enctype="multipart/form-data">
		<div class="imgAll">
			<div class="noimg1">
				<img alt="" src="<c:url value='/resources/img/noimg.png'/>">
			</div>
			<div class="imgbt">
				<p>*120 X 150</p>
				<input type="file" value="사진변경" class="img_ch">
			</div>
		</div>
		<div class="center">
					
			
			<div class="data">
				<div>
					<label>사번</label><input type="text" name="memNo" value="${param.empNo}" readonly="readonly">
				</div>
				<div>
					<label>성명</label><input type="text" name="name" value="${vo.name }">
				</div>
				<div>
					<label>비밀번호</label><input type="text" name="pwd" value="${vo.pwd}">
				</div>
				<div>
					<label>비밀번호 확인</label><input type="text" name="pwd">
				</div>
				<div>
					<label>직무</label><input type="text" readonly="readonly">
				</div>
				<div>
					<label for="hp1">핸드폰</label>&nbsp;
			        <select name="hp1" id="hp1" title="휴대폰 앞자리" style="height: 45px;">
			            <option value="010">010</option>
			            <option value="011">011</option>
			            <option value="016">016</option>
			            <option value="017">017</option>
			            <option value="018">018</option>
			            <option value="019">019</option>
			       	</select>
			        -
			        <input type="text" name="hp2" id="hp2" value="${vo.hp2 }" maxlength="4" title="휴대폰 가운데자리"
			        	style="width: 80px;">-
			        <input type="text" name="hp3" id="hp3" value="${vo.hp3 }" maxlength="4" title="휴대폰 뒷자리"
			        	style="width: 80px;">
				</div>
				<div>
			        <label for="email1">이메일 주소</label>
			        <input type="text" name="email1" value="${vo.email1 }"  id="email1" title="이메일주소 앞자리">@
			        <select name="email2" id="email2" title="이메일주소 뒷자리" style="height: 45px;">
			            <option value="naver.com">naver.com</option>
			            <option value="hanmail.net">hanmail.net</option>
			            <option value="nate.com">nate.com</option>
			            <option value="gmail.com">gmail.com</option>
			            <option value="etc">직접입력</option>
			        </select>
			        <input type="text" name="email3" id="email3" title="직접입력인 경우 이메일주소 뒷자리"
			        	style="visibility:hidden">
			    </div>
				<div>
					<label>성별</label><input type="text" name="gender" value="${vo.gender }">
				</div>
				<div>
					<label>입사일</label><input type="text" name="hireDate" value="${date }" readonly="readonly">
				</div>
				<div id="div_zipcode">
					<label for="zipcode" id="lb_zipcode">주소</label>
			        <input type="text" name="zipcode" id="zipcode" value="${vo.zipcode}" ReadOnly title="우편번호">
			        <input type="Button" value="우편번호 찾기" id="Btzipcode" title="새창열림"><br/>
			        <input type="text" name="address" value="${vo.addr}" ReadOnly title="주소"><br/>
			        <input type="text" name="addressDetail" value="${vo.addrDetail}" title="상세주소">
		        </div>
			</div>
		</div>
		<input type="submit" value="수정하기">
	</form>
	
		
	
<%@include file="../inc/bottom.jsp"%>