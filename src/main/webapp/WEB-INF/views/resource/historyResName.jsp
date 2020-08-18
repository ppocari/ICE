<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/divForm/tableForm.css'/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/divForm/divForm.css'/>"/>
<link href="<c:url value='/resources/fullcalendar/packages/core/main.css'/>" rel='stylesheet' />
<link href="<c:url value='/resources/fullcalendar/packages/daygrid/main.css'/>" rel='stylesheet' />
<link href="<c:url value='/resources/fullcalendar/packages/timegrid/main.css'/>" rel='stylesheet' />
<script src="<c:url value='/resources/fullcalendar/packages/core/main.js'/>"></script>
<script src="<c:url value='/resources/fullcalendar/packages/interaction/main.js'/>"></script>
<script src="<c:url value='/resources/fullcalendar/packages/daygrid/main.js'/>"></script>
<script src="<c:url value='/resources/fullcalendar/packages/timegrid/main.js'/>"></script>
<script src="<c:url value='/resources/fullcalendar/packages-premium/resource-common/main.js'/>"></script>
<script src="<c:url value='/resources/fullcalendar/packages-premium/resource-daygrid/main.js'/>"></script>
<script src="<c:url value='/resources/fullcalendar/packages-premium/resource-timegrid/main.js'/>"></script>


<script type="text/javascript">

	function pageProc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
	
	
	
	//들어오자 마자 일정 보여주기
	var contextPath = "/ice";
	var resNo=0;
	var dataset = [
		<c:forEach var="rsVo" items="${rsCal}">
			{
				title:'<c:out value="${rsVo.resName} ${rsVo.deptName}"/>',
				start:'<c:out value="${rsVo.rvStart}"/>',
				end:'<c:out value="${rsVo.rvEnd}"/>',
				resourceId:'<c:out value="${rsVo.resNo}"/>'
			},
		</c:forEach>
	];
		
	$(function() {
		$('#showKind').click(function(){
			location.href="<c:url value='/resource/historyResKind.do?rkNo="+${resVo.rkNo}+"'/>";	
		});	
		
		$('DOMContentLoaded', function() {
    		var calendarEl = document.getElementById('calendar');
	
			var calendar = new FullCalendar.Calendar(calendarEl, {
	 			plugins: [ 'interaction', 'resourceDayGrid', 'resourceTimeGrid' ],
	 			defaultView: 'dayGridMonth',
	 			defaultDate: new Date(),
	 			editable: false, //이거 false로 바꿈.
	 			selectable: false,
	 			nowIndicator : true,
	 			eventLimit: true, // allow "more" link when too many events
	 			timeZone : 'local', //우리나라 시간맞춤
	 			buttonText:{ //버튼 텍스트 변환
					today : '오늘',  
					month : '월',  
					week : '주',  
					day : '일',  
					list : '주간 일정표',  
	      		}, //buttonText
	      
	      		header: {
	        		left: 'prev,next today',
	        		center: 'title',
	        		right: 'add_event,resourceTimeGridDay,resourceTimeGridTwoDay,timeGridWeek,dayGridMonth'
	      		}, //header
	      		views: {
		  			dayGrid :{
						titleFormat: {
		  	    			year:'numeric',
		  	    			month: '2-digit'
		  	    		}
		  			}
	  	  		}, //views
	
				//// uncomment this line to hide the all-day slot
				//allDaySlot: false,
				resources: [
        			{ id: '${resVo.resNo}', title: '${resVo.resName}', eventColor: 'orange'}
	      		],
	     
	      		//일정보여주기
	      		events: dataset,
	      
				// 한국어 설정
				locale: 'ko'
    		}); //var calendar = new FullCalendar.Calendar(calendarEl, {
    	
    		calendar.render();
		}); //calendar 부분 끝! $('DOMContentLoaded', function() {
  
		$("#schedulePicker input").datepicker({
	    	dateFormat:'yy-mm-dd',
	        changeYear:true,
	        changeMonth:true,
	        dayNamesMin:['일','월','화','수','목','금','토'],
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월',
	         	'6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		});
		
	}); //$(function)
</script>

<style type="text/css">

/* 자원목록 */
#tableDivForm{
	font-size: 0.9em;
}

#searchLoc{
	text-align: right;
} 

#mainSection article > div {
	float:left;
}


#mainSection button{
	border: 1px solid lightgray;
	font-size: 0.8em;
	
}

#mainSection a {
	color:#858796;
	font-size: 0.9em;
	margin-left:3px;
	text-decoration: none;
	cursor: pointer;
}

#mainSection a:hover{
	text-decoration: underline;
}

article{
	font-size: 1.25em;
}

  #calendar {
    max-width: 900px;
  }

	.calendar_back{
		background: white;
		float:left;
		text-align: center;
		margin: 20px;
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
		
	}

	
	.fc-license-message{
		visibility: hidden;
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


	#RESbottom{
	 clear:both;
}

#headerTitle{
	margin: 15px;
}
</style>

<section id="mainSection">
	<article>
	<!-- post방식으로 페이징 처리 -->
	<form action="<c:url value='/resource/historyResName.do'/>" 
		name="frmPage" method="post">
		<input type="hidden" name="currentPage">
		<input type="hidden" name="resNo" 
			value="${param.resNo}">	
	</form>
	<header id="headerTitle">
		<h3>
			자원별 이용현황 > ${resVo.resName}<span></span>
		</h3>
	</header>
		<div class="col-xl-8 ">
			<div class="card shadow mb-4">
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">자원 이용/승인 목록</h6>
					<button id="showKind" type="button" class="btn btn-info"
						 >종류별로 보기</button>
				</div>
				<div id="tableDivForm">
					<table id="tableForm">
						<tr id="tableTrForm" class="card-header">
							<th>자원명</th>
							<th>이용시간</th>
							<th>신청부서</th>
							<th>신청자</th>
						</tr>
						<c:forEach var="rs" items="${rvResNoList }">
							<tr>
								<td>${rs.resName }</td>
								<td>${rs.startDate } ${rs.startHour } ~ ${rs.endDate } ${rs.endHour }</td>
								<td>${rs.deptName }</td>
								<td>${rs.name}</td>
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
		
		<!-- Area Chart -->
		<div class="col-xl-8 " >
			<div class="card shadow mb-4" style="fit-content">
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">자원 일정</h6>
				</div>
				<!-- 캘린더 -->
				<div class="calendar_back" >
					<div id='calendar'></div>
				</div>
			</div>
		</div>
	</article>
</section>

<div id="RESbottom">
<%@include file="../inc/bottom.jsp"%>
</div>