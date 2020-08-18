<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value="/resources/css/sb-admin-2.min.css"/>" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css"/>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(function() {
	$("#frm").submit(function() {
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
	
	$("#schedulePicker input").datepicker({
	      dateFormat:'yy-mm-dd',
	         changeYear:true,
	         changeMonth:true,
	         dayNamesMin:['일','월','화','수','목','금','토'],
	         monthNamesShort: ['1월', '2월', '3월', '4월', '5월',
	         	'6월', '7월', '8월', '9월', '10월', '11월', '12월'],
   });
});
</script>

<style type="text/css">
	/*일정쓰기*/
	div#writeModal {
	    line-height: 30px;
	}
	
	h1#h1 {
	    margin: 0;
	    padding: 15px;
	    background: #4e73df;
	    color: white;
	    font-weight: bold;
	}
	
	#btDiv{
		width: 100%;
	    position: absolute;
	    bottom: 0;
	    border-top: 1px solid;
	    text-align: center;
	    padding: 20px;
	    background: #e8e8e8;
	}
	
</style>


<title>Insert title here</title>
</head>
<body>
	<!-- 스케줄등록모델 -->
	<!-- style="display: none;" -->
	<div id="writeModal" class="msgbox">
	<form id="frm" action="<c:url value='/schedule/writeScheduleBt.do'/>" method="post">
		<input type="hidden" name="memNo" value="${memNo}">
		<h1 id="h1">스케줄 등록</h1>
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
								<input name="startDay" id="startDay" class="form-control" value="${startDay}" 
									placeholder="시작일"/>
								<div>STRAT</div>
							</div>
							<div style="float: right;">
								<input name="endDay" id="endDay" class="form-control" value="${endDay}" 
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
			<div id="btDiv">
				<button class="btn btn-primary" id="save">저장</button>
				<button class="btn btn-danger">취소</button>
			</div>
		</div>
	</form>
	</div>
</body>

</html> 

