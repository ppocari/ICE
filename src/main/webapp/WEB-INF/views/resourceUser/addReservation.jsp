<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="../inc/top.jsp" %>

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
	//들어오자 마자 일정 보여주기
	var contextPath = "/ice";
	var resNo=0;
	var dataset = [
		<c:forEach var="resNo" items="${rvResNoList}">
			{
				title:'<c:out value="${resNo.deptName}"/>',
				start:'<c:out value="${resNo.rvStart}"/>',
				end:'<c:out value="${resNo.rvEnd}"/>',
				resourceId:'<c:out value="${resNo.rkNo}"/>'
			},
		</c:forEach>
	];

	$(function() {
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
	        		{ id: '${rmVo.rkNo}', title: '${rmVo.resName}', eventColor: 'orange'}
	      		],
	     
	      		//일정보여주기
	      		events: dataset,
	      
	      		//날짜클릭
				dateClick: function(info) {
	    	 	$("#writeModal").css("visibility","visible");
	    	 	/*  alert('Clicked on: ' + info.dateStr); */
	    		/*   window.open('<c:url value="/resourceUser/reservePopup.do?resNo=${rmVo.rkNo}"/>',
	      			'width=450,height=650,left=500,top=200,location=yes,resizable=yes'); */
	      			
	      		/* 시작 날짜 선택 시 시작 select 자동 처리  */
	      		
					$('#startDay').change(function(){
					var pick = $(this).val();
					var no = ${rmVo.resNo};
					
					$('#endDay').val(pick);
					
					$('#startHour option').removeAttr("selected");
					$('#startHour option').prop('disabled',false);
					
					$('#endHour option').removeAttr("selected");
					$('#endHour option').prop('disabled',false);
					
					$('.fullRv').prop('disabled',true);
					$('.canRv').prop('selected',true);
					
					 $.ajax({
							url:"<c:url value='/resourceUser/ajaxStartPicker.do'/>",
							type:"get",
							data:{ pickStart:pick, resNo:no },
							datatype:"json",
							async: false,
							success:function(res){
								var count=0; //총 arrHourId[i]가 몇 번 돌아가는지, 첫번째를 찾기 위함.
					            $.each(res , function(i){
					            	//pick를 date형식으로 바꾸기 -> pickDate
						            var pickDate = new Date(pick);
					            	pickDate.setHours(0);
					            	var startDate = new Date(res[i].rvStart);
					            	var endDate = new Date(res[i].rvEnd);
			      					
					            	var py=pickDate.getYear();
					            	var sy=startDate.getYear();
					            	var ey=endDate.getYear();
					            	
					            	var pmon=pickDate.getMonth();
					            	var smon=startDate.getMonth();
					            	var emon=endDate.getMonth();
					            	
					            	var pd = pickDate.getDate();
					            	var sd = startDate.getDate();
					            	var ed = endDate.getDate();
					            	var sh = startDate.getHours();
					            	var eh = endDate.getHours();
					            	var sm = startDate.getMinutes();
					            	var em = endDate.getMinutes();
					            	
			         				if((sy!=py || ey!=py) || //년도가 다름
			         					(smon!=pmon || emon!=pmon) || //월이 다름
			         					(sd==pd && sh==0 && sm==0 && ed != pd) || // 같은 월 중 시작일 <= 기준일 < 완료일
			         					(sd != pd && ed==pd+1 && eh==0 && em==0) || // 같은 월 중 시작일 < 기준일 <= 완료일
			         					(sd < pd && ed > pd+1)) { //같은 월 중 시작일 < 기준일 < 완료일
			         					//남은 else if들은 시작일 <= 기준일 <=완료일
					            		//사용불가만 보여주게
					            		
					            		$('.startOption').prop('disabled',true);
					            		$('.endOption').prop('disabled',true);
					            		$('.fullRv').prop('disabled',false);
					            		$('.fullRv').prop('selected',true);
					            		
					            	}else if(sd != pd || (sd==pd && sh==0 && sm==0)){ //시작날짜가 걸친 경우 ~ |
					            	//0~끝
					            	
					            		var endId=endDate.getHours()*100;
					            		if(startDate.getMinutes()==30){
					            			endId=endId+50;
					            		}
					            		
					            		var arrHourId = new Array(); //disabled하려는 id를 담는 배열.
					            		
					            		for(var idx=0;idx<endId/50;idx++){
					            			arrHourId[idx]='hour'+50*idx;
				            			}
					            		
					            		for(var idx=0;idx<endId/50;idx++){
				            				$('#startHour option[id='+arrHourId[idx]+']').prop('disabled',true);
				            				$('#endHour option[id='+arrHourId[idx]+']').prop('disabled',true);
				            			}
					            		$('.canRv').prop('selected',true);
					            		$('.fullRv').prop('disabled',true);
					            		
					            	}else if(ed != pd || (ed==pd+1 && eh==0 && em==0)){ //끝날짜가 걸친 경우 | ~
					            		//시작~24
					            	
					            		var startId=startDate.getHours()*100;
					            		
					            		if(startDate.getMinutes()==30){
					            			startId=startId+50;
					            		}
					            		var arrHourId = new Array(); //disabled하려는 id를 담는 배열.
					            		
					            		for(var idx=0;idx<(2400-startId)/50;idx++){
				            				arrHourId[idx]='hour'+(startId+50*idx);
				            			}
					            		for(var idx=0;idx<(2400-startId)/50;idx++){
				            				$('#startHour option[id='+arrHourId[idx]+']').prop('disabled',true);
				            				$('#endHour option[id='+arrHourId[idx]+']').prop('disabled',true);
				            					
				            			}
					            		$('.canRv').prop('selected',true);
					            		$('.fullRv').prop('disabled',true);
				            		}else{ //선택날짜 내 시작날짜, 끝날짜가 들어감 | |
					            		//시작~끝
				            		
					            		var startId=startDate.getHours()*100;
					            		var endId=endDate.getHours()*100;
					            		
					            		if(startDate.getMinutes()==30){
					            			startId=startId+50;
					            		}
					            		if(endDate.getMinutes()==30){
					            			endId=endId+50;
					            		}
					            		var arrHourId = new Array(); //disabled하려는 id를 담는 배열.
					            		
					            		for(var idx=0;idx<(endId-startId)/50;idx++){
				            				arrHourId[idx]='hour'+(startId+idx*50);
				            			}
					            		
					            		for(var idx=0;idx<(endId-startId)/50;idx++){
					            			$('#startHour option[id='+arrHourId[idx]+']').prop('disabled',true);
					            			$('#endHour option[id='+arrHourId[idx]+']').prop('disabled',true);
				            			}
					            		$('.fullRv').prop('disabled',true);
					            		$('.canRv').prop('selected',true);
					            	}
					            		
			         				count++;
					           }); //$.each(function)
					            
							}, //success:function(res)
							error:function(xhr, status, error){
								alert(status + ", " + error);
							}
						}); //ajax
					}); //$('#startDay').change(function(){
				}, //dateClick: function(info) {
	      
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
		
		$('#writeClose').click(function() {
			event.preventDefault();
			$("#writeModal").css("visibility","hidden");
		}); 
		
		/* 시작 시간 선택 시 끝 select 자동 처리  */
		//같은 날로 날짜 자동 input 시키고, 무조건 가장 가까운 미래의 일정 1개를 가져와서 
		//같은 년, 월, 일이라면, 시작부터 그 날 끝까지 못하게
		//그 날에 없다면 기본 2시간 select 시키기
		$('#startHour').change(function(){
			var pick1=$('#startDay').val(); //시작 날짜 '2020-08-12'
			var pick2=$(this).val(); //시작 시간 '7:30'
			var pick=pick1 + ' ' + pick2; //'2020-08-12 7:30'
			var no = ${rmVo.resNo};
			
			
			$('#endHour option').removeAttr("selected");
			$('#endHour option').prop('disabled',false);
			
			$.ajax({
				url:"<c:url value='/resourceUser/ajaxEndPicker.do'/>",
				type:"get",
				data:{ pickStart:pick, resNo:no },
				datatype:"json",
				success:function(res){
			       	var pickDate = new Date(pick);
			        var startDate = new Date(res.rvStart);
			        
			        var py=pickDate.getYear();
	            	var sy=startDate.getYear();
	            	
	            	var pmon=pickDate.getMonth();
	            	var smon=startDate.getMonth();
	            	
	            	var pd = pickDate.getDate();
	            	var ph = pickDate.getHours();
	            	var pm = pickDate.getMinutes();
	            	var sd = startDate.getDate();
	            	var sh = startDate.getHours();
	            	var sm = startDate.getMinutes();
	            	
	            	
	            	//같은 년, 월, 일이라면, 시작부터 그 날 끝까지 못하게
	            	var startId=pickDate.getHours()*100;
            		if(pm==30){
            			startId=startId+50;
            		}
            		
            		var arrHourId = new Array(); //disabled하려는 id를 담는 배열.
            		
            		
            		for(var idx=0;idx<startId/50;idx++){
            			arrHourId[idx]='hour'+50*idx;
        			}
            		
            		for(var idx=0;idx<startId/50;idx++){
        				$('#endHour option[id='+arrHourId[idx]+']').prop('disabled',true);
        			}
	        		
	            	if(sy==py && smon==pmon && sd==pd) {
	            		//시작~24
		            	
	            		var startId=startDate.getHours()*100;
	            		
	            		if(startDate.getMinutes()==30){
	            			startId=startId+50;
	            		}
	            		var arrHourId = new Array(); //disabled하려는 id를 담는 배열.
	            		
	            		for(var idx=0;idx<(2400-startId)/50;idx++){
            				arrHourId[idx]='hour'+(startId+50*idx);
            			}
	            		for(var idx=0;idx<(2400-startId)/50;idx++){
            				$('#endHour option[id='+arrHourId[idx]+']').prop('disabled',true);
            					
            			}
	            	}
	            	
				}, //success
				
				error:function(xhr, status, error){
					alert(status + ", " + error);
				} //error
			}); //ajax 
			
		}); //$('#startHour').change(function(){
		
	}); //$(function)
