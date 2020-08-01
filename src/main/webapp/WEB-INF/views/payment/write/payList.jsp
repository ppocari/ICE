<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/top.jsp" %>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script> 
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css" />
<style type="text/css">
input[type="text"]{width: 200px;margin: 0px 0px 10px 10px;}
#title{width:100%}
#div3 button,#div3 select{margin-left: 10px;}
#div2{position: absolute;top: 740px;}
#div3{position: absolute;top: 740px;right:1%;}
#upperDiv{background-color: #4e73df;color:white;font-size: 1.3em;font-weight: 600;height: 40px;}
#upperDiv p{padding-top: 5px;padding-left: 5px;}
#wholeDiv{padding-left: 20px;padding-right: 20px;}
#keep,#formNo{width: 200px;}
</style>
<script type="text/javascript">
	$(function() {
		$('#formNo').change(function(){
			$.ajax({
				url:"<c:url value='/payment/getForm.do'/>",
				type:"get",
				data:"formNo="+$(this).val(),
				success:function(res){
					$('#summernote').summernote('code',res.content);
				},
				error:function(xhr, status, error){
					alert(status+", "+error);
				}
			});
		});
		
		$('#docForm').click(function(){
			window.open('setForm.do','docform','width= 500,height=500,left=0,top=0,location=no,resizable=no,scroll=no');
		});
	});
	function imsy(){
		$('form[name=payInfoFrm]').attr("action","<c:url value='/payment/write/imsyInsert.do?imsy=Y'/>")
	}
</script>
<!-- Content Row -->
<div class="row" style="padding-left: 15px;">
	<!-- Area Chart -->
	<div class="col-xl-12 ">
	<div class="card shadow mb-4" style="height:800px;width: 99%;padding: 10px 0px 10px 0px;">
	<div id="wholeDiv">
		<div id="upperDiv">
			<p>기안 작성하기</p>
		</div>
		<form name="payInfoFrm" method="post" enctype="multipart/form-data"
			action="<c:url value='/payment/write/insertPaydoc.do'/>">
		<input type="hidden" id="typeNo" name="typeNo" value="${param.typeNo }">
		<div class="form-group">
			<label for="docNo">문서 번호</label> 
				<input type="text" class="form-control" id="docNo" readonly="readonly">
			<label for="keep">보존 기간</label> 
			<select class="form-control" id="keep" name="keep">
				<option value="12">1년</option>
				<option value="24">2년</option>
				<option value="36">3년</option>
				<option value="48">4년</option>
				<option value="60">5년</option>
			</select>
		</div>
		<div class="form-group">
			<label for="department">기안 부서</label> 
				<input type="text" class="form-control" id="department"
					value="${memVo.deptName }" readonly="readonly">
			<label for="name">기안자</label> &ensp;&ensp;
				<input type="text" class="form-control" id="name"
					value="${memVo.name }" readonly="readonly">
				<input type="hidden" id="memNo" name="memNo"
					value="${memVo.memNo }">
		</div><br>
		<div class="form-group" id="writepay2">
			<label for="writeDay">기안 일자</label> 
				<input type="text" class="form-control" id="writeDay"
					value="" readonly="readonly">
		</div><br>
		<div id="writepay1">
			<label for="title">제목</label> &ensp;&ensp;&ensp;&ensp;
				<input type="text" class="form-control" id="title" name="title">
		</div>
		<div>
			<label for="formNo">기안 양식</label> 
			<select class="form-control" id="formNo" name="formNo">
				<option value="0"></option>
				<!-- 반복시작 -->
				<c:forEach var="docformVo" items="${formlist }">
					<option value="${docformVo.formNo }">${docformVo.formName }</option>
				</c:forEach>
				<!-- 반복끝 -->
			</select>
		</div><br>
	<div class="form-group">
		<c:import url="/payment/summer.do"></c:import>
	</div><br><br>
	<div class="form-group">
		<label for="upfile">첨부파일</label>
		<input type="file" class="form-control" id="upfile">
		<a href="#">삭제</a>
	</div>
	<div class="form-group" id="confirmBt">
		<button type="submit" class="btn btn-default" id="sendBt">결재상신</button>
		<button type="submit" class="btn btn-default" id="saveBt"
			onclick="imsy()">임시저장</button>
	</div>
</form>
	<div id="div2">
		<button type="button" class="btn btn-primary" id="docForm">문서양식 설정</button>
	</div>
	<div id="div3">
		<form name="writeFrm" class="form-inline" id="writeFrm">
			<div class="form-group">
				<select class="form-control" id="typeNo" name="typeNo">
					<!-- 반복 시작 -->
						<c:forEach var="doctypeVo" items="${doctypelist }">
							<option value="${doctypeVo.typeNo }">${doctypeVo.typeName}</option>
						</c:forEach>
					<!-- 반복 끝 -->
				</select>
				<button type="submit" class="btn btn-primary" id="writeBt">문서작성</button>
			</div>
		</form>
	</div>
	</div><br>
</div>
</div>
</div>
<%@include file="../../inc/bottom.jsp"%>