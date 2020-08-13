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
function popup(){
	var url="<c:url value='/notice/noticeDelete.do?noticeNo=${param.noticeNo}' />";
	var name="삭제하기";
	var option="width=484, height=84, top=100, left=200, location=no"
	window.open(url,name,option);
}	

$(function(){
	$("#comEdit").hide();
	
	$("#comEditBt").click(function(){ 
		if($("#comEdit").hide()){
			$("#comEdit").slideDown();
			$("#comWrite").slideUp();
		}else{
			$("#comEdit").toggle();
			$("#comWrite").toggle();
		}
		
	});
	
	$("#comDelBt").click(function(){
		
	});
});	

</script>
<!-- Begin Page Content -->

<div class="container-fluid">

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-12 " >
			<div class="card shadow mb-4" style="height: 700px">
				<!-- Card Header - Dropdown -->
				
					<input type="hidden" name="noticeNo" value="${param.noticeNo }">
					
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<a href="<c:url value='/board/boardList.do'/>">
							<h6 class="m-0 font-weight-bold text-primary">공지사항 </h6>
						</a>
						
					</div>
					<br>
					<div class="card-body"style="text-align:center; margin-bottom: -200px;">
						<span style="font-size:25px; display: inline-block;
									text-align:left; vertical-align:middle;">
									[${vo.category}] ${vo.title }</span>
						<br><br><br>
						<p>
							<a href="#">
								<span style="font-size:14px; display: inline-block;
									text-align:left; vertical-align:middle;">
									관리자</span>
							</a><br>
							<span style="vertical-algin:middle; opacity:.4;">
								<fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd-HH:mm"/>
							</span>
							<span style="vertical-algin:middle; opacity:.4;">
								| ${vo.readcount} 읽음
							</span>
						</p>
					</div>
					<div>
						<span class="sp1">첨부파일</span> 
						<span><a href
			="<c:url value='/notice/download.do?boardNo=${vo.noticeNo}&fileName=${vo.fileName}'/>">
						${fileInfo}
						</a></span>
						<span style="color:blue">${downInfo}</span>
					</div>
					<hr>					
					
					<div class="card-body">
						<p class="content">
							<% pageContext.setAttribute("newLine", "\r\n"); %>
							${fn:replace(vo.content, newLine, '<br>')}
						</p>
					</div>
					
					
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<a href="<c:url value='/notice/noticeEdit.do?noticeNo=${vo.noticeNo }'/>">
						<input type="button" value="수정"></a> 
						<a href="javascript:popup()"> 
						<input type="button" value="삭제"></a> 
						<a href="<c:url value='/notice/noticeList.do'/>"> 
						<input type="button" value="목록"></a>
						<hr>
					</div>
					
					<div style="overflow:scroll;">
						<!-- 댓글 -->
						<div class="card-body"
							style="display: block; font-size: 13px; border: 2px solid #4e73df; border-radius: 10px;">
							<div id="comInfo" style="">
								<c:forEach var="comment" items="${list }">
									<p>
										<a href="#"> 
											<span style="font-size: 12px; display: inline-block; 
											text-align: left; vertical-align: middle;">
											${comment.name}
											</span>
										</a> 
										<span style="font-size: 13px; display: inline-block; 
											text-align: left; vertical-align: middle;">
											${comment.content}
											</span>
											<span style="vertical-algin: middle; opacity: .4; font-size: 11px;"> 
											<fmt:formatDate value="${comment.regdate}"
												pattern="yyyy-MM-dd-HH:mm" />
										</span>
										
										<%-- <c:if test="${sessionScope.identNum} == ${comment.memNo }"> --%>
											<button id="comEditBt" style="font-size: 9px;">수정</button>
											<form name="DeleteCommentForm" method="post"
												action="<c:url value='/noticeComment/noticeCommentDelete.do?no=${comment.no }'/>">
												<button type="" id="comDelBt" style="font-size: 9px;">삭제</button>
											</form>
												<div id="comEdit" style="display:none;">
													<form name="EditCommentForm" method="post"
														action="<c:url value='/noticeComment/noticeCommentEdit.do'/>">
														
														<input type="hidden" name="noticeNo" value="${comment.noticeNo }">
														<input type="hidden" name="no" value="${comment.no }">
														<input type="hidden" name="memNo" value="${comment.memNo }">
														<div class="form-group">
															<label for="exampleInputEmail2">내용</label> 
															<input type="text"
																class="form-control" name="content" placeholder="내용을 입력하세요" 
																value="${comment.content }">
														</div>
														<button type="submit" id="commentBt" class="btn btn-default">수정</button> 
													</form>
												</div>
										<%-- </c:if> --%>
									</p>
								</c:forEach>
							</div>
							
							<div id="comWrite">
								<form name="writeCommentForm" method="post"
									action="<c:url value='/noticeComment/noticeCommentWrite.do'/>">
									
									<input type="hidden" name="noticeNo" value="${vo.noticeNo }">
									<input type="hidden" name="memNo" value="${vo.memNo }">
									<div class="form-group">
										<label for="exampleInputEmail2">내용</label> 
										<input type="text"
											class="form-control" name="content" placeholder="내용을 입력하세요">
									</div>
									<button type="submit" id="commentBt" class="btn btn-default">댓글 등록</button> 
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

