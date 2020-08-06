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
	$("form[name=frmDelete]").submit(function(){
		if($('#pwd').val().length<1){
			alert('비밀번호를 입력하세요');
			$('#pwd').focus();
			event.preventDefault();
		}else{
			if(!confirm('삭제하시겠습니까?')){
				event.preventDefault();
			}
		}
		
	});
	
	$("form[name=btList]").click(function(){
		
	});
	
});	
</script>
<!-- Begin Page Content -->

<div class="ard-header py-3 d-flex flex-row align-items-center justify-content-between">
	<form name="frmDelete" method="post"
		action="<c:url value='/board/boardDelete.do'/>">
		
		<input type="text" name="boardNo" value="${param.boardNo}">
		
			<fieldset>
			<legend>글 삭제</legend>
				<div>
					<span>${param.boardNo}번 글을 삭제하시겠습니까?</span>
				</div>
				<div>
					<label for="pwd">비밀번호</label>
					<input type="text" class="form-control" 
									name="pwd" id="pwd">
				</div>
				<div class="center">
					<input type="submit" class="form-control" 
							value="삭제">
					<input type="Button" class="form-control" 
								name="btList" id="btList">
				</div>
			</fieldset> 		
	</form>
</div>

<!-- /.container-fluid -->
<div></div>
<div></div>

<!-- End of Main Content -->


