<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/divForm/divForm.css'/>"/>
<script type="text/javascript">
	$(function(){
		$('input[type=submit]').click(function(){
			/* location.href="<c:url value='/address/editAddress.do?adNo=${adVo.adNo}'/>"; */
			window.open('<c:url value="/address/editAddress.do?adNo=${adVo.adNo}"/>', 'edit', 
			'width=600, height=900, left=600, top=30, location=yes, resizable=no');
			
			event.preventDefault();
		});
		
		$('input[type=reset]').click(function(){
			location.href="<c:url value='/address/addressMain.do'/>";
		});
	});
	
</script>

<style type="text/css">

.divForm span{
	display: inline-block;
}

.divForm textarea {
	border: none;
}

.textareaSize{
	width: 610px;
	height: 100px;
}

.ml{
	margin-left: 100px;
}

#add_inputs{
	margin-top: 10px;
	margin-bottom: 10px;
}

article{
	font-size:1.25em;
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
			<div class="card shadow mb-4">
				<div class="divForm">
					<form>
						<fieldset>
							<legend>기본 정보</legend>
							<div class="ml">
								<span class="la_left">이름</span>
								<span class="etc clear">${adVo.name }</span>
								<span class="la_right">전화번호</span>
								<span class="etc clear">
									<c:if test="${!empty adVo.hp1 }">
										<span>${adVo.hp1 }</span>
										-<span>${adVo.hp2 }</span>
										-<span>${adVo.hp3 }</span>
									</c:if>
								</span>
							</div>
							<div class="ml">
								<span class="la_left">이메일</span>
								<span class="etc clear">
									<c:if test="${!empty adVo.email1 }">
										<span>${adVo.email1 }</span>@<span>${adVo.email2 }</span>
									</c:if>
								</span>
								<span class="la_right">회사명</span>
								<span class="etc clear">${adVo.company }</span>
							</div>
							<div class="ml">
								<span class="la_left">부서</span>
								<span class="etc clear">${adVo.deptName }</span>
								<span class="la_right">직책</span>
								<span class="etc clear">${adVo.posName }</span>
							</div>
							<div class="ml">
								<span class="la_left">그룹</span>
								<span class="etc clear">${adVo.groupName }</span>
							</div>

							<legend>추가 정보</legend>
							<div class="ml">
								<span class="la_left">주소</span>
								<span class="etc clear">${adVo.homeAddress }</span>
								<span class="la_right">홈페이지</span>
								<span class="etc clear">${adVo.homePage }</span>
							</div>
							<div class="ml">
								<span class="la_left">메신저</span>
								<span class="etc clear">${adVo.messenger }</span>
								<span class="la_right">SNS</span>
								<span class="etc clear">${adVo.SNS }</span>
							</div>
							<div class="ml">
								<span class="la_left">메모</span>
								<span class="textareaSize">
									<%
										pageContext.setAttribute("newLine", "\r\n");
									%>
									${fn:replace(adVo.memo, newLine, '<br>')}
								</span>
							</div>
							<div id="add_inputs">
								<input class="borderStyle" type="submit" value="수정"> 
								<input class="borderStyle" type="reset" value="취소">
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</article>
</section>
<%@include file="../inc/bottom.jsp"%>