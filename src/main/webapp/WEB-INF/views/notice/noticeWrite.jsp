<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="<c:url value='/resources/se2/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('.btList').click(function(){
			location.href
				= "<c:url value='/notice/notice.do'/>";
		});
		
		$('form[name=frmWrite]').submit(function(){
			if($('#NOTI_TITLE').val()==''){
				alert('제목을 입력하세요');
				$('#NOTI_TITLE').focus();
				event.preventDefault();
			}/* else if($('#내용').val().length<1){
				alert('내용을 입력하세요');
				$('#내용').focus();
				event.preventDefault();
			} */
		});
	});
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

	<div>
		<form action="<c:url value='/notice/noticeWrite.do'/>" 
			id="frmWrite" name="frmWrite" method="post">
			<table border="1">
				<tr>
					<th>분류</th>
					<td><select name="NOTI_CATEGORY">
							<option value="">공지선택</option>
							<option value="전체">전체</option>
							<option value="경영">경영</option>
							<option value="회계">회계</option>
							<option value="영업">영업</option>
							<option value="경리">경리</option>
					</select> <input type="checkbox" id="chk_main" 
						name="chk_main" value="메인 공지사항 등록">메인 공지사항 등록
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="NOTI_TITLE" id="NOTI_TITLE"
						required=""></td>
				</tr>
				<tr>
					<th>파일업로드</th>
					<td><label for="upfile">첨부파일</label> <input type="file"
						id="NOTI_CONTENT" name="NOTI_CONTENT" /> <span>(최대 2M)</span></td>
				</tr>
				<tr>
					<th>내용</th>
					<td width="670">
						<%@ include file="summer.jsp" %>
					</td>
				</tr>

			</table>
		

		<div class="center">
			<input type = "submit" value="등록"/>
            <input type = "Button" class="btList" value="글목록"  />         
        </div>
        
        </form>

	</div>

</div>

<%@ include file="../inc/bottom.jsp"%>
