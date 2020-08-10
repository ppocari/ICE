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

</script>
<!-- Begin Page Content -->

<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">사내게시판</h1>

		<!-- <a href="#"
			class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
			class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> -->
	</div>

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-12 " >
			<div class="card shadow mb-4" style="">
				<!-- Card Header - Dropdown -->
				<form name="boardSearch" method="post"  
				action="<c:url value='/board/boardList.do'/> ">
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">ICE 사내게시판</h6>
						<a href="<c:url value='/board/boardWrite.do'/>">
							<div style="float: right">
								<button type="button" class="btn btn-info">게시글작성</button>
							</div>
						</a>
					</div>
					
					<!-- Card Body -->
					<div class="card-body" style="">
						<div class="chart-area" style=" font-size: 13px;" >


							<table class="table table-bordered table-hover" id="dynamicTable">
								<colgroup>
									<col style="width:5%;"/>
									<col style="width:50%;"/>
									<col style="width:15%;"/>
									<col style="width:15%;"/>
									<col style="width:25%;"/>
								</colgroup>
								<thead>
									<tr style="height:0px">
										<th scope="col">no</th>
										<th scope="col">제목</th>
										<th scope="col">작성자</th>
										<th scope="col">작성일</th>
										<th scope="col">조회수</th>
									</tr>
								</thead>
								<tbody id="dynamicTbody">
									<!-- 게시판 내용 반복문시작 -->
									<c:forEach var="vo" items="${list }">
										<tr class="align_center">
											<td>${vo.boardNo}</td>
											<td class="align_left">
												<!-- 24시간 공지사항  new 이미지-->
												<c:if test="">
													<img>
												</c:if>
												
												<a href="<c:url value='/board/boardDetail.do?boardNo=${vo.boardNo }'/>">
													<!-- 제목보여주기 길면 일부 -->
													<c:if test="${fn:length(vo.title)>30 }">
														${fn:substring(vo.title, 0, 30)} ...
													</c:if>
													<c:if test="${fn:length(vo.title)<=30 }">
														${vo.title}
													</c:if>
												</a>
											</td>
											<td>${vo.nickname }</td>
											<td><fmt:formatDate value="${vo.regdate}"
												pattern="yyyy-MM-dd-HH:mm"/></td>
											<td>${vo.visited}</td>
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
								<img src="<c:url value='/resources/images/first.JPG'/>" 
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
								<img src="<c:url value='/resources/images/last.JPG'/>" 
									alt="다음 블럭으로 이동">
							</a>
						</c:if>
						<!--  페이지 번호 끝 -->
					</div>
					
					<!-- 검색기능 -->
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between"
						style="float:center;">
						<%-- <div class="search" style="margin-left: 10px;">
							<label for="department" style="margin-right: 20px;">부서별 조회</label>
							<select name="department">
								<!-- option 반복 -->
								<option>전체</option>
								<c:forEach var="deptvo" items="${deptList }">
									<option>${deptvo.deptName }</option>
								</c:forEach>
							</select>
						</div>
						<div class="search">
							<label for="position" style="margin-right: 20px;">직급별 조회</label>
							<select name="position">
								<!-- option 반복 -->
								<option>전체</option>
								<c:forEach var="posvo" items="${ posList }">
									<option>${posvo.posName }</option>
								</c:forEach>
							</select>
						</div> --%>
							<div id = "searchboard" style="">
								<select class="form-control" style=" width: 100px;
									height: 30px; font-size: 13px; display: inline-block;">
								 	 <option>제목</option>
								 	 <option>내용</option>
									 <option>작성자</option>
								</select>
								<input type="text" class="form-control" placeholder="검색어를 입력..."
									style=" width: 180px; height: 30px; font-size: 13px; display: inline-block;">
								<button type="submit" class="btn btn-primary btn-sm">검색</button>
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

