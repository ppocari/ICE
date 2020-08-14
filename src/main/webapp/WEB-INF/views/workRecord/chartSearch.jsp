<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form method="post" id="workChart" name="workChart" action="<c:url value='/workRecord/workChart.do'/>">
	<img alt="" src="<c:url value='/resources/img/workRecord/circle.jpg'/>">
	<label>연도</label>&nbsp;&nbsp;&nbsp;
	<select id="year" name="year">
		<option value="2019"
			<c:if test="${year=='2019'}">
			selected
			</c:if>
		>2019년</option>
		<option value="2020"
			<c:if test="${year=='2020'}">
			selected
			</c:if>
		>2020년</option>
	</select>
	<label>월</label>&nbsp;&nbsp;&nbsp;
	<select id="month" name="month">
		<option value="01"
			<c:if test="${month=='01'}">
			selected
			</c:if>
		>1월</option>
		<option value="02"
			<c:if test="${month=='02'}">
			selected
			</c:if>
		>2월</option>
		<option value="03"
			<c:if test="${month=='03'}">
			selected
			</c:if>
		>3월</option>
		<option value="04"
			<c:if test="${month=='04'}">
			selected
			</c:if>
		>4월</option>
		<option value="05"
			<c:if test="${month=='05'}">
			selected
			</c:if>
		>5월</option>
		<option value="06"
			<c:if test="${month=='06'}">
			selected
			</c:if>
		>6월</option>
		<option value="07"
			<c:if test="${month=='07'}">
			selected
			</c:if>
		>7월</option>
		<option value="08"
			<c:if test="${month=='08'}">
			selected
			</c:if>
		>8월</option>
		<option value="09"
			<c:if test="${month=='09'}">
			selected
			</c:if>
		>9월</option>
		<option value="10"
			<c:if test="${month=='10'}">
			selected
			</c:if>
		>10월</option>
		<option value="11"
			<c:if test="${month=='11'}">
			selected
			</c:if>
		>11월</option>
		<option value="12"
			<c:if test="${month=='12'}">
				selected
				</c:if>
			>12월</option>
		</select>
		<input type="submit" class="btn btn-primary" id="btSearch" value="조회">
</form>