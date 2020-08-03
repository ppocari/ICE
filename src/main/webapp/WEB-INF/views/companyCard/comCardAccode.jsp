<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>zipcode/zipcode.jsp</title>
<link rel="stylesheet" type="text/css" 
	href="<c:url value='/resources/css/mainstyle.css'/>"/>
<script type="text/javascript" 
	src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#dong').focus();
		
		$('form[name=frmAccode]').submit(function(){
			if($('#dong').val().length<1){
				alert('지역명을 입력하세요');
				$('#dong').focus();
				event.preventDefault();
			}	
		});
		
	});
	
	function setZipcode(zipcode, address){
		$(opener.document).find("#useplace").val(zipcode);
		
		self.close();
	}
	
</script>
<style type="text/css">
	.box2{
		width: 470px;
	}
	
	#divZip{
		margin: 10px 0;
	}
	label{
		font-size: 0.9em;
	}
	.divPage{
		text-align: center;
		margin: 7px 0;
	}
</style>
</head>
<body>
	<h1>우편번호 검색</h1>
	<p>찾고 싶으신 주소의 동(읍,면)을 입력하세요</p>
	<form name="frmAccode" method="post" 
		action="<c:url value='/companyCard/comCardAccode.do'/>">
		<label for="useplace">사용처</label>
		<input type="text" name="useplace" id="useplace" value="${param.useplace}">
		<input type="submit" value="찾기">
	</form>	
	<c:if test="${list !=null}">
		<div id="divZip">
			<table class="box2" 
			summary="우편번호 검색 결과에 관한 표로써 우편번호,주소에 대한 정보를 제공합니다">
				<thead>
					<tr>
						<th>계정코드 </th>
						<th>계정그룹 </th>
						<th>계정제목 </th>
						<th>계정내용 </th>
					</tr>
				</thead>	
				<tbody>
					<c:if test="${empty list }">
						<tr>
							<td colspan="4" class="align_center">
								해당하는 주소가 존재하지 않습니다.
							</td>
						</tr>
					</c:if>
					<c:if test="${!empty list }">
					
						<!-- 반복 시작 -->
						<c:forEach var="vo" items="${list }">
							<tr>
								<td>${vo.accCode } </td>
								<td>${vo.accGroup } </td>
								<td>${vo.accTitle } </td>
								<td>${vo.accContent } </td>
							</tr>
						</c:forEach>
						<!-- 반복 끝 -->
					</c:if>
				</tbody>
			</table>
			
			<div class="divPage">
			<!-- 페이지 번호 추가 -->		
			<!-- 이전 블럭으로 이동 ◀ -->
			<%-- <%if(pageVo.getFirstPage()>1){ %>
				<a href="zipcode.jsp?currentPage=<%=pageVo.getFirstPage()-1%>&dong=<%=dong%>">
					<img src="../images/first.JPG" alt="이전 블럭으로 이동">
				</a>
			<%} %>
			
			<!-- [1][2][3][4][5][6][7][8][9][10] -->
			<%for(int i=pageVo.getFirstPage();i<=pageVo.getLastPage();i++){ 
				if(i > pageVo.getTotalPage()) break;
			%>
				<%if(i!=currentPage){%>
					<a href="zipcode.jsp?currentPage=<%=i%>&dong=<%=dong%>">[<%=i %>]</a>
				<%}else{ %>
					<span style="color:blue;font-weight:bold"><%=i %></span>
				<%}//if %>					
			<%}//for %>	
			
			<!-- 다음 블럭으로 이동 ▶ -->
			<%if(pageVo.getLastPage() < pageVo.getTotalPage()){ %>
				<a href="zipcode.jsp?currentPage=<%=pageVo.getLastPage()+1%>&dong=<%=dong%>">
					<img src="../images/last.JPG" alt="다음 블럭으로 이동">
				</a>
			<%} %>
 --%>			<!--  페이지 번호 끝 -->
		</div>
		</div>
	</c:if>	
</body>
</html>






