<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
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
	
#mainDiv form[name=frmSearch] * {
	font-size: 0.8em;
	border: 1px solid lightgray;
}

#mainDiv select[name=rvState] {
	height:28px;
}

#RESBottom{
	position:absolute;
	width:100%;
    bottom:0;
}

</style>

<section>
	<article>
		<!-- post방식으로 페이징 처리 -->
		<form action="<c:url value='/resource/historyReserveMain.do'/>" 
			name="frmPage" method="post">
			<input type="hidden" name="currentPage">
			<input type="hidden" name="rvState" 
				value="${param.rvState}">	
		</form>
		<div id="mainDiv" class="col-xl-12 ">
			<div class="card shadow mb-4">
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">자원이용현황</h6>
					<div style="text-align: right">
						<form name="frmSearch" method="post" action='<c:url value="/resource/historyReserveMain.do"/>'>
							<select name="rvState">
								<option value="" 
									<c:if test="${param.rvState=='' }">
					            		selected="selected"
					            	</c:if>
								>전체</option>
								<option value="yes"
									<c:if test="${param.rvState=='yes' }">
		            					selected="selected"
		            				</c:if>
								>승인</option>
								<option value="no"
									<c:if test="${param.rvState=='no' }">
					            		selected="selected"
					            	</c:if>
								>거절</option>
							</select>
							<input type="submit" value="검색">
						</form>
					</div>
				</div>
				<div id="tableDivForm">
					<table id="tableForm">
						<tr id="tableTrForm" class="card-header">
							<th>자원명</th>
							<th>종류</th>
							<th>이용시간</th>
							<th>이용부서</th>
							<th>신청자</th>
							<th>상태</th>
						</tr>
						<c:forEach var="rs" items="${rsList }">
							<tr>
								<td class="goDetail" id="${rs.resNo }">
								<a href="<c:url value='/resource/historyResName.do?resNo=${rs.resNo }'/>">${rs.resName }</a></td>
								<td><a href="<c:url value='/resource/historyResKind.do?rkNo=${rs.rkNo}'/>">${rs.rkKind }</a></td>
								<td>${rs.startDate } ${rs.startHour } ~ ${rs.endDate } ${rs.endHour }</td>
								<td>${rs.deptName }</td>
								<td>${rs.name}</td>
								<td>
									<c:if test="${rs.rvState == 'yes' }">
										승인
									</c:if>
									<c:if test="${rs.rvState == 'no' }">
										거절
									</c:if>
								</td>
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

<div id="RESBottom">
<%@include file="../inc/bottom.jsp"%>
</div>
