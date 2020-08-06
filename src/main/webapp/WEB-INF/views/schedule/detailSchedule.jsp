<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/sb-admin-2.min.css"/>" rel="stylesheet">
<style type="text/css">
	/* 일정확인 */
	body{
		margin: 0;
	}
	/* 탑 */
	.head{
		background: #4e73df;
    	color: white;
	}
	
	.head p{
		margin: 0;
	    height: 55px;
	    padding: 10px;
	    font-size: 1.4em;
	    font-weight: bold;
	}
	
	.body {
	    padding-left: 10px;
	}
	
	
	/* 버튼 */
	div#modal_button {
        width: 100%;
	    position: absolute;
	    bottom: 0;
	    border-top: 1px solid;
	    text-align: center;
	    padding: 20px;
	    background: #e8e8e8;
	}
	
	#modal_button button {
	    width: 80px;
	    margin-right: 12px; 
	}
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css"/>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function() {
		$("#BtClose").click(function() {
			self.close();
		});
		$("#BtDelte").click(function() {
			if(confirm("정말 삭제하시겠습니까?")){
				location.href="<c:url value='/schedule/deleteSchedule.do?schNo="+${schNo}+"'/>";
			}
			event.preventDefault();
		});
		
		$("#startDay").datepicker({
		      dateFormat:'yy-mm-dd',
		         changeYear:true,
		         changeMonth:true,
		         dayNamesMin:['일','월','화','수','목','금','토'],
		         monthNamesShort: ['1월', '2월', '3월', '4월', '5월',
		         	'6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	   	});
		$("#endDay").datepicker({
		      dateFormat:'yy-mm-dd',
		         changeYear:true,
		         changeMonth:true,
		         dayNamesMin:['일','월','화','수','목','금','토'],
		         monthNamesShort: ['1월', '2월', '3월', '4월', '5월',
		         	'6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	   	});
		
	});

</script>
</head>
<body>
	<!-- 스케줄 글보기 모델 -->
	<form action="<c:url value='/schedule/scheduleUpdate.do'/>" >
		<div id="modal" class="msgbox">
			<div class="head">
				<p style="margin: 0; height: 50px;">일정수정</p>
		    </div>
			<div class="body">
				<input type="text" name="memNo" value="${memNo}">
				<input type="text" name="schNo" value="${schNo}">
				<div class="form-group">
				    <label>시작일 :</label>
			    	<input type="text" name="startDay" id="startDay" class="form-control" value="${startDay}">
				</div>
				<div class="form-group">
				    <label>종료일 :</label>
			    	<input type="text" name="endDay" id="endDay" class="form-control" value="${endDay}">
				</div>
				<div class="form-group">
				    <label>일정명 :</label>
				    <input type="text" name="title" class="form-control" value="${title}" placeholder="일정명을 입력하세요">
				</div>
				<div>
					<label>구분 :</label>
					<select class="form-control" id="place" name="place">
						<option value="1">업무관련</option>
						<option value="2">기타</option>
						<option value="3">휴가/연차</option>
						<option value="4">유연근무</option>
					</select>
				</div>
				<div>
					<label>설명 :</label>
					<textarea class="form-control" name="content" style="width: 400px;height: 100px;" placeholder="내용">
						${content}</textarea>
				</div>
			</div>
			<div id="modal_button">
				<button id="BtClose" class="btn btn-info">닫기</button>				
				<button id="BtDelte" class="btn btn-danger">삭제</button>				
				<button id="BtEdit" class="btn btn-primary">저장</button>				
			</div>
		</div>
	</form>
</body>
</html>