<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/inc/top.do"></c:import>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/divForm/tableForm.css'/>"/>

<link rel="stylesheet" type="text/css" 
	href="<c:url value='/resources/css/divForm/divForm.css'/>"/>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
$(function(){
	/* highlight */
	$("#tableForm tr:gt(0)").hover(function(event) {
		$(this).addClass("highlight");
	}, function(event) {
		$(this).removeClass("highlight");
	});
	
}); //전체 function()

function pageProc(curPage){
	$('input[name=currentPage]').val(curPage);
	$('form[name=frmPage]').submit();
}

/* 신청 처리 */
function handleReserve(rvNo, mode) {
	if(mode == 'no') {
	var message = prompt("예약신청 거절의 이유를 적어주세요.");
		if(message!=null){
			location.href="<c:url value='/resource/handleReserve.do?rvNo="+rvNo+"&mode="+mode+"&message="+message+"'/>";
		}
	}else if(mode == 'yes') {
		location.href="<c:url value='/resource/handleReserve.do?rvNo="+rvNo+"&mode="+mode+"'/>";
	}
}

</script>

<style type="text/css">

/* 자원목록 */
#tableDivForm{
	font-size: 0.9em;
}

#searchLoc{
	text-align: right;
} 

#mainDiv article > div {
	float:left;
}

#RESbottom{
	position:absolute;
	width:100%;
    bottom:0;

}

#mainDiv button{
	border: 1px solid lightgray;
	font-size: 0.8em;
	
}

#mainDiv a {
	color:#858796;
	font-size: 0.9em;
	margin-left:3px;
	text-decoration: none;
	cursor: pointer;
}

#mainDiv a:hover{
	text-decoration: underline;
}

article{
	font-size: 1.25em;
}

/* 자원 상세보기 */
	.divSection{
		margin:10px;
	}
	
	#divContent{
		margin: 0 auto;
		font-size: 0.8em;
	}
	
	#divDesc{
		text-align: left;
	}
	
	#divResName{
		font-weight: bold;
		text-align: center;
		
	}
	
	#divButton{
		text-align: center;
		clear:both;
		margin: 10px;
		
	}
	
	#divButton > button{
		border-radius: 5px 5px 5px 5px;
		border: 1px solid #DCDDE3;
		margin-right: 5px;
	}
	
	#divImage{
		margin: 0 auto;
	}

	.orderImg{
		border:1px solid lightgray; 
		width:20px; 
		height:20px;
	}
	
	.orderImgHide{
		visibility:hidden;
	}
	
	#mainDiv h3{
		margin-bottom:10px;
		margin-left:15px;
	}
	
	#mainDiv header{
		margin-bottom: 15px;
	}
	
	
</style>

<section>
	<article>
	<!-- post방식으로 페이징 처리 -->
	<form action="<c:url value='/resource/manageReserve.do'/>" 
		name="frmPage" method="post">
		<input type="hidden" name="currentPage">
	</form>
		<header style="margin:15px">
			<h3 class="h3 mb-0 text-gray-800">
				예약처리<span></span>
			</h3>
		</header>
		<div id="mainDiv" class="col-xl-12 ">
			<div class="card shadow mb-4">
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">예약신청목록</h6>
				</div>
				<div id="tableDivForm">
					<table id="tableForm">
						<tr id="tableTrForm" class="card-header">
							<th>자원명</th>
							<th>종류</th>
							<th>이용예약시간</th>
							<th>신청부서</th>
							<th>신청자</th>
							<th>승인</th>
							<th>거절</th>
						</tr>
						<c:forEach var="rs" items="${rsList }">
							<tr>
								<td class="goDetail" id="${rs.resNo }">${rs.resName }</td>
								<td>${rs.rkKind }</td>
								<td>${rs.startDate } ${rs.startHour } ~ ${rs.endDate } ${rs.endHour }</td>
								<td>${rs.deptName }</td>
								<td>${rs.name}</td>
								<td><button onclick="handleReserve(${rs.rvNo}, 'yes')">승인</button></td>
								<td><button onclick="handleReserve(${rs.rvNo }, 'no')">거절</button></td>
							</tr>
						</c:forEach>
					</table>
				</div>
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