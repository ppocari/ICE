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
		<h1 class="h3 mb-0 text-gray-800">쪽지함</h1>

		<a href="#"
			class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
			class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
	</div>

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-12 " >
			<div class="card shadow mb-4" style="height: 700px">
				<!-- Card Header - Dropdown -->
				<form name="memRegisterFrm" method="post"  
				action="<c:url value='/message/messageList.do?searchKeyWord=all'/> ">
					
					<!-- 검색기능 -->
						<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
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
							<div class="search" style="margin-right: 20px; text-align:right;">
								<label for="hiredate1" style="margin-right: 20px;"></label>
								<select class="form-control" style="weight:50px;">
								 	 <option>내용</option>
									 <option>보낸사람</option>
								</select>
								<input type="text" class="form-control" 
									placeholder="검색어를 입력...">
								<button type="button" class="btn btn-primary btn-sm">검색</button>
								
							</div>
						</div>
						
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<button type="button" style="float: left;" class="btn btn-primary btn-sm">삭제</button>
						<button type="button" style="float: left;" class="btn btn-primary btn-sm">보관</button>
						<button type="button" style="float: left;" class="btn btn-primary btn-sm">답장</button>
						<a href="<c:url value='/message/messageWrite.do'/>">
							<div>
								<button type="button"  style="float: right;" class="btn btn-info"
								 >쪽지작성</button>
							</div>
						</a>
						
					</div>
					
					
					<!-- Card Body -->
					<div class="card-body">
						<div class="chart-area" style="overflow: scroll; height:420px;">


							<table class="table table-bordered table-condensed" id="dynamicTable">
								<colgroup>
									<col style="width:5%;"/>
									<col style="width:15%;"/>
									<col style="width:55%;"/>
									<col style="width:15%;"/>
								</colgroup>
								<thead>
									<tr>
										<th scope="col">
											<input type="checkbox" id="checkAll" value="option1">
										</th>
										<th scope="col">보낸사람</th>
										<th scope="col">내용</th>
										<th scope="col">날짜</th>
									</tr>
								</thead>
								<tbody id="dynamicTbody">
									<!-- 게시판 내용 반복문시작 -->
									<c:forEach var="vo" items="${list }">
										<tr class="align_center">
											<td>
												<input type="checkbox" id="inlineCheckbox1" value="option1">
											</td>
											<td>${vo.MEMNO}</td>
											<td class="align_left">
												<!-- 24시간 공지사항  new 이미지-->
												<c:if test="">
													<img>
												</c:if>
												
												<a href="">
													<!-- 제목보여주기 길면 일부 -->
													<c:if test="${fn:length(vo.MSG_CONTENT)>30 }">
														${fn:substring(vo.MSG_CONTENT, 0, 30)} ...
													</c:if>
													<c:if test="${fn:length(vo.MSG_CONTENT)<=30 }">
														${vo.MSG_CONTENT}
													</c:if>
												</a>
											</td>
											<td><fmt:formatDate value="${vo.MSG_REGDATE}"
												pattern="yyyy-MM-dd"/> 
											</td>
										</tr>
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

