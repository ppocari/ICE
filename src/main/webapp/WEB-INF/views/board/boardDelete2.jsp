<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</style>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
function boardDelete(){
	var input=prompt("회원 비밀번호를 입력하세요","회원 비밀번호 입력");
	
	if(input == )
}	
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
					<input type="button" class="form-control" 
							value="취소" name="btList" id="btList">
				</div>
			</fieldset> 		
	</form>
</div>

<!-- /.container-fluid -->
<div></div>
<div></div>

<!-- End of Main Content -->


