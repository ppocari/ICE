<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/divForm/tableForm.css'/>"/>
<script type="text/javascript">

	$(function(){

		$('#addResource').click(function(){
			window.open('<c:url value="/resource/addResource.do"/>', 'addRes', 
					'width=600, height=500, left=800, top=200, location=yes, resizable=yes');
		});

		
		/* highlight */
		$("#tableForm tr:gt(0)").hover(function(event) {
			$(this).addClass("highlight");
		}, function(event) {
			$(this).removeClass("highlight");
		});
		
			
	});
	function resEdit(resNo) {
		location.href="<c:url value='/resource/editResource.do?resNo="+resNo+"'/>"
	}
	
	function resDel(resNo, resName) {
		var result=confirm("정말로 \'"+ resName +"\'을/를 삭제하시겠습니까?")
		if(result) {
			location.href="<c:url value='/resource/editResource.do?resNo="+resNo+"'/>";
		}
		
	}


</script>

<style type="text/css">

#searchLoc{
	text-align: right;
} 

article > div {
	float:left;
}

#RESbottom{
	clear:both;
}
</style>

<section>
	<article>
		<header>
			<h3>
				자원관리<span></span>
			</h3>
		</header>
		<div class="col-xl-7 ">
			<div class="card shadow mb-4">
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">자원목록</h6>
					<div style="float: right">
						<button id="addResource" type="button" class="btn btn-info"
						 >자원 추가</button>
					</div>
				</div>
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">

					<div id="buttonsDiv">
						<div id="searchLoc">
						<span>장소별</span>
							<select>
								<option value="">전체</option>
								<c:forEach var="loc" items="${locList }">
									<option>${loc.locName }</option>
								</c:forEach>
							</select>
							<input type="button" id="btAdd" value="검색">
						</div>
					</div>

				</div>
				<div id="tableDivForm">
						<table id="tableForm">
							<tr id="tableTrForm" class="card-header">

							<th>자원명</th>
							<th>장소</th>
							<th>상태</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
						<c:forEach var="rm" items="${manageList }">
							<tr>
								<td>${rm.resName }</td>
								<td>${rm.resLocation }</td>
								<td>${rm.resState }</td>
								<td><button onclick="resEdit(${rm.resNo})">수정</button></td>
								<td><button onclick="resDel(${rm.resNo }, '${rm.resName}')">삭제</button></td>

							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
		
		<div class="col-xl-4 ">
			<div class="card shadow mb-4">
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">예약처리</h6>
				</div>
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
				
				</div>
			</div>
		</div>
	</article>
</section>

<div id="RESbottom">
<%@include file="../inc/bottom.jsp"%>
</div>