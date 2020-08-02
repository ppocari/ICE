<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>

<script type="text/javascript">
	$(function() {
		var selected = $(this).hasClass("highlight");

		/* highlight */
		$("#addressTable tr:gt(0)").hover(function(event) {
			$(this).addClass("highlight");
		}, function(event) {
			$(this).removeClass("highlight");
		});
		
		/* 삭제 여러개 */
		$('#btDel').click(function(){
			var len=$('input[type=checkbox]:checked').length;
			if(len==0){
				alert('삭제할 주소를 먼저 체크하세요');
				return;
			}
			$('form[name=addressList]')
				.prop("action","<c:url value='/address/deleteMulti.do'/>");
			$('form[name=addressList]').submit();
		});	 
		
		/* 복원 여러개(Main으로 이동) */
		$('#btBack').click(function(){
			var len=$('input[type=checkbox]:checked').length;
			if(len==0){
				alert('삭제할 주소를 먼저 체크하세요');
				return;
			}
			$('form[name=addressList]')
				.prop("action","<c:url value='/address/backMulti.do'/>");
			$('form[name=addressList]').submit();
		});	 
		
		/* 주소록 이동 */
		$('#btAddressMain').click(function(){
			location.href="<c:url value='/address/addressMain.do'/>";
		});

	});
</script>

<style type="text/css">

/* 주소 테이블  */
#addressTableDiv {
	width: 95%;
	margin: 0 auto;
	padding: 5px;
	background-color: white;
} 

#addressTable {
	background-color: white;
	text-align: center;
}

.addressCB {
	margin-top: 5px;
}

#addressTable th, td {
	border-bottom: 2px solid #f8f9fc;
}

#addressTable tr:last-child { 
	border-bottom:3px solid white;
}

#addressTable {
	width: 100%;
	font-size: 0.9em;
}

/* 2번쨰 버튼들 위치  */
#buttonsDiv {
	width:100%;
}

#buttonsDiv>* {
	font-size: 0.9em;
	margin-right: 5px;
}

#buttonsDiv input[type=button] {
	border: 1px solid lightgray;
	margin: 5px;
}

#btAddressMain{
	float:right;
}

/* 테이블에 마우스 올리면 효과 */
.highlight {
	background-color: #d1d3e2;
}
 
.addOption_hidden{
	visibility:hidden;
}

.addressName{
	color:#858796;
	text-decoration: none;
}

</style>

<section id="addressMain_section">
	<header>
		<h3>
			주소록<span> > 휴지통 </span>
		</h3>
	</header>
	<article>
		<div class="col-xl-12 ">
			<div class="card shadow mb-4">
				<form name="addressList" method="post" action="">
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<div id="buttonsDiv">
							<input type="button" id="btBack" value="복원">
							<input type="button" id="btDel" value="삭제">
							<button id="btAddressMain" type="button" class="btn btn-info"
							 >주소록</button>
						</div>
					</div>
					<div id="addressTableDiv">
						<table id="addressTable">
							<tr class="card-header">
								<th><input type="checkbox" id="CheckAll" class="addressCB"></th>
								<th>이름</th>
								<th>전화번호</th>
								<th>이메일</th>
								<th>그룹</th>
								<th>회사명</th>
								<th>부서</th>
								<th>직책</th>
								<th>삭제일</th>
							</tr>
							<!-- 반복 시작 -->
							<c:set var="idx" value="0"/>
							<c:forEach var="address" items="${adList }">
								<tr>
									<td><input name="adItems[${idx }].adNo" value="${address.adNo }" type="checkbox" class="addressCB"></td>
									<td>${address.name}</td>
									<c:set var="idx" value="${idx +1 }"/>
									<c:if test="${empty address.hp1 }">
										<td></td>
									</c:if>
									<c:if test="${!empty address.hp1 }">
										<td>${address.hp1}-${address.hp2} - ${address.hp3}</td>
									</c:if>
									
									<c:if test="${empty address.email1 }">
										<td></td>
									</c:if>
									<c:if test="${!empty address.email1 }">
										<td>${address.email1 }@${address.email2 }</td>
									</c:if>
									<c:if test="${empty address.groupName }">
										<td class="groupName"></td>
									</c:if>
									<c:if test="${!empty address.groupName }">
										<td class="groupName">${address.groupName}</td>
									</c:if>
									<c:if test="${empty address.company }">
										<td class="company"></td>
									</c:if>
									<c:if test="${!empty address.company }">
										<td class="company">${address.company}</td>
									</c:if>
									
									<c:if test="${empty address.deptName }">
										<td class="deptName"></td>
									</c:if>
									<c:if test="${!empty address.deptName }">
										<td class="deptName">${address.deptName}</td>
									</c:if>
									<c:if test="${empty address.posName }">
										<td class="posName"></td>
									</c:if>
									<c:if test="${!empty address.posName }">
										<td class="posName">${address.posName}</td>
									</c:if>
									<td class="isDeleted">${address.isDeleted}</td>
								</tr>
							</c:forEach>
							<!-- 반복 끝 -->
						</table>
					</div>
				</form>
			</div>
		</div>
	</article>
</section>
	<%@include file="../inc/bottom.jsp"%>
