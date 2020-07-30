<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<style type="text/css">
.divForm div, .divForm label, .divForm {
	font-size: 0.9em;
}

.divForm form, .divForm {
	width: 100%;
}

.divForm fieldset {
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
	margin-left: 60px;
	width: 90%;
	clear: both;
	border-bottom: 1px solid #eee;
	padding: 5px 0;
	overflow: auto;
}

.divForm .firstDiv {
	border-top: 2px solid #e2e2e2;
}

.divForm .sp1 {
	width: 20%;
	text-align: right;
	padding: 3px 15px 0 0;
	clear: left;
	font-weight: bold;
}

.la_left  {
	float: left;
	width: 20%;
	text-align: right;
	padding: 3px 15px 0 0;
	font-weight: bold;
}

.la_right {
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
	width: 71px;
}

.email{
	border: 1px solid #DCDDE3;
	width: 110px;
}

.divForm textarea {
	text-align: center;
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
<section>
	<article>
		<div class="col-xl-12 ">
			<header>
				<h3>
					주소록<span> > 추가하기 </span>
				</h3>
			</header>
			<div class="card shadow mb-4" style="height: 500px">
				<div class="divForm">
					<form method="post" action="<c:url value='/address/addAddress.do'/>">
						<fieldset>
							<legend>기본 정보</legend>
							<div>
								<label class="la_left">이름</label> 
								<input class="etc" type="text" name="name"> 
								<label class="la_right">전화번호</label> 
								<input class="hp" type="text" name="hp1"> -  
								<input class="hp" type="text" name="hp2"> -  
								<input class="hp" type="text" name="hp3">
							</div>
							<div>
								<label class="la_left">이메일</label> 
								<input class="email" type="text" name="email1"> @ 
								<input class="email" type="text" name="email2"> 
								<label class="la_right">회사명</label> 
								<input class="etc" type="text" name="company">
							</div>
							<div>
								<label class="la_left">부서</label> 
								<input class="etc" type="text" name="deptName">
								<label class="la_right">직책</label> 
								<input class="etc" type="text" name="posName">
							</div>
							<div>
								<label class="la_left">그룹 선택</label> 
								<select name="adgNo">
									<c:forEach var="adg" items="${adgList }">
										<option value="${adg.adgNo }">${adg.groupName }</option>
									</c:forEach>
								</select>
							</div>

							<legend>추가 정보</legend>
							<div>
								<label class="la_left">주소</label> 
								<input class="etc" type="text" name="homeAddress">
								<label class="la_right">홈페이지</label> 
								<input class="etc" type="text" name="homePage">
							</div>
							<div>
								<label class="la_left">메신저</label> 
								<input class="etc" type="text" name="messenger"> 
								<label class="la_right">SNS</label> 
								<input class="etc" type="text" name="SNS">
							</div>
							<div>
								<label class="la_left">메모</label><br>
								<textarea rows="3" cols="109" name="memo"></textarea>
							</div>
							<div id="add_inputs">
								<input type="submit" value="등록"> 
								<input type="reset"	value="취소">
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</article>
</section>
<%@include file="../inc/bottom.jsp"%>