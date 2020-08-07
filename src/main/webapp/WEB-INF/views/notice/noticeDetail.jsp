<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../inc/top.jsp" />

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
function popup(){
	var url="<c:url value='/notice/noticeDelete.do?noticeNo=${param.noticeNo}' />";
	var name="삭제하기";
	var option="width=500, height=500, top=100, left=200, location=no"
	window.open(url,name,option);
}	

/* $( function(){
	$("#btDel").click(function(){   
        var boardNo = $("#btDel_boardNo").val();
        console.log(boardNo);
        window.open('/ice/board/boardDelete.do?boardNo='+boardNo,'board',
        'width=930,height=500,left=50,top=50,location=yes,resizable=yes');
        
     });  
})*/
	
</script>
<!-- Begin Page Content -->

<div class="container-fluid">

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-12 " >
			<div class="card shadow mb-4" style="height: 700px">
				<!-- Card Header - Dropdown -->
				
					<input type="hidden" name="noticeNo" value="${param.noticeNo }">
					
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<a href="<c:url value='/board/boardList.do'/>">
							<h6 class="m-0 font-weight-bold text-primary">공지사항 </h6>
						</a>
						
					</div>
					<br>
					<div class="card-body"style="text-align:center;">
						<span style="font-size:25px; display: inline-block;
									text-align:left; vertical-align:middle;">
									${vo.title }</span>
						<br><br>
						<p>
							<a href="#">
								<span style="font-size:14px; display: inline-block;
									text-align:left; vertical-align:middle;">
									관리자</span>
							</a><br>
							<span style="vertical-algin:middle; opacity:.4;">
								<fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd-HH:mm"/>
							</span>
							<span style="vertical-algin:middle; opacity:.4;">
								| ${vo.readcount} 읽음
							</span>
						</p>
					</div>
					<hr>					
					
					<div class="card-body">
						<p class="content">
							<% pageContext.setAttribute("newLine", "\r\n"); %>
							${fn:replace(vo.content, newLine, '<br>')}
						</p>
					</div>
					
					
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<a href
						="<c:url value='/notice/noticeEdit.do?noticeNo=${vo.noticeNo }'/>">
							수정</a> |
			        	<a href="javascript:popup()" >
			        		삭제</a> |
			        	<a href="<c:url value='/notice/noticeList.do'/>">
			        		목록</a>	
					</div>
					
				
			</div>
		</div>
	</div>
</div>






<!-- /.container-fluid -->
<div></div>
<div></div>

<!-- End of Main Content -->

<jsp:include page="../inc/bottom.jsp" />

