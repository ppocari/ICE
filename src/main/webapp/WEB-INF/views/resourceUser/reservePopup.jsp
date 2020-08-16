<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body>
<div id="writeModal" class="msgbox">
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
								<c:forEach var="pop" items="${popList }">
									
								</c:forEach>
							</select>
						<span> ~ </span>
							<input name="endDay" id="endDay" class="infobox" value="${scheduleVo.scheduleEnd }"
								placeholder="종료일"/>
							<select id="endHour">
								<c:set var="hId" value="0"/>
								<c:set var="hour" value="0"/>
								<c:forEach begin="1" end="24">
									<option id="hour${hId +50 }" value="${hour }:30">${hour }:30</option>
									<option id="hour${hId+100 }" value="${hour +1}:00">${hour +1}:00</option>
									
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
</body>
</html>