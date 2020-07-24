<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/topAddress.jsp"%>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/addressMain.css"/> --%>
<script type="text/javascript" 
	src="${pageContext.request.contextPath }\resources\vendor\jquery\jquery-3.5.1.min.js">
</script>
<script type="text/javascript">
$(function(){
	var selected = $(this).hasClass("highlight");
	
	$("#addressTable tr:gt(0)").hover(function(event) {
		$(this).addClass("highlight");
	},function(event){
		$(this).removeClass("highlight");
	});
});
	

</script>
<style type="text/css">


#addressSection {
	border-bottom: 1px solid lightgray; 
	padding-bottom: 20px;
}

#addressSection h3 {
	margin: 0px 0px 10px 20px;
}

#addressSection span {
	font-size: 18px;
}

#addressTableDiv{
	clear:both;
	width: 95%;	
	height: 100%;
	margin: 0 auto;
	border: 1px solid lightgray;
}

#addressTable{
	background-color: white;
	text-align:center;
}

.addressCB{
	margin-top:5px;
}

#addressTable th, td {
	border-bottom: 2px solid #f8f9fc;
	padding: 3px;
}

#addressTable{
	font-size:0.9em;
}


/* 맨 밑에 있는 버튼들 위치  */
#buttonsDiv {
	text-align:left;
	padding-top: 10px;
	padding-left: 30px;
}

#buttonsDiv > * {
	font-size: 0.9em;
	margin-right: 5px;
    border: 1px solid lightgray;
    text-decoration: none;
}

.highlight { 
	background-color: #a6bcfd; 
}
</style>

<section id="addressSection">
	<header><h3>주소록<span> > 내 주소록 </span></h3>
		
	</header>
	
	<article>
		<div id="addressTableDiv">
			<table id="addressTable">
				<colgroup span="2" width="150px"></colgroup>
				<colgroup span="2" width="400px"></colgroup>
				<colgroup span="3" width="350px"></colgroup>
				<tr>
					<th><input type="checkbox" id="CheckAll" class="addressCB"></th>
					<th>이름</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>그룹</th>
					<th>부서</th>
					<th>직책 </th>
				</tr>   
				<tr>
					<td><input type="checkbox" class="addressCB"></td>
					<td>홍길동</td>
					<td>010-2222-3333</td>
					<td>hong@naver.com</td>
					<td>과장</td>
					<td>영업부</td>
					<td>회사</td>
				</tr>
			</table>
		</div>
		<div id="buttonsDiv">	
			<input type="button" id="btDel" value="삭제">
			<input type="button" id="btEdit" value="수정">
			<input type="button" id="btSendNote" value="쪽지">
			<input type="button" id="btSendEmail" value="이메일">
		</div>
		<!-- 반복 시작 -->
		<!-- 반복 끝 -->	
		<hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr>
		<hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr>
		<hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr>
		<hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr>
		<hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr>
	</article>
</section>
		
<%@include file="../inc/bottomAddress.jsp"%>