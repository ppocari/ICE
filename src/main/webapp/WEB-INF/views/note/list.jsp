<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
<table class="noticeMain">
	
	<colgroup>
		<col style="width:10%;"/>
		<col style="width:50%;"/>
		<col style="width:15%;"/>
		<col style="width:15%;"/>
		<col style="width:10%;"/>
	</colgroup>
	<thead>
		<tr>
			<th scope="col">부서</th>
			<th scope="col">제목</th>
			<th scope="col">작성자</th>
			<th scope="col">작성일</th>
			<th scope="col">조회수</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty list}">
			<tr>
				<td colspan="5" class="align_center">
			 	공지사항이 존재하지 않습니다.</td>
			</tr>
		</c:if>
		<c:if test="${!empty list}">
			<!-- 게시판 내용 반복문시작 -->
			<c:forEach var="vo" items="${list }">
				<tr class="align_center">
					<td>${vo.NOTI_CATEGORY}</td>
					<td class="align_left">
						<!-- 24시간 공지사항  new 이미지-->
						<c:if test="">
							<img>
						</c:if>
						
						<a href="">
							<!-- 제목보여주기 길면 일부 -->
							<c:if test="${fn:length(vo.NOTI_TITLE)>30 }">
								${fn:substring(vo.NOTI_TITLE, 0, 30)} ...
							</c:if>
							<c:if test="${fn:length(vo.NOTI_TITLE)<=30 }">
								${vo.NOTI_TITLE}
							</c:if>
						</a>
					</td>
					<td>${vo.name }</td>
					<td><fmt:formatDate value="${vo.regdate}"
						pattern="yyyy-MM-dd"/> </td>
					<td>${vo.NOTI_READCOUNT}</td>
				</tr>
			</c:forEach>
			<!-- 반복처리끝 -->
		</c:if>
	</tbody>
</table>
</div>	
<div class="divPage">
	<!-- 페이지 번호 추가 -->		
	<!-- 이전 블럭으로 이동 ◀ -->
	<c:if test="${pagingInfo.firstPage>1 }">
		<a href="#" onclick="pageProc(${pagingInfo.firstPage-1})">
			<img src="<c:url value='/resources/img/#'/>" 
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
			<img src="<c:url value='/resources/images/last.JPG'/>" 
				alt="다음 블럭으로 이동">
		</a>
	</c:if>
	<!--  페이지 번호 끝 -->
</div>

<div class="divSearch">
   	<form name="frmSearch" method="post" 
   		action='<c:url value="/notice/notice.do"/>'>
        <select name="searchCondition">
            <option value="title" 
            	<c:if test="${param.searchCondition=='title' }">
            		selected="selected"
            	</c:if>
            >제목</option>
            <option value="content" 
            	<c:if test="${param.searchCondition=='content' }">
            		selected="selected"
            	</c:if>
            >내용</option>
            <option value="name" 
            	<c:if test="${param.searchCondition=='name' }">
            		selected="selected"
            	</c:if>
            >작성자</option>
        </select>   
        <input type="text" name="searchKeyword" title="검색어 입력"
        	value="${param.searchKeyword}">   
		<input type="submit" value="검색">
    </form>
</div>

<div class="center" style="float:right">
		<a href
		="<c:url value='/reBoard/edit.do?no=${param.no }'/>">
			수정</a> |
       	<a href="<c:url value='/reBoard/delete.do?no=${param.no}&fileName=${vo.fileName}&groupNo=${vo.groupNo}&step=${vo.step }'/>" >
       		삭제</a> |
       	<a href="<c:url value='/reBoard/reply.do?no=${param.no}'/>">
       		답변</a> |
       	<a href="<c:url value='/reBoard/list.do'/>">
       		목록</a>			
</div>		
</body>
</html>