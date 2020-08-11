<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	$("form[name=btList]").click(function(){
		
	});
	
});	
</script>
<!-- Begin Page Content -->

<div class="ard-header py-3 d-flex flex-row align-items-center justify-content-between">
	<form name="frmDelete" method="post"
		action="<c:url value='/notice/noticeDelete.do'/>">
		
		<input type="hidden" name="noticeNo" value="${param.noticeNo}">
		
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">게시물 삭제</h5>
			      </div>
			      <div class="modal-body">
			        ${param.noticeNo}번 공지사항을 정말 삭제하시겠습니까?
			      </div>
			      <div class="modal-footer">
			      	<button type="submit" class="btn btn-primary">삭제하기</button>
			       	<button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
			      </div>
			    </div>
			  </div>
			</div>		
	</form>
</div>

<!-- /.container-fluid -->
<div></div>
<div></div>

<!-- End of Main Content -->


