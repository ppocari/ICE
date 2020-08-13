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
      selectable: true,
      nowIndicator : true,
      eventLimit: true, // allow "more" link when too many events
      timeZone : 'local', //우리나라 시간맞춤
      buttonText:{ //버튼 텍스트 변환
    	today : '오늘',  
    	month : '월',  
    	week : '주',  
    	day : '일',  
    	list : '주간 일정표',  
    	  
      },
      
      //일정 버튼 추가하기
     /*  customButtons: {
          add_event: {
              text: '일정추가',
              click: function() {
            	  $("#writeModal").css("visibility","visible");
            	  
	            	  $("#frm").submit(function() {
	            		  $.ajax({
	          				url:"<c:url value='/resourceUser/ajaxWrite.do'/>",
	          				type:"get",
	          				data:{
								resNo:5
							},
	          				datatype:"json",
	          				data: $(this).serializeArray(),
	          				success:function(res){
	          					calendar.addEvent({
	          	                      title: res.title,
	          	                      start: res.startDay,
	          	                      end: res.endDay,
	          	                      id: res.schNo,
	          	                      allDay: false
	          	                    });
	          	                    alert('일정이 추가되었습니다!');
	          	                 	location.reload();
	          				},
	          				error:function(xhr, status, error){
	          					alert(status + ", " + error);
	          				}
	          			});
	          		}); 
              }
          }
      }, */
      
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'add_event,resourceTimeGridDay,resourceTimeGridTwoDay,timeGridWeek,dayGridMonth'
      },
      views: {
  		dayGrid :{
			titleFormat: {
  	    		year:'numeric',
  	    		month: '2-digit'
  	    	}
  		}
  	  },

      //// uncomment this line to hide the all-day slot
      //allDaySlot: false,
	
  	   resources: [
        { id: '${rmVo.rkNo}', title: '${rmVo.resName}', eventColor: 'orange'}
      ],
     
      //일정보여주기
      events: dataset,
      
 	/*   //드래그
      select: function(arg) {
        console.log(
          'select',
          arg.startStr,
          arg.endStr,
          arg.resource ? arg.resource.id : '(no resource)'
        );
        $.ajax({
				url:"<c:url value='/resourceUser/ajaxWrite.do'/>",
				type:"get",
				datatype:"json",
				data: $(this).serializeArray(),
				success:function(res){
					calendar.addEvent({
	                      title: res.title,
	                      start: res.startDay,
	                      end: res.endDay,
	                      allDay: false
	                    });
	                    alert('일정이 추가되었습니다!');
				},
				error:function(xhr, status, error){
					alert(status + ", " + error);
					alert('ddddd');
				}
			});
      }, */
      
      //날짜클릭
      dateClick: function(arg) {
    	  $("#writeModal").css("visibility","visible");
    	  $("#frm").submit(function() {
    		  $.ajax({
  				url:"<c:url value='/resourceUser/ajaxWrite.do'/>",
  				type:"get",
  				data:{
					resNo:5
				},
  				datatype:"json",
  				data: $(this).serializeArray(),
  				success:function(res){
  					calendar.addEvent({
  	                      title: res.title,
  	                      start: res.startDay,
  	                      end: res.endDay,
  	                      id: res.schNo,
  	                      allDay: false
  	                    });
  	                    alert('일정이 추가되었습니다!');
  	                 	location.reload();
  				},
  				error:function(xhr, status, error){
  					alert(status + ", " + error);
  				}
  			});
  		}); 
        
      }, 
      
      
      //일정 보여주기
       eventClick: function(info) {
    	  	var dbTitle = info.event.title;
    	  	var dbId = info.event.id;
		   	 $.ajax({
					url:"<c:url value='/schedule/ajaxDetail.do?dbId="+dbId+"'/>",
					type:"get",
					datatype:"json",
					success:function(res){
						var content = res.content;
						var startDay = res.startDay;
						var endDay = res.endDay;
						var place = res.place;
						var memNo = res.memNo;
window.open(contextPath+'/schedule/detailSchedule.do?title='+dbTitle+'&content='+content+'&place='+place+'&dbId='+dbId+'&startDay='+startDay+'&endDay='+endDay+'&memNo='+memNo+''
						,'detailSC',
            			'width=450,height=650,left=500,top=200,location=yes,resizable=yes');
					},
					error:function(xhr, status, error){
						alert(status + ", " + error);
					}
				});
		   	 
		   	 
		   	window.open(contextPath+'/schedule/detailSchedule.do','detailSC',
			'width=500,height=500,left=0,top=0,location=yes,resizable=yes');
		   	 
    	  	//$("#modal-title").text(dbTitle);
    	  	
    	    //borderColor 변경
    	    //info.el.style.borderColor = 'red';
    	    
   	  }, 
      
      // 한국어 설정
      locale: 'ko'
    });
    calendar.render();
  });
  
  $("#schedulePicker input").datepicker({
      dateFormat:'yy-mm-dd',
         changeYear:true,
         changeMonth:true,
         dayNamesMin:['일','월','화','수','목','금','토'],
         monthNamesShort: ['1월', '2월', '3월', '4월', '5월',
         	'6월', '7월', '8월', '9월', '10월', '11월', '12월'],
   });
	
	$('.writeClose').click(function() {
		event.preventDefault();
		 $("#writeModal").css("visibility","hidden");
	}); //캘린더
	
	/* 예약 시 datepicker에서 날짜 선택 시 select 자동 처리  */
	$('#startDay').change(function(){
		var pick = $(this).val();
		var no = ${rmVo.resNo};
		
		alert('pick='+pick+", no="+ no);
		
		 $.ajax({
				url:"<c:url value='/resourceUser/ajaxDatePicker.do'/>",
				type:"get",
				data:{ pickStart:pick, resNo:no },
				datatype:"json",
				success:function(res){
					/*  $("#startHour option[id='hour2.0']").prop("disabled", true); */
		            $.each(res , function(i){

		            	var pcikParts = pick.split('-');
						
		            	//pick를 date형식으로 바꾸기 -> pickDate
			            pickDate = new Date(pcikParts[0], parseInt(pcikParts[1], 10) - 1, pcikParts[2]);
	
		            	//pick날짜와 날짜비교를 위해 
		            	//pick과 vrStart와 vrEnd를 날짜단위로 환산함.
						var pickTime=pickDate.getTime()/1000/(60*60*24);
		            	var startTime=res[i].rvStart/1000/(60*60*24);
		            	var endTime=res[i].rvEnd/1000/(60*60*24);
		            	
		            	//pick과 vrStart의 차이, pick과 endTime의 차이
		            	var startGap=startTime-pickTime;
		            	var endGap=endTime-pickTime;
		            	
		            	//disabled하려고 하는 id인 'hour숫자'를 얻기 위해 시간,분을 얻음. 
		            	var startDate = new Date(res[i].rvStart);
		            	var endDate = new Date(res[i].rvEnd);
      							/*alert('year is ' + date.getFullYear());
      							alert('hour is ' + date.getHours());
      							alert('minute is ' + date.getMinutes()); */
      							
      							
      							/* var abc='hour700';
      							$('#startHour option[id='+abc+']').prop('disabled',true); */
      							
      							
         					if(startGap < 0 && endGap > 1) { //시작날짜 < 선택날짜, 끝날짜 > 선택날짜 ~ ~ 
		            		//모든 startid가 disabled
							
		            		
	            			/* 	$('#startHour option[id=hour100]').prop('disable',true);
	            				$('#startHour option[id=hour2000]').prop('disable',true);
	            				$('#startHour option[id=hour1500]').prop('disable',true); */
		            		
		            	/* 	alert("모든 실행~!") */
		            		var arrHourId = new Array(); //disabled하려는 id를 담는 배열.
	            			for(var i=0;i<48;i++){
	            				arrHourId[i]='hour'+50*i;
	            			}
	            			for(var i=0;i<48;i++){
	            				$('#startHour option[id='+arrHourId[i]+']').prop('disabled',true);
	            			}
	            			
		            	}else if(startGap < 0 && endGap <=1){ //시작날짜가 걸친 경우 ~ |
		            		//0~시작시간
		            		
		            		var endId=endDate.getHours()*100;
		            		if(startDate.getMinutes()==30){
		            			endId=endId+50;
		            		}
		            		
		            		var arrHourId = new Array(); //disabled하려는 id를 담는 배열.
		            		/* alert("0~시작 실행!, endId ="+endId);  */
		            		
		            		for(var i=0;i<endId/50;i++){
	            				arrHourId[i]='hour'+50*i;
	            			}
		            		
	            			for(var i=0;i<endId/50;i++){
	            				$('#startHour option[id='+arrHourId[i]+']').prop('disabled',true);
	            			}
		            		
		            	}else if(startGap >=0 && endGap <=1) { //선택날짜 내 시작날짜, 끝날짜가 들어감 | |
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
		            		
		            		for(var i=0;i<(endId-startId)/50;i++){
	            				arrHourId[i]='hour'+(startId+i*50);
	            			}
		            		
		            		for(var i=0;i<(endId-startId)/50;i++){
		            			$('#startHour option[id='+arrHourId[i]+']').prop('disabled',true);
	            			}
	            			
		            	}else if(startGap >=0 && endGap > 1){ //끝날짜가 걸친 경우 | ~
		            		//시작~24
		            		var startId=startDate.getHours()*100;
		            		
		            		if(startDate.getMinutes()==30){
		            			startId=startId+50;
		            		}
		            		var arrHourId = new Array(); //disabled하려는 id를 담는 배열.
		            		/* alert("시작~24 실행!, startId ="+ startId); */
		            		
		            		for(var i=0;i<(2400-startId)/50;i++){
	            				arrHourId[i]='hour'+(startId+50*i);
	            			}
	            			for(var i=0;i<(2400-startId)/50;i++){
	            				$('#startHour option[id='+arrHourId[i]+']').prop('disabled',true);
	            					
	            			}
	            		}
		            		
						
		           });
		            
				},
				error:function(xhr, status, error){
					alert(status + ", " + error);
				}
			}); 
		
	});
	
	
	
});
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
	    left: -30%;
    	top: 20%;
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
				<form id="frm">
					<div class="head">
						<span>등록 폼</span>
				    </div>
					<div class="body">
						<table>
							<tr><td>${rmVo.resName }</td></tr>
							<tr>
								<td>
									<div id="schedulePicker">
										<div>
											<input name="startDay" id="startDay" class="infobox" value="${scheduleVo.scheduleStart }"
												placeholder="시작일"/>
											<select id="startHour">
												<c:set var="hId" value="0"/>
												<c:set var="hour" value="0"/>
												<c:forEach begin="1" end="24">
													<option id="hour${hId}" >${hour }:00</option>
													<option id="hour${hId +50 }">${hour }:30</option>
														
													<c:set var="hId" value="${hId +100 }"/>
													<c:set var="hour" value="${hour +1 }"/>
												</c:forEach>
											</select>
										<span> ~ </span>
											<input name="endDay" id="endDay" class="infobox" value="${scheduleVo.scheduleEnd }"
												placeholder="종료일"/>
											<select id="endHour">
												<c:set var="hId" value="0"/>
												<c:set var="hour" value="0"/>
												<c:forEach begin="1" end="24">
													<option id="hour${hId +50 }">${hour }:30</option>
													<option id="hour${hId+100 }">${hour +1}:00</option>
													
													<c:set var="hId" value="${hId +100 }"/>
													<c:set var="hour" value="${hour + 1 }"/>
												</c:forEach>
											</select>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<textarea id="content" name="content" style="width: 610px;height: 300px;" placeholder="내용">
									
									${scheduleVo.content }</textarea>
								</td>
							</tr>
						</table>
						<div style="text-align: center;">
							<button class="writeBtn">저장</button>
							<button class="writeClose">Close</button>
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