<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

.search input {
	width: 150px;
}
</style>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
function pageProc(curPage){
	$('input[name=currentPage]').val(curPage);
	$('form[name=msgRecListFrm]').submit();
}

	$(function(){
		$("#dynamicTbody tr").click(function(){
			var no = $(this).children(0).val();	
			window.open('/ice/message/msgSendDetail.do?no='+no,'tr_val',
			'width=580,height=430,left=50,top=50,location=yes,resizable=yes');	
			
		});		

		$("#moveTomsgWrite").click(function(){
			
		});
		
	});
</script>


<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">보낸 쪽지함</h1>
	</div>

	<!-- Content Row -->
<form name="msgRecListFrm" method="post"
	action="<c:url value='/message/msgSendList.do'/> ">
	<input type="hidden" name="currentPage" > <input
		type="hidden" name="searchCondition"
		value="${param.searchCondition}"> <input type="hidden"
		name="searchKeyword" value="${param.searchKeyword}">
</form>
	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-10 ">
			<div class="card shadow mb-4" style="height: 700px">
				<!-- Card Header - Dropdown -->
				
				<form name="msgRecListFrm" method="post"
					action="<c:url value='/message/msgSendList.do'/> ">
					
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<div class="search" style="margin-right: 20px; text-align: right;">

							<select name="searchCondition" class="form-control"
								style="float: left; display: inline-block; width: 100px;">
								<option value="msgcontent"
									<c:if test="${param.searchCondition=='msgcontent' }">
							            		selected="selected"
							            	</c:if>>내용</option>
								<option value="recname"
									<c:if test="${param.searchCondition=='recname' }">
							            		selected="selected"
							            	</c:if>>받을
									사람</option>

							</select> <input type="text" class="form-control" name="searchKeyword"
								placeholder="검색어를 입력하세요"
								style="float: left; display: inline-block; width: 180px;">
							<button type="submit" class="btn btn-primary "
								style="float: left; display: inline-block;">검색</button>

						</div>
						<div style="float: right">
							<a href="<c:url value='/message/msgWrite.do'/>"> <input
								type="button" class="btn btn-info" value="쪽지쓰기">
							</a>
						</div>
					</div>
				</form>
				<!-- Card Body -->
				<div class="card-body" style="height: 570px;">

					<table class="table table-bordered table-condensed table-hover"
						id="dynamicTable">
						<colgroup>
							<col style="width: 5%;" />
							<col style="width: 15%;" />
							<col style="width: 55%;" />
							<col style="width: 15%;" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col"><input type="checkbox" id="checkAll"
									value="option1"></th>
								<th>받을 사람</th>
								<th>내용</th>
								<th>보낸 날짜</th>
							</tr>
						</thead>
						<tbody id="dynamicTbody">
							<!-- 게시판 내용 반복문시작 -->
							<c:set var="i" value="${1 }" />
							<c:forEach var="msgvo" items="${msgList }">
								<tr class="align_center" id="msgRecList${i }">
									<input type="hidden" value="${msgvo.no }"
										id="msgRecList_no${i}">
									<td><input type="checkbox" id="inlineCheckbox1"
										value="option1"></td>
									<td>${msgvo.recName}</td>
									<td class="align_left"><c:if
											test="${fn:length(msgvo.msgContent)>30 }">
													${fn:substring(msgvo.msgContent, 0, 30)} ...
												</c:if> <c:if test="${fn:length(msgvo.msgContent)<=30 }">
													${msgvo.msgContent}
												</c:if></td>
									<td><fmt:formatDate value="${msgvo.msgRegdate}"
											pattern="yyyy-MM-dd" /></td>
								</tr>

								<c:set var="i" value="${ i+1 }" />
							</c:forEach>
						</tbody>
					</table>
					<!-- 페이지 번호 추가 -->
					<!-- 이전 블럭으로 이동 ◀ -->
					<div class="divPage" style="text-align: center">
						<c:if test="${pagingInfo.firstPage>1 }">
							<a href="#" onclick="pageProc(${pagingInfo.firstPage-1})"> <%-- 	<img src="<c:url value='/resources/images/first.JPG'/>" alt="이전 블럭으로 이동"> --%>
								◀
							</a>
						</c:if>

						<!-- [1][2][3][4][5][6][7][8][9][10] -->
						<c:forEach var="i" begin="${pagingInfo.firstPage }"
							end="${pagingInfo.lastPage }">
							<c:if test="${i!=pagingInfo.currentPage }">
								<a href="#" onclick="pageProc(${i})">[${i}]</a>
							</c:if>
							<c:if test="${i==pagingInfo.currentPage }">
								<span style="color: blue; font-weight: bold">${i}</span>
							</c:if>
						</c:forEach>

						<!-- 다음 블럭으로 이동 ▶ -->
						<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
							<a href="#" onclick="pageProc(${pagingInfo.lastPage+1})"> <%-- <img src="<c:url value='/resources/images/last.JPG'/>" alt="다음 블럭으로 이동"> --%>
								▶
							</a>
						</c:if>
						<!--  페이지 번호 끝 -->
					</div>


				</div>
			</div>
		</div>
	</div>
</div>





	<!-- /.container-fluid -->
	<div></div>
	<div></div>

	<!-- End of Main Content -->

	<jsp:include page="../inc/bottom.jsp" />