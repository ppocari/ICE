<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	/* $("#comDiv").hide();
	var flag = true;
	
	$("#comBtn").click(function(){ 
		if(flag){//안보일때
			$("#comDiv").slideDown();
			flag= false;
		}else{
			$("#comDiv").slideUp();
			flag=true;
		}
	}); */
});

</script>
<!-- Begin Page Content -->

<div class="container-fluid">

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-12 ">
			<div class="card shadow mb-4" style="height: fit-content;">
				<!-- Card Header - Dropdown -->

				<input type="hidden" name="boardNo" value="${param.boardNo }">

				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<a href="<c:url value='/board/boardList.do'/>">
						<h6 class="m-0 font-weight-bold text-primary">사내게시판</h6>
					</a>

				</div>
				<br>
				<div class="card-body" style="text-align: center;">
					<span
						style="font-size: 25px; display: inline-block; text-align: left; vertical-align: middle;">
						${vo.title }</span> <br>
					<br>
					<p>
						<a href="#"> <span
							style="font-size: 14px; display: inline-block; text-align: left; vertical-align: middle;">
								${vo.nickname }</span>
						</a><br> <span style="vertical-algin: middle; opacity: .4;">
							2020-08-06 <%-- <fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/> --%>
						</span> <span style="vertical-algin: middle; opacity: .4;"> |
							${vo.visited } 읽음 </span>
					</p>
				</div>
				<hr>

				<div class="card-body" style="position: relative;">
					<p class="content">
						<% pageContext.setAttribute("newLine", "\r\n"); %>
						${fn:replace(vo.content, newLine, '<br>')}
					</p>
				</div>

				<input type="hidden" value="${vo.boardNo}" id="btDel_boardNo">

				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<a href="<c:url value=''/>"> <input type="button" id="comBtn"
						value="댓글쓰기">
					</a> <a
						href="<c:url value='/board/boardEdit.do?boardNo=${vo.boardNo }'/>">
						<input type="button" value="수정">
					</a> <a href="javascript:popup()"> <input type="button" value="삭제">
					</a> <a href="<c:url value='/board/boardList.do'/>"> <input
						type="button" value="목록">
					</a>
					<hr>

				</div>
				
				<div style="">
					<!-- 댓글 -->
					<div class="card-body"
						style="display: block; font-size: 13px; border: 2px solid #4e73df; border-radius: 10px;">
		
						<c:forEach var="comment" items="${list }">
							<p>
								<a href="#"> 
									<span style="font-size: 12px; display: inline-block; 
									text-align: left; vertical-align: middle;">
									${comment.nickname}
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
								<c:if test="${sessionScope.identNum} == ${comment.memNo } \\ 
									${sessionScope.identNum} == '999999'">
									<button id="comBtn1" style="font-size: 9px;">수정</button>
									<button id="comBtn1" style="font-size: 9px;">삭제</button>
								</c:if>
							</p>
						</c:forEach>
						
						<div id="comDiv">
							<form name="writeCommentForm" method="post"
								action="<c:url value='/boardComment/boardCommentWrite.do'/>">
								
								<input type="text" name="boardNo" value="${vo.boardNo }">
								<input type="text" name="memNo" value="${vo.memNo }">
								
								<div class="form-group">
									<label for="exampleInputName2">별명</label> 
									<input type="text" name="nickname" class="form-control" id="nickname" placeholder="별명을 입력하세요.">
								</div>
								<div class="form-group">
									<label for="exampleInputEmail2">내용</label> 
									<input type="text"
										class="form-control" name="content" placeholder="내용을 입력하세요">
								</div>
								<button type="submit" id="commentBt" class="btn btn-default">댓글 등록</button> 
							</form>
						</div>
	
					</div>
					
					<!-- <div id="comDiv" style="">
							위에있음 <input type="hidden" name="boardNo" value="boardNo">
							<input type="hidden" name="memNo" value="memNo">
							
							<div class="form-group">
								<label for="1">별명</label> 
								<input type="text" class="form-control" 
									id="nickname" placeholder="별명을 입력하세요.">
								<label for="2">내용</label> 
								<input type="email" class="form-control" 
									id="content" placeholder="내용을 입력하세요">	
								<button type="button" id="btnReply" class="btn btn-default">댓글 등록</button>	
							</div>
					</div> -->
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

