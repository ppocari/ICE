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
	
	
</script>
<!-- Begin Page Content -->

<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">공지사항 목록</h1>
	</div>

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-12 " >
			<div class="card shadow mb-4" style="height: 700px">
				<!-- Card Header - Dropdown -->
				<form name="memRegisterFrm" method="post"  
				action="<c:url value='/member/memList.do?searchKeyWord=all'/> ">
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
					<div  style="height: 500px;">
						<div class="chart-area" style="overflow: scroll; height: 450px; font-size: 13px;">


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
										<input type="text" name="noticeNo" value="${vo.noticeNo }">		
							
										<tr class="align_center">
											<td>${vo.category}</td>
											<td class="align_left">
												
												<!-- 조회수 올리기 -->
												<%-- /notice/noticeCountUpdate.do?no=${vo.no} --%>
												<a href 
									="<c:url value="/notice/noticeDetail.do?noticeNo=${vo.noticeNo }"/>">
													
													<c:if test="${fn:length(vo.title)>30 }">
														${fn:substring(vo.title, 0, 30)} ...
													</c:if>
													<c:if test="${fn:length(vo.title)<=30 }">
														${vo.title}
													</c:if>
												</a>
												
												<!-- 24시간 공지사항  new 이미지-->
												<c:if test="">
													<img>
												</c:if>
											</td>
											<td><fmt:formatDate value="${vo.regdate}"
												pattern="yyyy-MM-dd-HH:mm"/></td>
											<td>${vo.readcount}</td>
										</tr>
									</c:forEach>
								</tbody>
						</table>
										
						</div>
						
						<!-- 검색기능 -->
						<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<div class="search" style="margin-left: 10px;">
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
						        <input type="text" class="form-control" placeholder="검색어를 입력..."
									style=" width: 180px; height: 30px; font-size: 13px; display: inline-block;">
								<button type="submit" class="btn btn-primary btn-sm">검색</button>
							</div>
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

