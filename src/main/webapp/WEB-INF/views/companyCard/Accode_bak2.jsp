<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../inc/all_css_js.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>zipcode/zipcode.jsp</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/mainstyle.css'/>" />
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
	


<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css"/>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function(){
		var loc_num =$('input[name=loc_num]').val();	
		
		$("#dynamicTbody tr").click(function(){
			var acccode = $(this).children().eq(0).text();
			var acccode_name = $(this).children().eq(2).text();
			 alert(acccode);
			 alert(acccode_name);
			 alert(loc_num);
			$(opener.document).find("#acccode"+loc_num).val(acccode);
			$(opener.document).find("#acccode_name"+loc_num).val(acccode_name);
			self.close();
		});
	});
	
	
	function pageProc(curPage){
		$('input[name=currentPage]').val(curPage);
		console.log(curPage);
		
		$('form[name=frmAccode]').submit();
	}
</script>
<style type="text/css">
.box2 {
	width: 600px;
}

#divZip {
	margin: 10px 0;
}

label {
	font-size: 0.9em;
}

.divPage {
	text-align: center;
	margin: 7px 0;
}
#divAccode{
	    margin: 25px;
	        margin-top: 15px;
}
.divSearch{
	margin-left: 25px;
}
</style>
</head>
<body>
	<h1 style="margin: 20px;">계정 검색</h1>
	<!-- post방식으로 페이징 처리 -->
	<form action="<c:url value='/companyCard/Accode.do'/>" 
		name="frmAccode" method="post">
		<input type="hidden" name="currentPage">
		<input type="hidden" name="searchCondition" 
			value="${param.searchCondition}">
		<input type="hidden" name="searchKeyword" 
			value="${param.searchKeyword}">	
		<input type="hidden" name="loc_num" 
			value="${param.loc_num}">	
	</form>
	<div class="divSearch">
			<form name="frmSearch" method="post"
				action='<c:url value="/companyCard/Accode.do"/>'>
				<select name="searchCondition">
					<option value="ACCCODE"
						<c:if test="${param.searchCondition=='ACCCODE' }">
           		selected="selected"
           	</c:if>>계정코드</option>
					<option value="ACCGROUP"
						<c:if test="${param.searchCondition=='ACCGROUP' }">
           		selected="selected"
           	</c:if>>계정그룹</option>
					<option value="ACCTITLE"
						<c:if test="${param.searchCondition=='ACCTITLE' }">
           		selected="selected"
           	</c:if>>계정제목</option>
           			<option value="ACCCONTENT"
						<c:if test="${param.searchCondition=='ACCCONTENT' }">
           		selected="selected"
           	</c:if>>계정내용</option>
				</select> <input type="text" name="searchKeyword" title="검색어 입력"
					value="${param.searchKeyword}"> <input type="submit"
					value="검색">
			</form>
	</div>
	
	
	<c:if test="${list !=null}">
		<div id="divAccode" >
			<table class="table table-border table-hover" id="dynamicTable">
				<thead>
					<tr>
						<th >계정코드</th>
						<th >계정그룹</th>
						<th >계정제목</th>
						<th >계정내용</th>
					</tr>
				</thead>
				<tbody id="dynamicTbody">
					<c:if test="${empty list }">
						<tr>
							<td colspan="4" class="align_center">해당하는 주소가 존재하지 않습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty list }">

						<!-- 반복 시작 -->
						<c:forEach var="vo" items="${list }">
							<tr>
								<td>${vo.accCode }</td>
								<td>${vo.accGroup }</td>
								<td>${vo.accTitle }</td>
								<td>${vo.accContent }</td>
							</tr>
						</c:forEach>
						<!-- 반복 끝 -->
					</c:if>
				</tbody>
			</table>

			
		</div>
	</c:if>
	<div class="divPage">
	<!-- 페이지 번호 추가 -->		
	<!-- 이전 블럭으로 이동 ◀ -->
	<c:if test="${pagingInfo.firstPage>1 }">
		<a href="#" onclick="pageProc(${pagingInfo.firstPage-1})">
			<img src="<c:url value='/resources/img/first.JPG'/>" 
				alt="이전 블럭으로 이동">
		</a>
	</c:if> 
	
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<c:forEach var="i" begin="${pagingInfo.firstPage }" 
		end="${pagingInfo.lastPage }">		
		<c:if test="${i!=pagingInfo.currentPage }">
			<a href="#" onclick="pageProc(${i})">[${i}]</a>			
		</c:if>
		<c:if test="${i==pagingInfo.currentPage }">
			<span style="color:blue;font-weight:bold">${i}</span>			
		</c:if>		
	</c:forEach>
		
	<!-- 다음 블럭으로 이동 ▶ -->
	<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
		<a href="#" onclick="pageProc(${pagingInfo.lastPage+1})">
			<img src="<c:url value='/resources/img/last.JPG'/>" 
				alt="다음 블럭으로 이동">
		</a>
	</c:if>
	<!--  페이지 번호 끝 -->
</div>
</body>
</html>






