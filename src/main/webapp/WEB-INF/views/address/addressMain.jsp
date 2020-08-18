<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/inc/top.do"/> 
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/divForm/tableForm.css'/>"/>
<script type="text/javascript">
function pageProc(curPage){
	$('input[name=currentPage]').val(curPage);
	$('form[name=frmPage]').submit();
}

	$(function(){
		
		$('#checkAll').click(function(){
			if($("#checkAll").is(":checked") == true) {
				$("input[type=checkbox]:checkbox").prop("checked", true);
			}else{
				$('#tableForm checkbox').prop("checked", false);
				$("input[type=checkbox]:checkbox").prop("checked", false);
			}
		});
			
		
		var selected = $(this).hasClass("highlight");

		/* highlight */
		$("#tableForm tr:gt(0)").hover(function(event) {
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

.star_color {
	color: orange;
} 


#addressMain_section{
	font-size: 1.25em;
}

#RESbottom{
	position:absolute;
	width:100%;
    bottom:0;
}
</style>

<section id="addressMain_section">
	<!-- post방식으로 페이징 처리 -->
	<form action="<c:url value='/address/addressMain.do'/>" 
		name="frmPage" method="post">
		<input type="hidden" name="currentPage">
		<input type="hidden" name="searchCondition" 
			value="${param.searchCondition}">
		<input type="hidden" name="searchKeyword" 
			value="${param.searchKeyword}">	
		<input type="hidden" name="nextKeyword" 
			value="${param.nextKeyword}">	
	</form>
	
	<article>
		<div class="col-xl-12 ">
			<div class="card shadow mb-4">
				<form name="addressList" method="post" action="">
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">주소록</h6>
						<div style="float: right">
							<button type="button" class="btn btn-info"
							 >주소 내보내기</button>
							<button type="button" id="btTrash" class="btn btn-info"
							 >휴지통</button>
						</div>
					</div>
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<div id="buttonsDiv">
							<div id="divAll">
							<div id="divLeft">
								<input type="button" id="btAdd" value="추가">
								<input type="button" id="btDel" value="휴지통으로 이동">
							</div>
								<span>
									<a href="<c:url value='/address/addressMain.do?searchCondition=all'/>">전체</a>
									<a href="<c:url value='/address/addressMain.do?searchCondition=kor&searchKeyword=가&nextKeyword=나'/>">가</a>
									<a href="<c:url value='/address/addressMain.do?searchCondition=kor&searchKeyword=나&nextKeyword=다'/>">나</a>
									<a href="<c:url value='/address/addressMain.do?searchCondition=kor&searchKeyword=다&nextKeyword=라'/>">다</a>
									<a href="<c:url value='/address/addressMain.do?searchCondition=kor&searchKeyword=라&nextKeyword=마'/>">라</a>
									<a href="<c:url value='/address/addressMain.do?searchCondition=kor&searchKeyword=마&nextKeyword=바'/>">마</a>
									<a href="<c:url value='/address/addressMain.do?searchCondition=kor&searchKeyword=바&nextKeyword=사'/>">바</a>
									<a href="<c:url value='/address/addressMain.do?searchCondition=kor&searchKeyword=사&nextKeyword=아'/>">사</a>
									<a href="<c:url value='/address/addressMain.do?searchCondition=kor&searchKeyword=아&nextKeyword=자'/>">아</a>
									<a href="<c:url value='/address/addressMain.do?searchCondition=kor&searchKeyword=자&nextKeyword=차'/>">자</a>
									<a href="<c:url value='/address/addressMain.do?searchCondition=kor&searchKeyword=차&nextKeyword=카'/>">차</a>
									<a href="<c:url value='/address/addressMain.do?searchCondition=kor&searchKeyword=카&nextKeyword=타'/>">카</a>
									<a href="<c:url value='/address/addressMain.do?searchCondition=kor&searchKeyword=타&nextKeyword=파'/>">타</a>
									<a href="<c:url value='/address/addressMain.do?searchCondition=kor&searchKeyword=파&nextKeyword=하'/>">파</a>
									<a href="<c:url value='/address/addressMain.do?searchCondition=kor&searchKeyword=하'/>">하</a>
									<a href="<c:url value='/address/addressMain.do?searchCondition=eng'/>">영어</a>
									<a href="<c:url value='/address/addressMain.do?searchCondition=num'/>">숫자</a>
									<a href="<c:url value='/address/addressMain.do?searchCondition=favorite'/>">즐겨찾기</a>
								</span>
							</div>
						</div>
					</div>
					<div id="tableDivForm">
						<table id="tableForm">
							<tr id="tableTrForm" class="card-header">
								<th><input type="checkbox" id="checkAll" class="addressCB"></th>
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
							
							<c:if test="${empty param.searchCondition}"> <!-- 조건이 없는데 -->
								<c:if test="${pagingInfo.totalRecord==0 }"> <!-- 등록된 주소가 없음 -->
									<tr><td colspan="8">등록된 주소가 없습니다.</td></tr>
								</c:if>
							</c:if>
							<c:if test="${!empty param.searchCondition}"> <!-- 조건이 있는데 -->
								<c:if test="${pagingInfo.totalRecord==0 }"> <!-- 등록된 주소가 없음 -->
									<tr><td colspan="8">조건에 맞는 주소가 없습니다.</td></tr>
								</c:if>
							</c:if>
							<c:if test="${pagingInfo.totalRecord !=0 }"><!-- 주소가 있음 -->
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
							</c:if> 
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
<div id="RESbottom">
	<%@include file="../inc/bottom.jsp"%>
</div>