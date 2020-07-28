<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>

<script type="text/javascript">
	$(function() {
		var selected = $(this).hasClass("highlight");

		$("#addressTable tr:gt(0)").hover(function(event) {
			$(this).addClass("highlight");
		}, function(event) {
			$(this).removeClass("highlight");
		});
		
		var isClicked=false;
		$('#btAdd').click(function(){
			
			$('#addOption').toggleClass('addOption_hidden');
		});
		
		$('#addFromOrgan').click(function(){
			window.open('<c:url value="/address/organizeChart.do"/>', 'organ', 
					'width=500, height=400, left=0, top=0, location=yes, resizable=yes');
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

#addressTableDiv span{
	
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

/* 맨 밑에 있는 버튼들 위치  */
#buttonsDiv {
	text-align: left;
	padding-top: 10px;
	padding-left: 30px;
}

#buttonsDiv>* {
	font-size: 0.9em;
	margin-right: 5px;
}

#buttonsDiv > input[type=button] {
	border: 1px solid lightgray;
}

#buttonsDiv a {
	color:#858796;
	font-size: 0.8em;
	margin-left:2px;
	text-decoration: none;
}

/* 테이블에 마우스 올리면 효과 */
.highlight {
	background-color: #a6bcfd;
}

.addOption_hidden{
	visibility:hidden;
}

.addressName{
	text-decoration: none;
	color:#858796;
}

</style>

<section id="addressMain_section">
	<div class="col-xl-12 ">
		<header>
			<h3>
				주소록<span> > 내 주소록 </span>
			</h3>
		</header>
		<div class="card shadow mb-4" style="height: 500px">

			<article>
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
						</tr>

						<!-- 반복 시작 -->
						<c:forEach var="address" items="${adList }">
							<tr>
								<td><input type="checkbox" class="addressCB"></td>
								<td><a href="#" class="addressName">${address.name}</a></td>
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
							</tr>
						</c:forEach>
						<!-- 반복 끝 -->
					</table>
				</div>
				<div id="buttonsDiv">
					<input type="button" id="btAdd" value="추가"> 
					<input type="button" id="btDel" value="삭제"> 
					<input type="button" id="btEdit" value="수정"> 
					<input type="button" id="btSendNote" value="쪽지"> 
					<input type="button" id="btSendEmail" value="이메일">
					<input type="button" id="btEditAddress" value="설정">
					<input type="button" id="btFavorite" value="즐겨찾기">
					<input type="button" id="btGet" value="연락처 불러오기">
					<input type="button" id="btSave" value="연락처 저장/내보내기">
					<input type="button" id="btDup" value="중복 연락처 정리하기">
					<input type="button" id="btTrash" value="휴지통">
					<br>
					<div id="addOption" class="addOption_hidden">
						<a href="#" id="addFromOrgan">>조직도에서 추가</a><br>
						<a href="<c:url value='/address/addAddress.do'/>">>직접추가</a>
					</div>
				</div>
			</article>
		</div>
	</div>
</section>
	<%@include file="../inc/bottom.jsp"%>
