<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/top.jsp" %>
<style type="text/css">
	#SFformTable thead tr{background-color: #858796; color:white;}.table td, .table th{text-align: center;}#SFformlistDiv{overflow-y:auto; overflow-x:hidden;height: 480px;left: 5px;padding: 1% 10% 1% 10%;}#SFbtForm{background-color: #0079ff; color:white;}#SFbtDel{font-size:1.0em;}#SFbigDiv{padding-left: 2%;padding-right: 2%;}#SFlastDiv{padding-left: 8px;float:right;}#SFheaderDiv{background-color: #4e73df;color:white;font-size: 1.3em;font-weight: 600;height: 40px;}#SFheaderDiv p{padding-top: 5px;padding-left: 5px;}.card-header {padding: .75rem 1.25rem;margin-bottom: 0;background-color: #f8f9fc;border-bottom: 1px solid #e3e6f0;}
</style>
<script type="text/javascript">
	$(function(){
		$('#SFbtForm').click(function(){
			window.open('insertForm.do','docform','width= 790,height=620,left=0,top=0,location=no,resizable=no,scroll=no');
		});
		$('.chk').click(function(){
			$(this).next().attr("disabled", false);
		});
		
		$('#chkAll').click(function(){
			if($('#chkAll').prop('checked')){
				$(".chk").prop("checked",true);
				$(".chk").next().attr("disabled", false);
			}else{
				$(".chk").prop("checked",false);
				$(".chk").next().attr("disabled", true);
			}
			
		});
	});
</script>
<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h1 class="h3 mb-0 text-gray-800" style="padding-left: 1.5%;">문서 양식설정</h1>
</div>
<div class="row" style="padding-left: 15px;">
	<!-- Area Chart -->
	<div class="col-xl-12 ">
	<div class="card shadow mb-4" style="height:fit-content;width: 99%;padding: 0px 0px 10px 0px;">
	<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
		<h6 class="m-0 font-weight-bold text-primary">양식 목록</h6>
	</div>
<div id="SFbigDiv">
	<form name="formFrm" method="post" 
		action="<c:url value='/payment/deleteForm.do' />">
	<div id="SFformlistDiv">
		<table class="table" id="SFformTable">
			<thead>
				<tr>
					<td width="10%"><input type="checkbox" id="chkAll"></td>
					<td>양식코드</td>
					<td>양식이름</td>
				</tr>
			</thead>
			<!-- 반복 시작 -->
			<tbody>
				<c:set var="idx" value="0"/>
				<c:if test="${!empty formlist }">
				<c:forEach var="docformVo" items="${formlist }">
				<tr>
					<td>
						<label class="checkbox-inline">
							<input type="checkbox" class="chk">
							<input type="hidden" name="formItems[${idx }].formNo" id="formNo" value="${docformVo.formNo }" disabled="disabled">
						</label>
					</td>
					<td>${docformVo.formNo }</td>
					<td>${docformVo.formName }</td>
				</tr>
				<c:set var="idx" value="${idx+1 }"/>
				</c:forEach>
				</c:if>
				<c:if test="${empty formlist }">
					<tr>
						<td colspan="6">새로운 양식을 등록해주세요</td>
					</tr>			
				</c:if>
				<!-- 반복 끝 -->
			</tbody>
		</table>
	</div>
	<div id="SFlastDiv">
		<button type="submit" class="btn btn-default" id="SFbtDel">선택삭제</button>
		<button type="button" class="btn btn-default" id="SFbtForm">등록</button>
	</div>
	</form>
</div>
</div></div></div>
<%@include file="../../inc/bottom.jsp"%>