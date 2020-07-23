<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<script type="text/javascript" src="<c:url value='/resources/vendor/jquery/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script> 
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css" />

 <style type="text/css">
	input[type="text"]{width: 200px;margin: 0px 0px 10px 10px;}
	#datefrm{padding-top: 10px;text-align: center;height:120px;}
	#datefrm label, 
	#datefrm input[type=submit]{margin-left: 10px;margin-right: 10px;}
	#searchDateDiv,#paylist{background-color: white;}
	#paylist{margin-top: 20px;}
	#payTable{width:100%;text-align: center;}
	#payTable thead tr{background-color: gray;color:white;}
	#div3 button,#div3 select{margin-left: 10px;}
	#div3{position: relative;left: 82%;top: -40px;}
	#upperDiv{background-color: #4e73df;color:white;font-size: 1.3em;font-weight: 600;height: 40px;}
	#upperDiv p{padding-top: 5px;padding-left: 5px;}
	#wholeDiv{padding-left: 20px;padding-right: 20px;}
</style>

<script type="text/javascript">
	$(function() {
		$('#datetimepicker1').datetimepicker({
            format: 'YYYY-MM-DD',
            date: moment().add(-7,"days")
        });
		$('#datetimepicker2').datetimepicker({
            format: 'YYYY-MM-DD',
            date: moment()
        });
		$("#datetimepicker1").on("change.datetimepicker", function(e) {
			$('#datetimepicker2').datetimepicker('minDate', e.date);
		});
		$("#datetimepicker2").on("change.datetimepicker", function(e) {
			$('#datetimepicker1').datetimepicker('maxDate', e.date);
		});
		
		$('#writeFrm').submit(function(){
			window.open('','viewer','width=1000,height=900,left=0,top=0,location=no,resizable=no,scroll=no');
			this.action='<c:url value="/payment/writePay.do"/>';
			this.method='POST';
			this.target='viewer';
		});
		
		$('.docNoInfo').click(function(){
			window.open('docView.do','Docviewer','width=1000,height=900,left=0,top=0,location=no,resizable=no,scroll=no');
		});
		
		$('#docForm').click(function(){
			window.open('setForm.do','docform','width= 768,height=600,left=0,top=0,location=no,resizable=no,scroll=no');
		});
	});
</script>
<div id="wholeDiv">
	<div id="upperDiv">
		<p>기안 상신함</p>
	</div>
	<div class="form-group" id="searchDateDiv">
		<form name="searchDateFrm" method="post" class="form-inline"
			id="datefrm" action="<c:url value='/payment/payList.do' />">
			<div class="form-group">
				<label for="startDay">작성일</label>
				<div class="input-group date" id="datetimepicker1"
					data-target-input="nearest">
					<input type="text" class="form-control datetimepicker-input"
						data-target="datetimepicker1" id="datetimepicker1" value="">
					<div class="input-group-append" data-target="#datetimepicker1"
						data-toggle="datetimepicker">
						<div class="input-group-text">
							<i class="fa fa-calendar"></i>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="input-group date" id="datetimepicker2"
					data-target-input="nearest">
					<input type="text" class="form-control datetimepicker-input"
						data-target="datetimepicker2" id="datetimepicker2" value="">
					<div class="input-group-append" data-target="#datetimepicker2"
						data-toggle="datetimepicker">
						<div class="input-group-text">
							<i class="fa fa-calendar"></i>
						</div>
					</div>
				</div>
			</div>
			<br>
			<div class="form-group">
				<label for="docType">문서종류</label> 
				<select class="form-control" id="docType" name="docType">
					<!-- 반복 시작 -->
					<option value="품의서">품의서</option>
					<!-- 반복 끝 -->
				</select> 
				<label for="title">제목</label> 
				<input type="text" class="form-control" id="title" name="title"> 
				<input class="btn btn-primary" type="submit" value="검색">
			</div>
		</form>
	</div>

	<div class="form-group" id="paylist">
	<table id="payTable" class="table table-hover">
		<thead>
			<tr>
				<th width="15%;">문서번호</th>
				<th width="10%;">문서종류</th>
				<th width="15%;">신청일</th>
				<th width="10%;">작성자</th>
				<th>제목</th>
				<th width="10%;">첨부</th>
			</tr>
		</thead>
		<!-- 반복 시작 -->
		<tbody>
			<tr>
				<td>
					<a class="docNoInfo">
						ED20200721001
					</a>
				</td>
				<td>품의서</td>
				<td>2020-07-10</td>
				<td>정은경</td>
				<td>품의서기안</td>
				<td>Y</td>
			</tr>
		</tbody>
		<!-- 반복 끝 -->
	</table>
</div>
<div id="div2">
	<button type="button" class="btn btn-primary" id="docForm">문서양식 설정</button>
	<button type="button" class="btn btn-primary" id="sendEmail">전자결재 알림</button>
</div>
<div id="div3">
	<form name="writeFrm" class="form-inline" id="writeFrm">
		<div class="form-group">
			<select class="form-control" id="docType" name="docType">
				<!-- 반복 시작 -->
				<option value="품의서">품의서</option>
				<!-- 반복 끝 -->
			</select>
			<button type="submit" class="btn btn-primary" id="writeBt">문서작성</button>
		</div>
	</form>
</div>
</div><br>

<%@include file="../inc/bottom.jsp"%>