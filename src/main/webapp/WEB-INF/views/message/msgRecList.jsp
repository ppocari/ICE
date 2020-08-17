<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/inc/top.do"></c:import>

<style>
.table td {
	width: 90px;
}

.table .registerTable {
	width: 90px;
	border: 1px solid white;
}

.register_text {
	width: 110px;
}
.search input{
	width:150px;
}


</style>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function(){
		
		
		$("#dynamicTbody tr").dblclick(function(){
			var no = $(this).children(0).val();
			window.open('/ice/message/msgRecDetail.do?no='+no,'tr_val',
			'width=580,height=430,left=50,top=50,location=yes,resizable=yes');	
			
		});	
		
		/* 삭제 여러개(휴지통으로 이동) */
		$('#btDel').click(function(){
			var len=$('input[type=checkbox]:checked').length;
			if(len==0){
				alert('삭제할 쪽지를  체크하세요');
				return;
			}
			$('form[name=msgRecListFrm]')
				.prop("action","<c:url value='/message/msgDelete.do'/>");
			$('form[name=msgRecListFrm]').submit();
		});	 
	});
</script>
<!-- Begin Page Content -->

<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">받은 쪽지함</h1>
	</div>

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-10 " >
			<div class="card shadow mb-4" style="height: 700px">
				<!-- Card Header - Dropdown -->
				<form name="msgRecListFrm" method="post"  
				action="<c:url value='/message/messageList.do?searchKeyWord=all'/> ">			
					<!-- 검색기능 -->
						<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">										
							<div style="float: right">
								<input type="button" id="btDel" class="btn btn-primary " value="휴지통으로 이동">				
								<a href="<c:url value='/message/msgWrite.do'/>">
									<input type="button"   class="btn btn-info" value="쪽지작성">
								</a>
							</div>
						</div>
					
					<!-- Card Body -->
					<div class="card-body">
						<div  style=" height:570px; overflow: scroll; overflow-x: hidden; ">
							<table class="table table-bordered table-condensed table-hover" id="dynamicTable">
								<thead>
									<tr>
										<th style="width:5%;">
											<input type="checkbox" id="checkAll" value="option1">
										</th>
										<th style="width:10%;">읽기 여부</th>
										<th style="width:10%;">보낸 사람</th>
										<th style="width:55%;">내용</th>
										<th style="width:20%;">보낸 날짜</th>
									</tr>
								</thead>
								<tbody id="dynamicTbody">
									<!-- 게시판 내용 반복문시작 -->
									
									
									<c:set var="i" value="${1 }" />
									<c:forEach var="msgvo" items="${msgList }">
										<c:if test="${empty msgvo}">
											<tr >
												<td colspan="5" align="center">받은 쪽지가 없습니다.</td>
											</tr>
										</c:if>
										<c:if test="${!empty msgvo}">
											<tr class="align_center" id="msgRecList${i }">
											<input type="hidden" value="${msgvo.no }" id="msgRecList_no${i}" name="msgItems[${i }].no">
											<td>
												<input type="checkbox" id="inlineCheckbox${i }" class="inlineCheckbox">
											</td>
											<td class="click">
												<c:if test = "${msgvo.msgStatus == 'N'}">
													<i class="fas fa-envelope" style="color: blue;" ></i>
												</c:if>
												<c:if test="${msgvo.msgStatus == 'Y'}">
													<i class="far fa-envelope" ></i>	
												</c:if> 
												
											</td>
											<td class="click">${msgvo.sendName}</td>
											<td class="align_left click">
												<!-- 제목보여주기 길면 일부 -->
												<c:if test="${fn:length(msgvo.msgContent)>30 }">
													${fn:substring(msgvo.msgContent, 0, 30)} ...
												</c:if>
												<c:if test="${fn:length(msgvo.msgContent)<=30 }">
													${msgvo.msgContent}
												</c:if>												
											</td>
											<td class="click"><fmt:formatDate value="${msgvo.msgRegdate}"
												pattern="yyyy-MM-dd"/> 
											</td>
										</tr>
										<c:set var="i" value="${ i+1 }" />
										</c:if>	
									</c:forEach>
								</tbody>
						</table>
										
						</div>
						
							
					</div>		
				</form>
				
				
			</div>
		</div>
	</div>
</div>






<!-- /.container-fluid -->
<div></div>
<div></div>

<!-- End of Main Content -->

<jsp:include page="../inc/bottom.jsp" />

