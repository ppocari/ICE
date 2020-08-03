<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>

<script type="text/javascript">
function pageProc(curPage){
	$('input[name=currentPage]').val(curPage);
	$('form[name=frmPage]').submit();
}

	$(function(){
		var selected = $(this).hasClass("highlight");

		/* highlight */
		$("#addressTable tr:gt(0)").hover(function(event) {
			$(this).addClass("highlight");
		}, function(event) {
			$(this).removeClass("highlight");
		});
		
		/* 수정 */
		$('#btEdit').click(function(){
			location.href="<c:url value='/address/editAddress.do'/>";
		});
		
		/* 추가 */
		$('#btAdd').click(function(){
			location.href="<c:url value='/address/addAddress.do'/>";
		});
		
		/* 삭제 여러개(휴지통으로 이동) */
		$('#btDel').click(function(){
			var len=$('input[type=checkbox]:checked').length;
			if(len==0){
				alert('삭제할 주소를 먼저 체크하세요');
				return;
			}
			$('form[name=addressList]')
				.prop("action","<c:url value='/address/trashMulti.do'/>");
			$('form[name=addressList]').submit();
		});	 

		/* 휴지통으로 이동 */
		$('#btTrash').click(function(){
			location.href="<c:url value='/address/trashAddress.do'/>";
		});

		/* 좋아요  하기 */
		$('.star').click(function(){
			var star_id=$(this).attr('id').split('_');
			var tx= $(this).text();
			alert(tx);
			if(tx == '★') { //좋아요라면, 좋아요 취소 처리하기
				$(this).text('☆');
				$(this).removeClass('star_color');
				
				$(function(){
					$.ajax({
						url:"<c:url value='/address/notFavorite.do'/>",
						type:"get",
						data:{
							adNo:star_id[0]
						}
					});
				});
				
			}else if(tx == '☆') { //좋아하지 않음이라면, 좋아요 처리하기
				$(this).text('★');
				$(this).addClass('star_color');
				
				$(function(){
					$.ajax({
						url:"<c:url value='/address/isFavorite.do'/>",
						type:"get",
						data:{
							adNo:star_id[0]
						}
					});
				});
			}
				
		});
		
		/* 좋아요 화면 처리 */
		$('.star').each(function(idx, item){
			var init=$(item).attr('id').split('_');
			if(init[1].length>0) {
				$(item).text('★');
				$(item).addClass('star_color');
			}
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

.star_color {
	color: orange;
}

.addressCB {
	width: 0.8em;
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
	text-align: left;
	font-size: 0.9em;
	margin-right: 5px;
}

#buttonsDiv input[type=button] {
	border: 1px solid lightgray;
	margin-right: 5px;
}

#buttonsDiv a {
	color:#858796;
	font-size: 0.9em;
	margin-left:3px;
	text-decoration: none;
	cursor: pointer;
}

#buttonsDiv a:hover{
	text-decoration: underline;
}

#spanAll{
	text-align: center;
}

#spanFir{
	float:left;
}

#spanThd{
	float:right;
}

/* 테이블에 마우스 올리면 효과 */
.highlight {
	background-color: #d1d3e2;
}

 
.highlight a {
	text-decoration: none;
	color:#858796;
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
	<!-- post방식으로 페이징 처리 -->
	<form action="<c:url value='/address/addressMain.do'/>" 
		name="frmPage" method="post">
		<input type="hidden" name="currentPage">
		<%-- input type="text" name="searchCondition" 
			value="${param.searchCondition}">
		<input type="text" name="searchKeyword" 
			value="${param.searchKeyword}">	 --%>
	</form>
	
	<article>
		<div class="col-xl-12 ">
			<div class="card shadow mb-4">
				<form name="addressList" method="post" action="">
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">주소록</h6>
						<div style="float: right">
							<button type="button" class="btn btn-info"
							 >주소 불러오기</button>
							<button type="button" class="btn btn-info"
							 >주소 내보내기</button>
						</div>
					</div>
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<div id="buttonsDiv">
							<div id="spanAll">
							<div id="spanFir">
								<input type="button" id="btAdd" value="추가">
								<input type="button" id="btDel" value="삭제">
							</div>
								<span>
									<a href="<c:url value='address/addressMain.do'/>">전체</a>
									<a href="<c:url value='address/addressMain.do?searchCondition="ga"'/>">가</a>
									<a href="<c:url value='address/addressMain.do?searchCondition="na"'/>">나</a>
									<a href="<c:url value='address/addressMain.do?searchCondition="da"'/>">다</a>
									<a href="<c:url value='address/addressMain.do?searchCondition="ra"'/>">라</a>
									<a href="<c:url value='address/addressMain.do?searchCondition="ma"'/>">마</a>
									<a href="<c:url value='address/addressMain.do?searchCondition="ba"'/>">바</a>
									<a href="<c:url value='address/addressMain.do?searchCondition="sa"'/>">사</a>
									<a href="<c:url value='address/addressMain.do?searchCondition="a"'/>">아</a>
									<a href="<c:url value='address/addressMain.do?searchCondition="ja"'/>">자</a>
									<a href="<c:url value='address/addressMain.do?searchCondition="cha"'/>">차</a>
									<a href="<c:url value='address/addressMain.do?searchCondition="ka"'/>">카</a>
									<a href="<c:url value='address/addressMain.do?searchCondition="ta"'/>">타</a>
									<a href="<c:url value='address/addressMain.do?searchCondition="pa"'/>">파</a>
									<a href="<c:url value='address/addressMain.do?searchCondition="ha"'/>">하</a>
									<a href="<c:url value='address/addressMain.do?searchCondition="etc"'/>">기타</a>
									<a href="<c:url value='address/addressMain.do?searchCondition="favorite"'/>">즐겨찾기</a>
								</span>
							<div id="spanThd">
								<input type="button" id="btEdit" value="설정">
								<input type="button" id="btTrash" value="휴지통">
							</div>
							</div>
						</div>
					</div>
					<div id="addressTableDiv">
						<table id="addressTable">
							<tr class="card-header">
								<th><input type="checkbox" id="CheckAll" class="addressCB"></th>
								<th class="star_color">★</th>
								<th  style="width:10%">이름</th>
								<th  style="width:15%">전화번호</th>
								<th  style="width:22%">이메일</th>
								<th  style="width:10%">그룹</th>
								<th  style="width:13%">회사명</th>
								<th  style="width:13%">부서</th>
								<th  style="width:10%">직책</th>
							</tr>
	
							<!-- 반복 시작 -->
							<c:set var="idx" value="0"/>
							<c:forEach var="address" items="${adList }">
								<tr>
									<td><input name="adItems[${idx }].adNo" value="${address.adNo }" type="checkbox" class="addressCB"></td>
									<td class="star" id="${address.adNo }_${address.isFavorite}" style="cursor:pointer">☆</td>
									<td><a href="<c:url value='/address/detailAddress.do?adNo=${address.adNo }'/>" class="addressName">${address.name}</a></td>
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
								</tr>
							</c:forEach>
							<!-- 반복 끝 -->
						</table>
					</div>
				</form>
				<div class="divPage">
				
				<!-- 페이지 번호 추가 -->		
				<!-- 이전 블럭으로 이동 ◀ -->
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