</script>
<style>

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

</style>
<section>
	<article>
	<!-- Area Chart -->
	<div class="col-xl-6 " >
		<div class="card shadow mb-4" style="fit-content">
			<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
				<h5 class="m-0 font-weight-bold text-primary">자원 예약신청</h5>
			</div>
			
				<!-- 자원 상세보기 -->
				<div id="resDetailDiv">
					<div>
						<span>${rmVo.resName }</span>
					</div>
					<div class="divSection" id="divResName">
						<span id="spanResName"></span>
					</div>
					<div id="divContent">
						<div class="divSection" id="divImage">
							<c:if test="${!empty rmVo.resImage }">
								<img id="spanResImage" src="<c:url value='/resource_file/${rmVo.resImage}'/>">
							</c:if>
						</div>
						<div class="divSection" id="divDesc">
							<div>
								<span class="la_left">종류:</span> 
								<span class="fl">${rmVo.rkKind }</span>
							</div>
							<div>
								<span class="la_left">장소: </span>
								<span class="fl">${rmVo.resLocation }</span>
							</div>
							<div>
								<span class="la_left">상태: </span>
								<span class="fl">${rmVo.resState }</span>
								<span class="fl" id="spanResState"></span>
							</div>
							<div>
								<span class="la_left">자원설명: </span>
								<span id="spanSubdesc" class="fl">
									<%
										pageContext.setAttribute("newLine", "\r\n");
									%>
									
									${fn:replace(rmVo.resSubdesc, newLine, '<br>')}
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-6 " >
			<div class="card shadow mb-4" style="fit-content">
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h5 class="m-0 font-weight-bold text-primary">자원 예약신청</h5>
				</div>
				<!-- 캘린더 -->
				<div class="calendar_back" >
					<div id='calendar'></div>
				</div>
				<!-- 스케줄등록모델 -->
				<!-- style="display: none;" -->
				<div id="writeModal" class="msgbox" style="visibility: hidden;">
				<!-- action="<c:url value='scheduleWrite.do'/>" method="post"  -->
				<form id="frm" method="post" action="<c:url value='/resourceUser/addReservation.do'/>">
				<input name="resNo" type="hidden" value="${rmVo.resNo }">
	<div class="head">
		<span>자원 예약</span>
    </div>
	<div class="body">
		<table>
			<tr><td>${rmVo.resName }</td></tr>
			<tr>
				<td>
					<div id="schedulePicker">
						<div>
							<input name="startDate" id="startDay" class="infobox" value="${scheduleVo.scheduleStart }"
								placeholder="시작일"/>
							<select id="startHour" name="startHour">
								<option class="startOption canRv">시간선택</option>
								<c:set var="hId" value="0"/>
								<c:set var="hour" value="0"/>
								<c:forEach begin="1" end="24">
									<option class="startOption" id="hour${hId}" value="${hour }:00" >${hour }:00</option>
									<option class="startOption" id="hour${hId +50 }" value="${hour }:30">${hour }:30</option>
										
									<c:set var="hId" value="${hId +100 }"/>
									<c:set var="hour" value="${hour +1 }"/>
								</c:forEach>
								<option class="fullRv">예약불가</option>
							</select>
						<span> ~ </span>
							<input name="endDate" id="endDay" class="infobox" value="${scheduleVo.scheduleEnd }"
								placeholder="종료일"/>
							<select id="endHour" name="endHour">
								<option class="endOption canRv">시간선택</option>
								<c:set var="hId" value="0"/>
								<c:set var="hour" value="0"/>
								<c:forEach begin="1" end="24">
									<option class="endOption" id="hour${hId }" value="${hour }:30">${hour }:30</option>
									<option class="endOption" id="hour${hId+50 }" value="${hour +1}:00">${hour +1}:00</option>
									
									<c:set var="hId" value="${hId +100 }"/>
									<c:set var="hour" value="${hour + 1 }"/>
								</c:forEach>
								<option class="fullRv">예약불가</option>
							</select>
						</div>
					</div>
				</td>
			</tr>
		</table>
		<div>
			<textarea id="content" name="rvReason" style="width: 400px;height: 200px;" placeholder="예약이유"></textarea>
		</div>
		<div style="text-align: center;">
			<input type="submit" value="예약신청">
			<input id="writeClose" type="reset" value="취소">
		</div>
	</div>
</form>
				</div>
			</div>
		</div>
	</article>
</section>
<div id="RESbottom">
<%@include file="../inc/bottom.jsp"%>
</div>