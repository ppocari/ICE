<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
function popup(){
	var url="<c:url value='/board/boardDelete.do?boardNo=${param.boardNo}' />";
	var name="주소록";
	var option="width=500, height=500, top=100, left=200, location=no"
	window.open(url,name,option);
}	

$(function(){
	$("#comEdit").hide();
	
	$("#comEditBt").click(function(){ 
		if($("#comEdit").hide()){
			$("#comEdit").slideDown();
		}else{
			$("#comEdit").slideUp();
		}
		
	});
	
	$('form[name=writeCommentForm]').submit(function() {
		
		if ($('#writeCon').val() == '') {
			alert('내용을 입력하세요');
			$('#writeCon').focus();
			event.preventDefault();
		}
		if ($('#nickname').val() == '') {
			alert('별명을 입력하세요');
			$('#nickname').focus();
			event.preventDefault();
		}
	});
	
	$('form[name=editCommentForm]').submit(function() {
		
		if ($('#editCon').val() == '') {
			alert('내용을 입력하세요');
			$('#editCon').focus();
			event.preventDefault();
		}
	});

});	
	function del(boardNo) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if(chk) {
			window.location.href= "<c:url value='/board/delete.do?boardNo='/>"+boardNo;
		}
	}

</script>
<!-- Begin Page Content -->

<div class="container-fluid">

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-7 ">
			<div class="card shadow mb-4" style="height: fit-content;">
				<!-- Card Header - Dropdown -->

				<input type="hidden" name="boardNo" value="${param.boardNo }">

				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<a href="<c:url value='/board/boardList.do'/>">
						<h6 class="m-0 font-weight-bold text-primary">사내게시판</h6>
					</a>
				</div>
				<div class="card-body">
					<div>
						<div style="float: left;">
							<span
								style="font-size: 25px; display: inline-block; text-align: left; vertical-align: middle;">
								${vo.title }</span> <br>
						</div>
						<div style="float: right; margin-top: 10px;">
							<span
								style="font-size: 14px; display: inline-block; text-align: left; vertical-align: middle;">
								${vo.nickname }</span> <span
								style="vertical-algin: middle; opacity: .4;"> <fmt:formatDate
									value="${vo.regdate}" pattern="yyyy-MM-dd-HH:mm" />
							</span> <span style="vertical-algin: middle; opacity: .4;"> | 조회수
								${vo.visited } 읽음</span>
						</div>
					</div>

					<div>
						<hr style="margin-top: 50px;">
					</div>

					<div class="content">
						<%
							pageContext.setAttribute("newLine", "\r\n");
						%>
						${fn:replace(vo.content, newLine, '<br>')}
					</div>
					<input type="hidden" value="${vo.boardNo}" id="btDel_boardNo">

				</div>
				<div style="margin-left: auto; background-color: white;"
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<c:if test="${sessionScope.identNum == vo.memNo }">
						<input type="button" class="btn btn-default btn-sm" value="수정"
							onclick="location.href='<c:url value="/board/boardEdit.do?boardNo=${vo.boardNo }"/>'">
						<input type="button" id="delBorBt" name="delBorBt" value="삭제"
							class="btn btn-default btn-sm" onclick="del(${vo.boardNo})">
					</c:if>
					<input type="button" class="btn btn-primary btn-sm" value="목록"
						onclick="location.href='<c:url value="/board/boardList.do"/>'">
				</div>

				<div style="background-color: white;">
					<!-- 댓글 -->
					<div class="card-body"
						style="display: block; font-size: 13px; border: 2px solid #4e73df; border-radius: 10px;">
						<c:forEach var="comment" items="${list }">
							<div>
								<a href="#"> <span
									style="font-size: 12px; display: inline-block; text-align: left; vertical-align: middle;">
										${comment.nickname}</span>
								</a> <span
									style="font-size: 13px; display: inline-block; text-align: left; vertical-align: middle;">
									${comment.content} </span> <span
									style="vertical-algin: middle; opacity: .4; font-size: 11px;">
									<fmt:formatDate value="${comment.regdate}"
										pattern="yyyy-MM-dd-HH:mm" /> <c:if
										test="${sessionScope.identNum == comment.memNo }">

										<form name="DeleteCommentForm" method="post"
											action="<c:url value='/boardComment/boardCommentDelete.do?no=${comment.no }'/>">
											<input text="button" id="comEditBt"
												style="font-size: 9px; width: 38px;"
												class="btn btn-primary btn-sm" value="수정">
											<button type="submit" id="comDelBt" style="font-size: 9px;"
												class="btn btn-primary btn-sm">삭제</button>
										</form>

										<div id="comEdit" style="display: none;">
											<form name="editCommentForm" method="post"
												action="<c:url value='/boardComment/boardCommentEdit.do'/>">

												<input type="hidden" name="boardNo"
													value="${comment.boardNo }"> <input type="hidden"
													name="no" value="${comment.no }"> <input
													type="hidden" name="memNo" value="${comment.memNo }">
												<div class="form-group">
													<hr>
													댓글 내용 수정<br>
													<table class="table table-borderless" id="dynamicTable">
														<colgroup>
															<col style="width: 10%;" />
															<col style="width: 90%;" />
														</colgroup>
														<thead />
														<tbody style="font-size: 11px;">
															<tr class="align_center">
																<td><input type="text" id="editCon"
																	style="width: 420px; font-size: 12px;"
																	class="form-control" name="content"
																	placeholder="내용을 입력하세요" value="${comment.content }">
																</td>
																<td>
																	<button type="submit" style="font-size: 9px;"
																		id="commentBt" class="btn btn-primary btn-sm">수정</button>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</form>
										</div>
									</c:if>
								</span>
							</div>
						</c:forEach>

						<div id="comDiv">
							<form name="writeCommentForm" method="post"
								action="<c:url value='/boardComment/boardCommentWrite.do'/>">

								<input type="hidden" name="boardNo" value="${vo.boardNo }">
								<input type="hidden" name="memNo" value="${vo.memNo }">
								<hr>
								댓글 입력<br>
								<div class="form-group">
									<table class="table table-borderless" id="dynamicTable">
										<colgroup>
											<col style="width: 100%;" />
											<col style="width: 20%;" />
										</colgroup>
										<thead />
										<tbody style="font-size: 11px;">
											<tr class="align_center">
												<td><input type="text" id="nickname"
													style="width: 20%; font-size: 12px;" class="form-control"
													name="nickname" placeholder="별명을 입력하세요."></td>
											</tr>
											<tr class="align_center">
												<td><input type="text" id="writeCon"
													style="width: 100%; font-size: 12px;" class="form-control"
													name="content" placeholder="내용을 입력하세요"></td>
												<td><input type="submit" id="commentBt"
													class="btn btn-primary btn-sm" value="등록"></td>
										</tbody>
									</table>
								</div>
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

<%@ include file="../inc/bottom.jsp"%>