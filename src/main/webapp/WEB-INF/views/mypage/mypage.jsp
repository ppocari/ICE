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
	    margin-left: 147px;
	}
	
	.center {
	    margin-left: 250px;
	    margin-top: 80px;
	    background: white;
	    padding: 10px;
	    width: 57%;
	}
	
	label{
		font-weight: bold;
		float:left;
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
	}
	
	.data div span {
	    margin-left: 13%;
	}
	
	label#lb_zipcode {
	    position: absolute;
	    height: 154px;
	}
	#div_zipcode input[type=text] {
	    margin-left: 21%;
	}
	
	input#zipcode {
	    width: 15%;
	}
	
	input#Btzipcode {
	    width: 140px;
	    height: 40px;
	}
	
	.imgbt {
	    position: absolute;
	    margin-top: 150px;
	}
</style>

<nav class="navBar">
	<div id="accordion">
	  <h3>메뉴1</h3>
	  <div>
	    <p>
	    1
	    </p>
	  </div>
	  <h3>메뉴2</h3>
	  <div>
	    <p>
	    2
	    </p>
	  </div>
	  <h3>메뉴3</h3>
	  <div>
	    <p>
	    3
	    </p>
	  </div>
	  <h3>메뉴4</h3>
	  <div>
	    <p>
	    4
	    </p>
	  </div>
	</div>
	</nav>
	
	<div class="center">
		<div class="noimg1">
			<img alt="" src="<c:url value='/resources/img/noimg.png'/>">
		</div>
		<div class="imgbt">
			<p>*120 X 150</p>
			<button class="img_ch">사진 변경</button><br>
			<button class="reset">초기화</button>
		</div>
		<div class="data">
			<div>
			<label>사번</label><input type="text">
			</div>
			<div>
			<label>비밀번호</label><input type="text">
			</div>
			<div>
			<label>비밀번호 확인</label><input type="text">
			</div>
			<div>
			<label>성명</label><input type="text">
			</div>
			<div>
			<label>직무</label><input type="text">
			</div>
			<div>
			<label>성별</label><input type="text">
			</div>
			<div>
			<label>입사일</label><input type="text">
			</div>
			<div id="div_zipcode">
			<label for="zipcode" id="lb_zipcode">주소</label>
	        <input type="text" name="zipcode" id="zipcode" ReadOnly title="우편번호">
	        <input type="Button" value="우편번호 찾기" id="Btzipcode" title="새창열림"><br/>
	        <input type="text" name="address" ReadOnly title="주소"><br/>
	        <input type="text" name="addressDetail" title="상세주소">
			</div>
		</div>
	</div>

<%@include file="../inc/bottom.jsp"%>