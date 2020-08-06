<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="<c:url value='/resources/se2/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">

function popup(){
	var url="<c:url value='/message/messageContact.do?memNo=${sessionScope.identNum}' />";
	var name="주소록";
	var option="width=500, height=500, top=100, left=200, location=no"
	window.open(url,name,option);
}

</script>
<style type="text/css">

</style>


<div class="container-fluid">

	<div class="header">
		<div>
			쪽지쓰기
		</div>
		<hr>
		<div class="write_btn" >
			<div class="buttonSet">
				<button type="submit" class="btn btn-primary btn-xs" 
					style="font-size:height: 30px; font-size: 13px;">보내기</button>
				<button type="button" class="btn btn-primary btn-xs"
					style="font-size:height: 30px; font-size: 13px;">취소</button>
			</div>
		</div>
		<hr>
	</div>
	
	<div class="send" style="display:inline-block;">
		<div style="font-size:12px;">
			<span>
				<label for="who" class="receiverName">받는사람</label>
				<input type="text" id="receiver" name="receiver" class="form-control"
					style="ime-mode:disabled; font-size:40%; width:270px;, height:150px;" >
				<a href="javascript:popup()" >
					<button>주소록</button>
				</a>
			</span>
		</div>
	</div>

	<div class="writing_area" style="height:620px ">
		<textarea id="contents" rows="5" cols="55" title="쪽지 내용을 입력해 주세요."
			class="form-control" name="contents"
			style="font-size:12px; width:410px; height:250px;">쪽지 내용을 입력해 주세요.</textarea>
	</div>
</div>

<%@ include file="../inc/bottom.jsp"%>
