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
            	  $("#writeModal").css("visibility","visible");
	            	  $("#frm").submit(function() {
	            		  $.ajax({
	          				url:"<c:url value='/schedule/ajaxWrite.do'/>",
	          				type:"post",
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
	          				},
	          				error:function(xhr, status, error){
	          					alert(status + ", " + error);
	          				}
	          			});
	          		}); 
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
 	  /*
      select: function(arg) {
        console.log(
          'select',
          arg.startStr,
          arg.endStr,
          arg.resource ? arg.resource.id : '(no resource)'
        );
        $.ajax({
				url:"<c:url value='/schedule/ajaxWrite.do'/>",
				type:"post",
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
				}
			});
      },
      
      //날짜클릭
      dateClick: function(arg) {
    	$.ajax({
			url:"<c:url value='/schedule/ajaxWrite.do'/>",
			type:"post",
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
			}
		});
        
      },
      */
      
      
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
		   	 
		   	 /*
		   	window.open(contextPath+'/schedule/detailSchedule.do','detailSC',
			'width=500,height=500,left=0,top=0,location=yes,resizable=yes');
		   	 */
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
	
	$('.btn-danger').click(function() {
		event.preventDefault();
		$('#writeModal').hide();
	});
	
	$(".btn-primary").click(function() {
		if($('#title').val() == ''){
		event.preventDefault();
		alert("제목을 작성해주세요!");
		$('#title').focus();
		}else if($('#startDay').val() == ''){
			event.preventDefault();
			alert("시작일을 정해주세요!");
			$('#startDay').focus();
		}else if($('#endDay').val() == ''){
			event.preventDefault();
			alert("종료일을 정해주세요!");
			$('#endDay').focus();
		}
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
				
				<!-- 스케줄등록모델 -->
				<!-- style="display: none;" -->
				<div id="writeModal" class="msgbox" style="visibility: hidden;">
				<!-- action="<c:url value='scheduleWrite.do'/>" method="post"  -->
				<form id="frm">
					<div class="head">
						<span>스케줄 등록</span>
				    </div>
					<div class="body">
						<table>
							<tr>
								<td>
									<select title="타입선" id="place" class="form-control" name="place">
										<option value="1" style="color:#3788d8">업무관련</option>
										<option value="2" style="color:#008000">기타</option>
										<option value="3" style="color:#ff0000">휴가/연차</option>
										<option value="4" style="color:#ffa500">유연근무</option>
									</select>
									<input type="text" class="form-control" id="title" name="title" maxlength="100" 
										placeholder="제목"/>
								</td>
							</tr>
							<tr>
								<td>
									<div id="schedulePicker">
										<div style="float: left;">
											<input name="startDay" id="startDay" class="form-control" value="${scheduleVo.scheduleStart }" 
												placeholder="시작일"/>
											<div>STRAT</div>
										</div>
										<div style="float: right;">
											<input name="endDay" id="endDay" class="form-control" value="${scheduleVo.scheduleEnd }" 
												placeholder="종료일"/>
											<div>END</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<textarea class="form-control" id="content" name="content" style="width: 610px;height: 300px;" placeholder="내용">${scheduleVo.content }</textarea>
								</td>
							</tr>
						</table>
						<div style="text-align: center;">
							<button class="btn btn-primary">저장</button>
							<button class="btn btn-danger">취소</button>
						</div>
					</div>
				</form>
				</div>
			</div>
		</div>
	</div>
<%@include file="../inc/bottom.jsp" %>
