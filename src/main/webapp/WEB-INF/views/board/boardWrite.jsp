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
	
$(function(){
	$('#nList').click(function(){
		location.href
			= "<c:url value='/board/boardList.do'/>"
	});
	
	$('form[name=frmWrite]').submit(function(){
		if($('#title').val()==''){
			alert('제목을 입력하세요');
			$('#title').focus();
			event.preventDefault();
		}
	});
	
	
});
	
	
	
</script>
<!-- Begin Page Content -->

<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">사내게시판 작성</h1>

		<a href="#"
			class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
			class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
	</div>

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-12 " >
			<div class="card shadow mb-4" style="height: 800px; weight:500px;" >
				<!-- Card Header - Dropdown -->
				<form name="frmWrite" method="post"  
				action="<c:url value='/board/boardWrite.do'/> ">
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<tr>
							<th>
								<h6 class="m-0 font-weight-bold text-primary">사내게시판</h6>
							</th>
							<td>
								<a href="<c:url value='/board/boardList.do'/>">
									<div>
										<button type="button" class="btn btn-info"
										 >사내게시판 목록</button>
									</div>
								</a>
							</td>
						</tr>
						
					</div>
					
					<!-- 분류 -->
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<table>
						<tr>
							<td style="width:20%;"><h6 class="m-0 font-weight-bold text-primary">분류</h6>
							</td>
							<td style="width:80%; weight:100px;">
								<select name="NOTI_CATEGORY" class="form-control">
									<option value="전체">전체</option>
									<option value="경영">경영</option>
									<option value="회계">회계</option>
									<option value="영업">영업</option>
									<option value="경리">경리</option>
								</select> 
								<input type="checkbox" id="isMain" name="NOTI_MAIN" 
								 	value="option1"> 
								<span>메인 공지사항 등록</span>
							</td>
						</tr>
						</table>
						
					</div>
					
					<!-- 제목 -->
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<table>
							<tr>
								<td style="width:20%;">
									<h6 class="m-0 font-weight-bold text-primary">제목</h6>
								</td>
								<td style="width:80%;">
									<input type="text" class="form-control" 
									name="title" id="title">
								</td>
							</tr>
						</table>
						
					</div>
					
					<!-- 이름,비밀번호 -->
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<table>
							<tr>
								<td style="width:15%;">
									<h6 class="m-0 font-weight-bold text-primary">별명</h6>
								</td>
								<td style="width:35%;">
									<input type="text" class="form-control" 
									name="nickname" id="nickname">
								</td>
								<td style="width:15%;">
									<h6 class="m-0 font-weight-bold text-primary">비밀번호</h6>
								</td>
								<td style="width:35%;">
									<input type="text" class="form-control" 
									name="password" id="password">
								</td>
							</tr>
						</table>
					</div>
					
					<!-- 내용 -->
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<table>
							<tr>
								<td style="width:20%;">
									<h6 class="m-0 font-weight-bold text-primary">내용</h6>
								</td>
								<td style="width:80%; text-align:left;">
									<%@ include file="summer.jsp" %>
								</td>
							</tr>
						</table>
					</div>
					
					<!-- 등록,취소 버튼 -->
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<input type = "submit" class="form-control" value="등록"/>
            			<a href="<c:url value='/companyBoard/companyBoardList.do'/>">
            				<input type = "Button" class="form-control btList" id="nList"value="글목록"  />
            			</a>
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

