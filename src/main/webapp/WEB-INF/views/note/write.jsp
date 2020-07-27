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

	<div class="header">
		<div style="font-size:14px">
			쪽지쓰기
		</div>
		<hr>
		<div class="write_btn" style="display: block; font-size:12px">
			<div class="buttonSet">
				<button>보내기</button>
				<button>취소</button>
			</div>
		</div>
		<hr>
	</div>
	
	<div class="send" style="display:block;">
		<div style="font-size:12px;">
			<span>
				<label for="who" class="receiverName">받는사람</label>
			</span>
			<span>
				<span id="receive">
					<input type="text" id="receiver" 
						style="ime-mode:disabled; width:300px;, height:150px;" >
				</span>
				<button>주소록</button>
			</span>
		</div>
	</div>

	<div class="writing_area" style="height:620px ">
		<textarea id="contents" rows="5" cols="55" title="쪽지 내용을 입력해 주세요."
			style="font-size:12px; width:410px; height:250px;">쪽지 내용을 입력해 주세요.</textarea>
	</div>
</div>

<%@ include file="../inc/bottom.jsp"%>
