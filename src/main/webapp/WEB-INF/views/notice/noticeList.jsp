<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../inc/top.jsp" />

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
	function pageProc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
	
	$(function(){
		$('.divList table.box2 tbody tr').hover(function(){
			$(this).css('background','skyblue')
					.css('cursor','pointer');
		}, function(){
			$(this).css('background','');
		});
	});
</script>
<!-- Begin Page Content -->

<form action="<c:url value='/notice/noticeList.do'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="currentPage">
	<input type="hidden" name="searchCondition" 
		value="${param.searchCondition}">
	<input type="hidden" name="searchKeyword" 
		value="${param.searchKeyword}">	
</form>

<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">공지사항 목록</h1>
	</div>

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-12 " >
			<div class="card shadow mb-4" style="height: 560px;">
				<!-- Card Header - Dropdown -->
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">공지사항</h6>
						
						<c:if test="${sessionScope.identNum == '999999' }">
							<a href="<c:url value='/notice/noticeWrite.do'/>">
								<button type="button" class="btn btn-info" style="float: right;"
								 >공지사항 작성</button>
							</a>
						</c:if>	
						
					</div>
					
					
					<!-- Card Body -->
					<div  style="height: 400px;">
						<div class="chart-area" style="height: 450px; font-size: 13px;">

							<div class="divList" style="width:98%;margin-left: 1%;margin-top: 1%;">
								<table class="table table-bordered table-hover" id="dynamicTable">
									<colgroup>
										<col style="width:15%;"/>
										<col style="width:60%;"/>
										<col style="width:15%;"/>
										<col style="width:10%;"/>
									</colgroup>
									<thead>
										<tr style="height:0px;">
											<th scope="col">부서</th>
											<th scope="col">제목</th>
											<th scope="col">작성일</th>
											<th scope="col">조회수</th>
										</tr>
									</thead>
									<tbody id="dynamicTbody">
										<!-- 게시판 내용 반복문시작 -->
										<c:forEach var="vo" items="${list }">
											<input type="hidden" name="noticeNo" value="${vo.noticeNo }">		
								
											<tr class="align_center">
												<td>${vo.category}</td>
												<td class="align_left">
													
													<!-- 조회수 올리기 -->
													<%-- /notice/noticeCountUpdate.do?no=${vo.no} --%>
													<a href 
										="<c:url value="/notice/noticeCountUpdate.do?noticeNo=${vo.noticeNo }"/>">
														
														<c:if test="${fn:length(vo.title)>30 }">
															${fn:substring(vo.title, 0, 30)} ...
														</c:if>
														<c:if test="${fn:length(vo.title)<=30 }">
															${vo.title}
														</c:if>
													</a>
													
													<!-- 24시간 공지사항  new 이미지-->
													<c:if test="${vo.newImgTerm<24 }">
														<img src="<c:url value='/resources/img/new.gif' />" 
															alt="new이미지">
													</c:if>
												</td>
												<td style="font-size:10px;"><fmt:formatDate value="${vo.regdate}"
													pattern="yyyy-MM-dd-HH:mm"/></td>
												<td>${vo.readcount}</td>
											</tr>
										</c:forEach>
									</tbody>
							</table>
						</div>
										
					</div>
						
						<div class="divPage" style="text-align:center;">
							<!-- 페이지 번호 추가 -->		
							<!-- 이전 블럭으로 이동 ◀ -->
							<c:if test="${pagingInfo.firstPage>1 }">
								<a href="#" onclick="pageProc(${pagingInfo.firstPage-1})">
									<img src="<c:url value='/resources/img/first.JPG'/>" 
										alt="이전 블럭으로 이동">
								</a>
							</c:if> 
							
							<!-- [1][2][3][4][5][6][7][8][9][10] -->
							<c:forEach var="i" begin="${pagingInfo.firstPage }" 
								end="${pagingInfo.lastPage }">		
								<c:if test="${i!=pagingInfo.currentPage }">
									<a href="#" onclick="pageProc(${i})">[${i}]</a>			
								</c:if>
								<c:if test="${i==pagingInfo.currentPage }">
									<span style="color:blue;font-weight:bold">${i}</span>			
								</c:if>		
							</c:forEach>
								
							<!-- 다음 블럭으로 이동 ▶ -->
							<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
								<a href="#" onclick="pageProc(${pagingInfo.lastPage+1})">
									<img src="<c:url value='/resources/img/last.JPG'/>" 
										alt="다음 블럭으로 이동">
								</a>
							</c:if>
							<!--  페이지 번호 끝 -->
						</div>
						
						<!-- 검색기능 -->
						<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<div class="search" style="margin-left: 10px;">
							   	<form name="frmSearch" method="post" 
							   		action='<c:url value="/notice/noticeList.do"/>'>
							        <select name="searchCondition" class="form-control" style=" width: 100px;
										height: 30px; font-size: 13px; display: inline-block;">
							            <option value="title" 
							            	<c:if test="${param.searchCondition=='title' }">
							            		selected="selected"
							            	</c:if>
							            >제목</option>
							            <option value="content" 
							            	<c:if test="${param.searchCondition=='content' }">
							            		selected="selected"
							            	</c:if>
							            >내용</option>
							        </select>   
							        <input type="text" class="form-control" name="searchKeyword" title="검색어 입력"
							        	value="${param.searchKeyword}" style=" width: 180px; height: 30px; 
							        	font-size: 13px; display: inline-block;">   
									<input type="submit" class="btn btn-primary btn-sm" value="검색">
							    </form>
							</div>
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

