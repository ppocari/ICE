<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="<c:url value='/resources/se2/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">

</script>
<style type="text/css">
</style>


<div class="container-fluid">

	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">공지사항 요청</h1>
		<a href="<c:url value='/notice/notice.do'/>"
			class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
			<i class="fas fa-download fa-sm text-white-50"></i>공지사항으로
		</a>
	</div>

	<div class="header">
		<div>
			<h2>쪽지 쓰기</h2>
		</div>
		<div class="write_btn" style="display: block;">
			<div class="buttonSet">
				<button>보내기</button>
			</div>
		</div>
	</div>
	
	<div class="send" style="display:block;">
		<div>
			<span>
				<label for="who" class="receiverName">받는사람</label>
			</span>
			<span>
				<span id="receive">
					<input type="text" id="receiver" style="ime-mode:disabled;">
				</span>
			</span>
		</div>
	</div>

	<div class="writing_area">
		<textarea id="contents" rows="5" cols="55" title="쪽지 내용을 입력해 주세요."></textarea>
	</div>
</div>

<%@ include file="../inc/bottom.jsp"%>
