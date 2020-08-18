<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

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
<script type="text/javascript">
	$(function() {
		$('#nList').click(function() {
			location.href = "<c:url value='/notice/noticeList.do'/>"
		});

		$('form[name=frmEdit]').submit(function() {
			if ($('#title').val() == '') {
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
		<h1 class="h3 mb-0 text-gray-800">공지사항 수정</h1>
	</div>

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-7 ">
			<div class="card shadow mb-4"
				style="height: fit-content; min-height: 800px; weight: 500px;">
				<!-- Card Header - Dropdown -->
				<form name="frmEdit" method="post"
					action="<c:url value='/notice/noticeEdit.do'/>"
					enctype="multipart/form-data">

					<input type="hidden" name="noticeNo" value="${param.noticeNo }">
					<input type="hidden" name="fileName" value="${vo.orFileName }">

					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<div>
							<h6 class="m-0 font-weight-bold text-primary">공지사항</h6>
						</div>
						<!-- 등록 버튼 -->
						<div>
							<input type="Button" class="btn btn-primary btn-sm" id="nList"
								value="취소" style="width: 60px; font-size: 13px;"
								onclick="location.href='<c:url value="/notice/noticeList.do"/>'" />

							<input type="submit" class="btn btn-primary btn-sm" value="등록"
								style="width: 60px; font-size: 13px;" />
						</div>
					</div>

					<!-- 분류 -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<table>
						<tr>
							<td style="width:20%;"><h6 class="m-0 font-weight-bold text-primary">분류</h6>
							</td>
							<td style="width: 80%; weight: 100px; width: 500px;">
								<select name="category" class="form-control" style="width:400px;">
									<option value="전체">전체</option>
										<option value="영업">영업</option>
										<option value="기획">기획</option>
										<option value="법무">법무</option>
										<option value="마케팅">마케팅</option>
										<option value="전산">전산</option>
								</select> <input type="checkbox" name="main" id="main" value="Y">
									<span>공지사항 메인 등록</span></td>
							</tr>
						</table>
					</div>

					<!-- 제목 -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<table>
							<tr>
								<td style="width: 20%;">
									<h6 class="m-0 font-weight-bold text-primary">제목</h6>
								</td>
								<td style="width: 80%; width: 500px;"><input type="text"
									class="form-control" name="title" id="title"
									value="${vo.title }" style="width: 400px; font-size: 14px;">
								</td>
							</tr>
						</table>
					</div>

					<!-- 첨부파일 -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<table>
							<tr>
								<c:if test="${!empty vo.orFileName }">
									<td style="width: 15%;">
										<h6 class="m-0 font-weight-bold text-primary">첨부파일</h6>
									</td>
										<td>
										<input type="file" id="fileName" name="upfile" value="${vo.orFileName}" />
									<br>
										<span class="sp1"></span>
										<span style="color: green; font-weight: bold"> 첨부파일을 새로
											지정할 경우 기존 파일 ${vo.orFileName}는 삭제됩니다.</span>
									</td>
								</c:if>

								<c:if test="${empty vo.orFileName }">
									<td style="width: 20%;">
										<h6 class="m-0 font-weight-bold text-primary">첨부파일</h6>
									</td>
										<td>
										<input type="file" id="fileName" name="upfile" value="${vo.orFileName}" style="margin-left: 40px;" />
									<br>
										<span class="sp1"></span>
									</td>
								</c:if>
							</tr>
						</table>
					</div>

					<!-- 내용 -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<table>
							<tr>
								<td style="width: 20%;">
									<h6 class="m-0 font-weight-bold text-primary">내용</h6>
								</td>
								<td style="width: 80%; text-align: left;">
								<%@ include	file="EditSummer.jsp"%></td>
							</tr>
						</table>
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
<%@ include file="../inc/bottom.jsp"%>
