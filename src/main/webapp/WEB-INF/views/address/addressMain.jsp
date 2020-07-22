<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/topAddress.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/addressMain.css"/>
<script type="text/javascript" 
	src="${pageContext.request.contextPath }\resources\vendor\jquery\jquery-3.5.1.min.js">
</script>
<script type="text/javascript">
$(function(){
/* 	var selected = $(this).hasClass("highlight");
	
	$("#addressTable tr").hover(function(event) {
		$(this).addClass("highlight");
	},function(event){
		$(this).removeClass("highlight");
	}); */
});
	

</script>
<style type="text/css">

</style>
	<section id="addressSection">
		<div id="buttonsDiv">	
			<input type="checkbox" id="CheckAll">	
			<input type="button" id="btDel" value="삭제">
			<input type="button" id="btEdit" value="수정">
			<input type="button" id="btSendNote" value="쪽지">
			<input type="button" id="btSendEmail" value="이메일">
		</div>
		<div id="addressTableDiv">
		<table id="addressTable">
			<colgroup span="2" width="150px"></colgroup>
			<colgroup span="2" width="400px"></colgroup>
			<colgroup span="3" width="350px"></colgroup>
			<tr>
				<th><input type="checkbox"></th>
				<th>이름</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>그룹</th>
				<th>부서</th>
				<th>직책 </th>
			</tr>   
			<tr>
				<td><input type="checkbox"></td>
				<td>홍길동</td>
				<td>010-2222-3333</td>
				<td>hong@naver.com</td>
				<td>과장</td>
				<td>영업부</td>
				<td>회사</td>
			</tr>
		</table>
		</div>
		<!-- 반복 시작 -->
		<!-- 반복 끝 -->	

	</section>
		
<%@include file="../inc/bottom.jsp"%>