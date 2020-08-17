<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/inc/top.do"/> 

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
	var dataset = [
		<c:forEach var="citem" items="${list}">
			{
				title:'<c:out value="${citem.title}"/>',
				start:'<c:out value="${citem.startDay}"/>',
				end:'<c:out value="${citem.endDay}"/>',
				id:'<c:out value="${citem.schNo}"/>',
				resourceId:'<c:out value="${citem.resourceId}"/>'
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
      editable: true,
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
      customButtons: {
          add_event: {
              text: '일정추가',
              click: function() {
            	  window.open(contextPath+'/schedule/writeSchedule_button.do','wirteSC',
           			'width=612,height=608,left=500,top=200,location=yes,resizable=yes');
              }
          }
      },
      
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
        { id: 'a', title: 'Room A' , color:'orange'},
        { id: 'b', title: 'Room B', eventColor: 'green' , textColor: 'red'},
        { id: 'c', title: 'Room C', eventColor: 'red' ,color:'orange'},
        { id: 'd', title: 'Room D', eventColor: 'orange' }
      ],
  	
      //일정보여주기
      events: dataset,
      
 	  //드래그
      select: function(arg) {
        console.log(
          'select',
          arg.startStr,
          arg.endStr,
          arg.resource ? arg.resource.id : '(no resource)'
        );
        window.open(contextPath+'/schedule/writeSchedule_select.do?startDay='+arg.startStr+'&endDay='+arg.endStr,'wirteSC',
			'width=612,height=608,left=500,top=200,location=yes,resizable=yes');

      },
      
      //날짜클릭
      dateClick: function(arg) {
    	  window.open(contextPath+'/schedule/writeSchedule_date.do?startDay='+arg.dateStr+'&endDay='+arg.dateStr,'wirteSC',
 			'width=612,height=608,left=500,top=200,location=yes,resizable=yes');
        	
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
   	  },
      
      // 한국어 설정
      locale: 'ko'
    });
    calendar.render();
  });
  
	function draw() {
	  document.getElementById('canvas1');
	  document.getElementById('canvas2');
	  document.getElementById('canvas3');
	  document.getElementById('canvas4');
	}
});
</script>
<style>

  body {
    margin: 0;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 50px auto;
  }

	.calendar_back{
		background: white;
		width: 55%;
		margin: 0 auto;
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
	    left: 33%;
    	top: 30%;
	    z-index: 5000;
	    background: white;
	    border: 1px solid gray;
	}
	
	.head {
	    color: #fff;
	    border-bottom: 1px solid #f2f2f2;
	    background-color: #4e73df;
	    font-weight: bold;
	    font-size: 1.2em;
	    text-align: center;
	}
	
	/*색깔별 내용*/
	div#canvasDiv {
	    position: fixed;
	    margin-top: 10%;
	    margin-left: 5%;
	    width: 165px;
	    border: 1px solid gray;
	    padding: 10px;
	    background: #fcf8e3;
	}
	
	canvas{
		width: 30px;
	    height: 30px;
	    border: 1px solid;
	}
	#canvas1{
	    background: #3788d8;
	}
	#canvas2{
	    background: #008000;
	}
	#canvas3{
	    background: #ff0000;
	}
	#canvas4{
	    background: #ffa500;
	}
	
	
</style>
<input type="hidden" value="${vo.title}">
<input type="hidden" value="${vo.startDay}">
<input type="hidden" value="${vo.endDay}">
<input type="hidden" value="${vo.schNo}">
<div class="row">
	<!-- Area Chart -->
	<div class="col-xl-12 " >
		<div class="card shadow mb-4" style="fit-content">
			<!-- 스케줄 -->
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h5 class="m-0 font-weight-bold text-primary">스케줄</h5>
				</div>
				<!-- 색깔별 내용 -->
				<div id="canvasDiv">
					<div>
						<canvas id="canvas1"></canvas>&nbsp;&nbsp;&nbsp;&nbsp;<label style="font-size:1.7em;margin:0;">업무관련</label>	
					</div>
					<div>
						<canvas id="canvas2"></canvas>&nbsp;&nbsp;&nbsp;&nbsp;<label style="font-size:1.7em;margin:0;">기타</label>	
					</div>
					<div>
						<canvas id="canvas3"></canvas>&nbsp;&nbsp;&nbsp;&nbsp;<label style="font-size:1.7em;margin:0;">휴가</label>		
					</div>
					<div>
						<canvas id="canvas4"></canvas>&nbsp;&nbsp;&nbsp;&nbsp;<label style="font-size:1.7em;margin:0;">유연근무</label>			
					</div>
				</div>
				<!-- 캘린더 -->
				<div class="calendar_back">
					<div id='calendar'></div>
				</div>
			</div>
		</div>
	</div>
<%@include file="../inc/bottom.jsp" %>
