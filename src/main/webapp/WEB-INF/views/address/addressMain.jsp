<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<%-- <jsp:include page="../inc/topAddress.jsp" flush="false"/> --%>

<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery-3.5.1.min.js">
	
</script>
<script type="text/javascript">
	$(function() {
		var selected = $(this).hasClass("highlight");

		$("#addressTable tr:gt(0)").hover(function(event) {
			$(this).addClass("highlight");
		}, function(event) {
			$(this).removeClass("highlight");
		});
	});
</script>

<%@include file="addressNav.jsp"%>
<%-- <jsp:include page="addressNav.jsp" flush="false"/> --%>

<section id="addressMain_section">
	<!-- 	<div class="col-xl-12 " >
			<div class="card shadow mb-4" style="height: 500px"> -->

	<header>
		<h3>
			주소록<span> > 내 주소록 </span>
		</h3>
	</header>
	<article>
		<div id="addressTableDiv">
			<table id="addressTable">
				<!-- <colgroup span="2" width="150px"></colgroup>
				<colgroup span="2" width="400px"></colgroup>
				<colgroup span="3" width="350px"></colgroup> -->
				<tr>
					<th><input type="checkbox" id="CheckAll" class="addressCB"></th>
					<th>이름</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>그룹</th>
					<th>부서</th>
					<th>직책</th>
				</tr>
				
				<!-- 반복 시작 -->
				<c:forEach var="address" items="${adList }">
					<tr>
						<td><input type="checkbox" class="addressCB"></td>
						<td>${address.name}</td>
						<c:if
							test="${empty address.hp1 }">
							<td></td>
						</c:if>
						<c:if
							test="${!empty address.hp1 }">
							<td>${address.hp1}- ${address.hp2} - ${address.hp3}</td>
						</c:if>
						<c:if test="${empty address.email1 }">
							<td></td>
						</c:if>
						<c:if
							test="${!empty address.email1 }">
							<td>${address.email1 }@${address.email2 }</td>
						</c:if>
						<c:if test="${empty address.groupName } ">
							<td></td>
						</c:if>
						<c:if test="${!empty address.groupName }">
							<td>${address.groupName}</td>
						</c:if>
						<c:if test="${empty address.deptName }">
							<td></td>
						</c:if>
						<c:if test="${!empty address.deptName }">
							<td>${address.deptName}</td>
						</c:if>
						<c:if test="${empty address.posName } ">
							<td></td>
						</c:if>
						<c:if test="${!empty address.posName }">
							<td>${address.posName}</td>
						</c:if>
					</tr>
				</c:forEach>
				<!-- 반복 끝 -->

			</table>
		</div>
		<div id="buttonsDiv">
			<input type="button" id="btDel" value="삭제"> <input
				type="button" id="btEdit" value="수정"> <input type="button"
				id="btSendNote" value="쪽지"> <input type="button"
				id="btSendEmail" value="이메일">
		</div>
	</article>
</section>

<div id="bottomAddress_div">
	<%@include file="../inc/bottom.jsp"%>
</div>