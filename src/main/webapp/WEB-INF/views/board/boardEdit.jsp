<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<script type="text/javascript">
	
$(function(){
	$('#nList').click(function(){
		location.href
			= "<c:url value='/board/boardList.do'/>"
	});
	
	$('form[name=frmEdit]').submit(function(){
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
		<h1 class="h3 mb-0 text-gray-800">사내게시판 수정</h1>
	</div>

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-12 " >
			<div class="card shadow mb-4" style="height: fit-content; min-height: 800px; weight: 500px;">
				<!-- Card Header - Dropdown -->
				<form name="frmEdit" method="post"  
					action="<c:url value='/board/boardEdit.do'/>"
					enctype="multipart/form-data">
					
					<input type="hidden" name="boardNo" value="${param.boardNo }">
					
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<tr>
							<th>
								<h6 class="m-0 font-weight-bold text-primary">사내게시판 수정</h6>
							</th>
							<td>
								<a href="<c:url value='/board/boardList.do'/>">
									<button type="button" class="btn btn-info"
									 >사내게시판</button>
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
							<td style="width: 80%; weight: 100px; width: 500px;">
								<select name="category" class="form-control" style="width: 400px;">
									<option value="전체">전체</option>
									<option value="잡담">잡담</option>
									<option value="동아리">동아리</option>
								</select> 
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
								<td style="width:80%; width: 500px;">
									<input type="text" class="form-control" 
									name="title" id="title" value="${vo.title }"
									style="width: 400px; font-size: 14px;">
								</td>
							</tr>
						</table>
						
					</div>
					
					<!-- 이름 -->
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<table>
							<tr>
								<td style="width:20%;">
									<h6 class="m-0 font-weight-bold text-primary">별명</h6>
								</td>
								<td style="width:80%; width: 500px;">
									<input type="text" class="form-control" 
									name="nickname" id="nickname" value="${vo.nickname }"
									style="width: 400px; font-size: 14px;">
								</td>
							</tr>
						</table> 
					</div>
					
					<!-- 내용 -->
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<table>
							<tr>
								<td style="width:15%;">
									<h6 class="m-0 font-weight-bold text-primary">내용</h6>
								</td>
								<td style="width:80%; text-align:left;">
									<textarea id="summernote" name="content">${vo.content }</textarea>
									<script>
									$('#summernote').summernote({
									 	placeholder: '내용을 입력하세요',
									    minHeight: 370,
									    maxHeight: null,
									    focus: true, 
									    lang : 'ko-KR'
									});
									</script>
								</td>
							</tr>
						</table>
					</div>
					
					<!-- 등록,취소 버튼 -->
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<input type = "submit" class="form-control" value="등록"
							style="width: 52px; font-size: 13px;"/>
            			<input type="Button" class="form-control btList" id="nList" value="글목록"
							style="width: 60px; font-size: 13px;" onclick="location.href='<c:url value="/board/boardList.do"/>'"/>
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

