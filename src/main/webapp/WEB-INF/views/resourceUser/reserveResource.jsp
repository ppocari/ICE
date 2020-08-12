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
      customButtons: {
          add_event: {
              text: '일정추가',
              click: function() {
            	  $("#writeModal").css("visibility","visible");
            	  
	            	  $("#frm").submit(function() {
	            		  $.ajax({
	          				url:"<c:url value='/resourceUser/ajaxWrite.do'/>",
	          				type:"get",
	          				data:{
								resNo:27
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
				data:{
					resNo:27
				},
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
					resNo:27
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
	
	$('.writeClose').click(function() {
		event.preventDefault();
		 $("#writeModal").css("visibility","hidden");
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
		height: 450px;
		display: inline-block;
		float:left;
		border: 1px solid lightgray;
	}
	
	#resDetailDiv {
		text-align:center;
		width: 40%;
		margin: 20px;
		float:left;
		border: 1px solid lightgray;
	}
	
	.fc-license-message{
		visibility: hidden;
	}
</style>
<section>
	<article>
	<!-- Area Chart -->
	<div class="col-xl-12 " >
		<div class="card shadow mb-4" style="fit-content">
			<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
				<h5 class="m-0 font-weight-bold text-primary">자원 예약신청</h5>
			</div>
			<div id="detailAll">
			
		
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
					<img width="250" height="250" id="spanResImage" style="border: 1px solid lightgray" 
						src="<c:url value='/resource_file/${rmVo.resImage}'/>">
					</div>
					<div class="divSection" id="divDesc">
						<div>
							<span>장소: ${rmVo.resLocation }</span>
							<span id="spanResLocation">
							</span>
						</div>
						<div>
							<span>상태: ${rmVo.resState }</span>
							<span id="spanResState"></span>
						</div>
						<div>
							<span>자원설명: ${rmVo.resSubdesc }</span>
							<p id="spanResSubdesc">
								
							</p>
						</div>
					</div>
				</div>
			</div>
			
			
				<!-- 캘린더 -->
				<div class="calendar_back" >
					<div id='calendar'></div>
				</div>
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
							<tr>
								<td>
									<select title="타입선" id="place" name="place" style="height: 28px;">
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
											<input name="startDay" id="startDay" class="infobox" value="${scheduleVo.scheduleStart }"
												style="width: 192px" placeholder="시작일"/>
											<div>STRAT</div>
										</div>
										<div style="float: right;">
											<input name="endDay" id="endDay" class="infobox" value="${scheduleVo.scheduleEnd }"
												style="width: 192px" placeholder="종료일"/>
											<div>END</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<textarea class="infobox" id="content" name="content" style="width: 610px;height: 300px;" placeholder="내용">${scheduleVo.content }</textarea>
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
<%@include file="../inc/bottom.jsp" %>
