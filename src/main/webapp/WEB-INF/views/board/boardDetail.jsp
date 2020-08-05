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
	var url="<c:url value='/board/boardDelete.do?boardNo=${param.boardNo}' />";
	var name="주소록";
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

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">사내게시판</h1>

		<a href="#"
			class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
			class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
	</div>

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-12 " >
			<div class="card shadow mb-4" style="height: 700px">
				<!-- Card Header - Dropdown -->
				
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">ICE 사내게시판</h6>
						<a href="<c:url value='/board/boardWrite.do'/>">
							<div style="float: right">
								<button type="button" class="btn btn-info">게시글작성</button>
							</div>
						</a>
						
					</div>
					
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<table>
							<tr>
								<td style="width:20%;"><h6 class="m-0 font-weight-bold text-primary">제목</h6>
								</td>
								<td style="width:80%; weight:100px;">
									${vo.title }
								</td>
							</tr>
						</table>
					</div>
					
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<table>
							<tr>
								<td style="width:20%;"><h6 class="m-0 font-weight-bold text-primary">별명</h6>
								</td>
								<td style="width:80%; weight:100px;">
									${vo.nickname }
								</td>
							</tr>
						</table>
					</div>
					
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<table>
							<tr>
								<td style="width:20%;"><h6 class="m-0 font-weight-bold text-primary">작성일</h6>
								</td>
								<td style="width:80%; weight:100px;">
									${vo.regdate }
								</td>
							</tr>
						</table>
					</div>
					
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<table>
							<tr>
								<td style="width:20%;"><h6 class="m-0 font-weight-bold text-primary">조회수</h6>
								</td>
								<td style="width:80%; weight:100px;">
									${vo.visited }
								</td>
							</tr>
						</table>
					</div>
					
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<table>
							<tr>
								<td style="width:20%;"><h6 class="m-0 font-weight-bold text-primary">내용</h6>
								</td>
								<td style="width:80%; weight:100px;">
									<p class="content">
										<%
											pageContext.setAttribute("newLine", "\r\n");
										%>
			
											${fn:replace(vo.content, newLine, '<br>')}</p>
								</td>
							</tr>
						</table>
					</div>
					
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<%-- <a href
						="<c:url value='/board/boardEdit.do?no=${param.no }'/>">
							수정</a> |--%><!--   -->
			        	<a href="javascript:popup()" >
			        		삭제</a> 
			        	<!-- <input type="button" id="btDel" value="삭제"> -->
			        	<input type="text" value="${vo.boardNo}" id="btDel_boardNo">	|
			        	<a href="<c:url value='/board/boardList.do'/>">
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

