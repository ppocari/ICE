<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
	var startDay = $("#scheduleStart").val();
	var endDay = $("#scheduleEnd").val();
	//var showWrite = $('#writeModal').show();
    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'resourceDayGrid', 'resourceTimeGrid' ],
      defaultView: 'dayGridMonth',
      defaultDate: '2020-07-18',
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
            	  $('#writeModal').show();
            	  
            	  var dateStr = prompt('Enter a date in YYYY-MM-DD format');
                  var date = new Date(dateStr + 'T00:00:00'); // will be in local time
                  if (!isNaN(date.valueOf())) { // valid?
                    calendar.addEvent({
                      title: '이제 그만 테스트할래...',
                      start: startDay,
                      end: endDay,
                      allDay: true
                    });
                    alert('일정이 추가되었습니다!');
                  }
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
        { id: 'a', title: 'Room A' },
        { id: 'b', title: 'Room B', eventColor: 'green' },
        { id: 'c', title: 'Room C', eventColor: 'orange' },
        { id: 'd', title: 'Room D', eventColor: 'red' }
      ],
      events:
    	  [
   	        { id: '1', resourceId: 'a', start: startDay, end: endDay, title: $("textarea#content").val() },
   	        { id: '2', resourceId: 'a', start: '2020-07-12T09:00:00', end: '2020-07-13T14:00:00', title: 'event 2' },
   	        { id: '3', resourceId: 'b', start: '2020-07-15T12:00:00', end: '2020-07-15T06:00:00', title: 'event 3' },
   	        { id: '4', resourceId: 'c', start: '2020-07-15T07:30:00', end: '2020-07-16T09:30:00', title: 'event 4' },
   	        { id: '5', resourceId: 'd', start: '2020-07-20T10:00:00', end: '2020-07-21T15:00:00', title: 'event 5' } 
 	  ],
  	
 	  //드래그
      select: function(arg) {
    	$('#writeModal').show();
        console.log(
          'select',
          arg.startStr,
          arg.endStr,
          arg.resource ? arg.resource.id : '(no resource)'
        );
        
        calendar.addEvent({
            title: 'title',
            start: startDay,
            end: endDay,
            allDay: true
         });
      },
      
      //날짜클릭
      dateClick: function(arg) {
    	$('#writeModal').show();
        console.log(
          'dateClick',
          arg.date,
          arg.resource ? arg.resource.id : '(no resource)'
        );
        calendar.addEvent({
            title: 'title',
            start: startDay,
            end: endDay,
            allDay: true
         });
        
      },
      
      //일정 보여주기
      eventClick: function(info) {
    	  	$('#modal').show();
    	  	
    	  	$('#modal-title').text(info.event.title);
    	  	$('#modal-contents').text($("textarea#content").val());
    	  	
    	  	
    	    // change the border color just for fun
    	    //info.el.style.borderColor = 'red';
   	  },
      
      // 한국어 설정
      locale: 'ko'
    });

    calendar.render();
    
  });
  
  $(function() {
	$('.BtClose').click(function() {
		$('#modal').hide();
	});
	
	$('.writeClose').click(function() {
		event.preventDefault();
		$('#writeModal').hide();
	});
	
	
	$('form[name=frm]').submit(function() {
		$('.infobox').each(function(idx,item) {
			if($(this).text().length()<1 ){
				alert($(this).prev().html()+"을(를) 입력하세요!");
				event.preventDefault();
				$(this).focus();
				return false;
			}
		});
	});
	
	$.ajax({
		url:"<c:url value='/schedule/ajaxWrite.do'/>",
		type:"get",
		datatype:"json",
		data:data,
		success:function(res){
			alert(res);
		},
		error:function(xhr, status, error){
			alert(status + ", " + error);
		},
	});
	
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
</style>
		<!-- 캘린더 -->
		<div class="calendar_back">
			<div id='calendar'></div>
		</div>
		
		<!-- style="display: none;" -->
		<!-- 스케줄 글보기 모델 -->
		<div id="modal" class="msgbox" style="display: none;">
			<div class="head">
				<div id="modal-title"></div>
		    </div>
			<div class="body">
				<div id="modal-contents"></div>
				<div id="modal_button">
					<button class="BtEdit">수정</button>				
					<button class="BtDelte">삭제</button>				
					<button class="BtClose">닫기</button>				
				</div>
			</div>
		</div>
		
		<!-- 스케줄등록모델 -->
		<!-- style="display: none;" -->
		<div id="writeModal" class="msgbox" style="display: none;">
		<form action="<c:url value='scheduleWrite.do'/>" method="post" name="frm">
			<div class="head">
				<span>등록 폼</span>
		    </div>
			<div class="body">
				<input type="hidden" name="empNo" value="1">
				<input type="hidden" name="scheduleNo" value="1">
				<table>
					<tr>
						<td>
							<select title="타입선" id="type" style="height: 28px;">
								<option value="1">업무관련</option>
								<option value="2">기타</option>
								<option value="3">휴가/연차</option>
								<option value="4">유연근무</option>
							</select>
							<input type="text" class="infobox" id="title" name="title" style="width: 529px" maxlength="100" placeholder="제목"/>
						</td>
					</tr>
					<tr>
						<td>
							<div id="schedulePicker">
								<div style="float: left;">
									<input type="date" name="scheduleStart" id="scheduleStart" class="infobox" value="${scheduleVo.scheduleStart }"
										style="width: 192px" placeholder="시작일"/>
									<div>STRAT</div>
								</div>
								<div style="float: right;">
									<input type="date" name="scheduleEnd" id="scheduleEnd" class="infobox" value="${scheduleVo.scheduleEnd }"
										style="width: 192px" placeholder="종료일"/>
									<div>END</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<textarea class="infobox" name="content" id="content" name="content" style="width: 610px;height: 300px;" placeholder="내용">${scheduleVo.content }</textarea>
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
		
		
<%@include file="../inc/bottom.jsp" %>
