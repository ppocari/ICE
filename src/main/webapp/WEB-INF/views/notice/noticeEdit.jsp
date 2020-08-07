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
			= "<c:url value='/notice/noticeList.do'/>"
	});
	
	$('form[name=frmEdit]').submit(function(){
		if($('#title').val()==''){
			alert('제목을 입력하세요');
			$('#title').focus();
			event.preventDefault();
		}
	});
	
	$('#main').click(function() {
		alert('공지사항 메인 노출여부가 체크되었습니다.');
	});
});
	
	
	
</script>
<!-- Begin Page Content -->

<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">공지사항</h1>
	</div>

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-12 " >
			<div class="card shadow mb-4" style="height: 800px; weight:500px;" >
				<!-- Card Header - Dropdown -->
				<form name="frmEdit" method="post"  
					action="<c:url value='/notice/noticeEdit.do'/>">
					<!-- enctype="multipart/form-data" -->
					
					<input type="hidden" name="noticeNo" value="${param.noticeNo }">
					
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<tr>
							<th>
								<h6 class="m-0 font-weight-bold text-primary">공지사항 수정</h6>
							</th>
							<td>
								<a href="<c:url value='/notice/noticeList.do'/>">
									<div>
										<button type="button" class="btn btn-info"
										 >공지사항 목록</button>
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
								<select name="category" class="form-control">
									<option value="전체">전체</option>
									<option value="경영">경영</option>
									<option value="회계">회계</option>
									<option value="영업">영업</option>
									<option value="경리">경리</option>
								</select> 
								<input type="checkbox" name="main" id="main"
								 	value="Y"> 
								<span>사내게시판 메인 등록</span>
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
									name="title" id="title" value="${vo.title }"
									style="width: 300px; font-size: 14px;">
								</td>
							</tr>
						</table>
						
					</div>
					
					<!-- 첨부파일 -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<table>
							<tr>
								<td style="width: 20%;">
									<h6 class="m-0 font-weight-bold text-primary">첨부파일</h6>
								</td>
								<td style="width: 80%;"><input type="file" id="fileName"
									name="upfile" value="${vo.fileName }"/> <br>
								<span>(최대 2M)</span></td>
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
									<%@ include file="EditSummer.jsp" %>
								</td>
							</tr>
						</table>
					</div>
					
					<!-- 등록,취소 버튼 -->
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<input type = "submit" class="form-control" value="등록"/>
            			<a href="<c:url value='/board/boardList.do'/>">
            				<input type = "Button" class="form-control btList" id="nList" value="글목록" 
            				style="width: 60px; font-size: 13px;"/>
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

