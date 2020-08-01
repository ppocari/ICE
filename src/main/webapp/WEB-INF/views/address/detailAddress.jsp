<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<script type="text/javascript">
	$(function(){
		$('input[type=button]').click(function(){
			location.href="<c:url value='/address/editAddress.do?adNo=${adVo.adNo}'/>";
		});
	});
</script>

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

.divForm span{
	display: inline-block;
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
	clear:none;
	width: 240px;
}

.divForm textarea {
	text-align: center;
	border: none;
}

.textareaSize{
	width: 610px;
	height: 100px;
	border: 1px solid lightgray;
}

.divForm select {
	border: 1px solid #DCDDE3;
	font-size: 0.9em;
}

.divForm input[type=button], input[type=reset] {
	font-size: 1.0em;
	margin-left: 5px;
	background-color: #f3f3f3;
	border:none;
	border-radius: 5px 5px 5px 5px;
	border: 1px solid gray;
}

#add_inputs {
	margin-left: 42.5%;
	border:none;
	/* text-align: center; */
}
</style>
<section>
	<article>
		<div class="col-xl-12 ">
			<header>
				<h3>
					주소록<span> > 상세보기 </span>
				</h3>
			</header>
			<div class="card shadow mb-4" style="height: 500px">
				<div class="divForm">
					<form method="post" action="<c:url value='/address/editAddress.do?adNo=${adVo.adNo }'/>">
						<fieldset>
							<legend>기본 정보</legend>
							<div>
								<span class="la_left">이름</span>
								<span class="etc">${adVo.name }</span>
								<span class="la_right">전화번호</span>
								<span class="etc">
									<c:if test="${!empty adVo.hp1 }">
										<span>${adVo.hp1 }</span> - 
										<span>${adVo.hp2 }</span> - 
										<span>${adVo.hp3 }</span>
									</c:if>
								</span>
							</div>
							<div>
								<span class="la_left">이메일</span>
								<span class="etc">
									<c:if test="${!empty adVo.email1 }">
										<span>${adVo.email1 }</span> @ 
										<span>${adVo.email2 }</span>
									</c:if>
								</span>
								<span class="la_right">회사명</span>
								<span class="etc">${adVo.company }</span>
							</div>
							<div>
								<span class="la_left">부서</span>
								<span class="etc">${adVo.deptName }</span>
								<span class="la_right">직책</span>
								<span class="etc">${adVo.posName }</span>
							</div>
							<div>
								<span class="la_left">그룹</span>
								<span class="etc">${adVo.groupName }</span>
							</div>

							<legend>추가 정보</legend>
							<div>
								<span class="la_left">주소</span>
								<span class="etc">${adVo.homeAddress }</span>
								<span class="la_right">홈페이지</span>
								<span class="etc">${adVo.homePage }</span>
							</div>
							<div>
								<span class="la_left">메신저</span>
								<span class="etc">${adVo.messenger }</span>
								<span class="la_right">SNS</span>
								<span class="etc">${adVo.SNS }</span>
							</div>
							<div>
								<span class="la_left">메모</span>
								<span class="textareaSize">${adVo.memo }</span>
							</div>
							<div id="add_inputs">
								<input type="button" value="수정"> 
								<input type="reset"	value="닫기">
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</article>
</section>
<%@include file="../inc/bottom.jsp"%>