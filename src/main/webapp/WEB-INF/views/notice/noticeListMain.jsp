<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function() {
		$('.divList table.box2 tbody tr').hover(function() {
			$(this).css('background', 'skyblue').css('cursor', 'pointer');
		}, function() {
			$(this).css('background', '');
		});
	});
</script>
<!-- Begin Page Content -->

<table class="table table-bordered table-hover" id="dynamicTable">
	<colgroup >
		<col style="width: 18%;" />
		<col />
		<col style="width: 18%;" />
		<col style="width: 18%;" />
	</colgroup>
	<thead style="font: 15px;">
		<tr style="height: 0px;">
			<th scope="col">부서</th>
			<th scope="col">제목</th>
			<th scope="col">작성일</th>
			<th scope="col">조회수</th>
		</tr>
	</thead>
	<tbody id="dynamicTbody">
		<!-- 게시판 내용 반복문시작 -->
		<c:forEach var="vo" items="${list }">
			<input type="hidden" name="noticeNo" value="${vo.noticeNo }">

			<tr class="align_center">
				<td>${vo.category}</td>
				<td class="align_left">
					<!-- 조회수 올리기 --> <%-- /notice/noticeCountUpdate.do?no=${vo.no} --%>
					<a
					href="<c:url value="/notice/noticeCountUpdate.do?noticeNo=${vo.noticeNo }"/>">

						<c:if test="${fn:length(vo.title)>30 }">
															${fn:substring(vo.title, 0, 30)} ...
														</c:if> <c:if test="${fn:length(vo.title)<=30 }">
															${vo.title}
														</c:if>
				</a> <!-- 24시간 공지사항  new 이미지--> <c:if test="${vo.newImgTerm<24 }">
						<img src="<c:url value='/resources/img/new.gif' />" alt="new이미지">
					</c:if>
				</td>
				<td style="font-size: 10px;"><fmt:formatDate
						value="${vo.regdate}" pattern="yyyy-MM-dd-HH:mm" /></td>
				<td>${vo.readcount}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<!-- 검색기능 -->

<!-- /.container-fluid -->
<div></div>
<div></div>

<!-- End of Main Content -->