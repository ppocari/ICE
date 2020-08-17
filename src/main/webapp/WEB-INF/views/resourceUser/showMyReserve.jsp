<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/divForm/tableForm.css'/>"/>
<link rel="stylesheet" type="text/css" 
	href="<c:url value='/resources/css/divForm/divForm.css'/>"/>
<script type="text/javascript">
function pageProc(curPage){
	$('input[name=currentPage]').val(curPage);
	$('form[name=frmPage]').submit();
}

function showReason(rvNo) {
	window.open('<c:url value="/resourceUser/rvCantReasonPopup.do?rvNo='+rvNo+'"/>', 'reasonPop', 
	'width=300, height=300, left=800, top=200, location=yes, resizable=yes');
}

$(function(){
	$('#addResource').click(function(){
		
	});
});
</script>

<style type="text/css">

/* 자원목록 */
#tableDivForm{
	font-size: 0.9em;
}

#searchLoc{
	text-align: right;
} 

article > div {
	float:left;
}

#RESbottom{
	clear:both;
}


button{
	border: 1px solid lightgray;
	font-size: 0.8em;
	
}

a {
	color:#858796;
	font-size: 0.9em;
	margin-left:3px;
	text-decoration: none;
	cursor: pointer;
}

a:hover{
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
	
	/* addReserve에서 가져옴 */
	body {
  	text-align: center;
    margin: 0;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
  }

	.calendar_back{
		background: white;
		float:left;
		text-align: center;
	}
	
    .fc-day-top.fc-sat.fc-past { color:#0000FF; }     	/* 토요일 */
    .fc-highlight { color:#0000FF; }     				/* 토요일 */
	td.fc-day-top.fc-sat.fc-future { color: blue;}		/* 토요일 */
    
    td.fc-day-top.fc-sun.fc-past { color: red;}			/* 일요일 */
    td.fc-day-top.fc-sun.fc-future { color: red;}		/* 일요일 */
    
    .fc-title {		/*이벤트 폰트 컬러 변경*/
	    color: white;
	}
	
	.msgbox{
		position: absolute;
	    left: -10%;
    	top: 10%;
	    z-index: 5000;
	    background: white;
	    border: 1px solid gray;
	}
	
	.head {
	    color: #fff;
	    border-bottom: 1px solid #f2f2f2;
	    background-color: #464646;
	}
	
	/*일정쓰기*/
	div#writeModal {
	    line-height: 30px;
	}
	
	/*일정확인*/
	div#modal {
	    width: 20%;
	    height: 35%;
	}
	
	div#modal_button {
	    margin-top: 64%;
	    margin-left: 15%;
	}
	
	#modal_button button {
	    width: 80px;
	}
	
	div#modal-title {
	    font-size: 2em;
	}
	
	.fc-content {
	    color: black;
	}
	
	#calendar{
		width: 500px;
		display: inline-block;
		border: 1px solid lightgray;
	}
	
	#resDetailDiv {
		text-align:center;
		margin: 20px;
	}
	
	.fc-license-message{
		visibility: hidden;
	}
	
	#spanResImage{
		width:250px; 
		height:250px; 
		border: 1px solid lightgray;
	}
	
	#RESbottom{
	clear:both;
}

article > div {
	float:left;
}

.la_left  {
	clear:both;
	float: left;
	width: 35%;
	text-align: right;
	padding: 3px 15px 0 0;
	font-weight: bold;
}

.fl{
	float:left;
}

#spanSubdesc{
	text-align: left;
	width: 200px;
}

.infobox{
	width: 120px;
	font-size: 0.9em;
}

#divMain{
	margin-left: 20px;
}

.aTag, .aTag:hover{
	color: #858796;
	
}

</style>

<section>
	<article>
	<!-- post방식으로 페이징 처리 -->
	<form action="<c:url value='/resourceUser/showMyReserve.do'/>" name="frmPage" method="post">
		<!-- 내 전체 이용 현황  -->
		<input type="hidden" name="currentPage">
		<input type="hidden" name="rsState" 
			value="${param.rsState}">	
	</form>
		<header>
			<h3>
				나의 자원 이용현황<span></span>
			</h3>
		</header>
		<!-- 내 예약 현황 -->
		<div id="divMain" class="col-xl-11 ">
			<div class="card shadow mb-4">
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">예약 신청 전체 현황</h6>
					<div style="text-align: right;">
						<span>상태</span>
						<form name="frmSearch" method="post" action='<c:url value="/resourceUser/showMyReserve.do"/>'>
							<select name="rvState">
								<option value="" 
									<c:if test="${param.rvState=='' }">
					            		selected="selected"
					            	</c:if>
								>전체</option>
								<option value="wait"
									<c:if test="${param.rvState=='wait' }">
					            		selected="selected"
					            	</c:if>
								>승인대기</option>
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
							<th>자원명
								<img class="orderImg" src="<c:url value='/resources/img/up.png'/>" alt="오름차순 이미지">
								<img class="orderImg" src="<c:url value='/resources/img/down.png'/>" alt="내림차순 이미지">
							</th>
							<th>종류
								<img class="orderImg" src="<c:url value='/resources/img/up.png'/>" alt="오름차순 이미지">
								<img class="orderImg" src="<c:url value='/resources/img/down.png'/>" alt="내림차순 이미지">
							</th>
							<th style="width:300px">신청시간</th>
							<th>상태</th>
							<th style="width:300px">거절사유</th>
						</tr>
						<c:forEach var="rs" items="${allList }">
							<tr>
								<td class="goDetail" id="${rs.resNo }">${rs.resName }</td>
								<td>${rs.rkKind }</td>
								<td>${rs.startDate } ${rs.startHour } ~ ${rs.endDate } ${rs.endHour }</td>
								<td>
									<c:if test="${rs.rvState == 'wait' }">
										대기
									</c:if>
									<c:if test="${rs.rvState == 'yes' }">
										승인
									</c:if>
									<c:if test="${rs.rvState == 'no' }">
										거절
									</c:if>
								</td>
								<td id="td_cantReason">
									<c:if test="${!empty rs.rvCantReason }">
										<a class="aTag" onclick="showReason(${rs.rvNo})">
											<c:if test="${fn:length(rs.rvCantReason)>20}">
												${fn:substring(rs.rvCantReason, 0, 20)} ...
											</c:if>
											<c:if test="${fn:length(rs.rvCantReason)<=20}">
												${rs.rvCantReason}
											</c:if>	
										</a>
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

<div id="RESbottom">
<%@include file="../inc/bottom.jsp"%>
</div>