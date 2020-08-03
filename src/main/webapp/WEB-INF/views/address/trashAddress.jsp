<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
function pageProc(curPage){
	$('input[name=currentPage]').val(curPage);
	$('form[name=frmPage]').submit();
}

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

.divPage{
	text-align: center;
	margin: 10px;
}

</style>

<section id="addressMain_section">
	<form action="<c:url value='/address/trashAddress.do'/>" 
		name="frmPage" method="post">
		<input type="hidden" name="currentPage">
		<%-- input type="text" name="searchCondition" 
			value="${param.searchCondition}">
		<input type="text" name="searchKeyword" 
			value="${param.searchKeyword}">	 --%>
	</form>
	<header>

	</header>
	<article>
		<div class="col-xl-12 ">
			<div class="card shadow mb-4">
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">휴지통</h6>
				</div>
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
								<th  style="width:10%">이름</th>
								<th  style="width:15%">전화번호</th>
								<th  style="width:22%">이메일</th>
								<th  style="width:10%">그룹</th>
								<th  style="width:13%">회사명</th>
								<th  style="width:13%">부서</th>
								<th  style="width:10%">직책</th>
								<th style="width:10%">삭제일</th>
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
									<td class="isDeleted">
										<fmt:formatDate  value="${address.isDeleted}"
										pattern="yyyy-MM-dd"/>
									</td>
								</tr>
							</c:forEach>
							<!-- 반복 끝 -->
						</table>
					</div>
				</form>
				<!-- 페이지 번호 추가 -->		
				<!-- 이전 블럭으로 이동 ◀ -->
				<div class="divPage">
					<c:if test="${pagingInfo.firstPage>1 }">
						<a href="#" onclick="pageProc(${pagingInfo.firstPage-1})">
						<%-- 	<img src="<c:url value='/resources/images/first.JPG'/>" alt="이전 블럭으로 이동"> --%>
						◀
						</a>
					</c:if> 
					
					<!-- [1][2][3][4][5][6][7][8][9][10] -->
					<c:forEach var="i" begin="${pagingInfo.firstPage }" 
						end="${pagingInfo.lastPage }">		
						<c:if test="${i!=pagingInfo.currentPage }">
							<a href="#" onclick="pageProc(${i})">[${i}]</a>			
						</c:if>
						<c:if test="${i==pagingInfo.currentPage }">
							<span style="color:blue;font-weight:bold">${i}</span>			
						</c:if>		
					</c:forEach>
						
					<!-- 다음 블럭으로 이동 ▶ -->
					<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
						<a href="#" onclick="pageProc(${pagingInfo.lastPage+1})">
							<%-- <img src="<c:url value='/resources/images/last.JPG'/>" alt="다음 블럭으로 이동"> --%>
							▶
						</a>
					</c:if>
					<!--  페이지 번호 끝 -->
				</div>
			</div>
		</div>
	</article>
</section>
	<%@include file="../inc/bottom.jsp"%>
