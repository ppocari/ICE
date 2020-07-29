<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	width: 100px;
}
</style>
<script type="text/javascript">
	$(function(){
		
		$("form[name=memRegisterFrm]").submit(function(){
			if($("#dynamicTbody").text() == '' ) {
				alert("정보를 입력해주세요");
				event.preventDefault();
			}else{
				if($("#dynamicTbody tr #memRegisterCheck").is(":checked")) {
										
					alert("check");
					
				}else{
					alert("uncheck");
					event.preventDefault();
				}
			}
			
		});
	
		$('#btMultiRegist').click(function(){
			var len=$('tbody input[type=checkbox]:checked').length;
			if(len==0){
				alert('이벤트로 등록하려는 상품을 먼저 체크하세요');
				return;
			}
			
			$('form[name=frmList]')
	.prop("action","<c:url value='/member/registerList.do'/>");
			$('form[name=frmList]').submit();
		});	
		
		
		
		$("#memHiredate").datepicker();
	});
	

	function memberTableCreate(){
		var tc = new Array();
		var str = '';
		
		var memNo = $("#memNo").val();
		var memName = $("#mamName").val();
		var memPwd = $("#memPwd").val();
		var memHiredate = $("#memHiredate").val();
		var memDepart = $("#memDepart").val();
		var memPosi = $("#memPosi").val();
		var memSalary = $("#memSalary").val();
					
		str += '<tr>';
		str += '<td><input type="checkbox" id="memRegisterCheck"></td>'
		str += '<td><input type=text name="memNo" class="registerTable" value="' + memNo + '"/></td>';
		str += '<td><input type=text name="name" class="registerTable" value="' + memName + '"/></td>';
		str += '<td><input type=text name="pwd" class="registerTable" value="' + memPwd + '"/></td>';
		str += '<td><input type=text name="hiredate" class="registerTable" value="' + memHiredate + '"/></td>';
		str += '<td><input type=text name="deptName" class="registerTable" value="' + memDepart + '"/></td>';
		str += '<td><input type=text name="posName" class="registerTable" value="' + memPosi + '"/></td>';
		str += '<td><input type=text name="salary" class="registerTable" value="' + memSalary + '"/></td>';
		str += '</tr>';
					
		$("#dynamicTable").append(str);
		
					
		$("#memNo").val('');
		$("#mamName").val('');
		$("#memPwd").val('');
		$("#memTel").val('');
		$("#memEmail").val('');
		$("#memHiredate").val('');
		$("#memDepart").val('');
		$("#memPosi").val('');
		$("#memSalary").val('');
		}
</script>
<!-- Begin Page Content -->

<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">사원등록</h1>

		<a href="#"
			class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
			class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
	</div>

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-12 ">
			<div class="card shadow mb-4" style="height: 500px;">
				<!-- Card Header - Dropdown -->
				<form name="memRegisterFrm" method="post" action="<c:url value='/member/register.do' />">
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">사원등록</h6>
						<button type="submit" class="btn btn-info"
							 style="float: right">사원정보 반영하기</button>
							 	
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div class="chart-area" style="overflow: scroll; ">


							<table class="table table-bordered" id="dynamicTable">
								<thead>
									<tr>
										<th>db반영</th>
										<th>사원번호</th>
										<th>이름</th>
										<th>비밀번호</th>
										<th>입사일</th>
										<th>부서명</th>
										<th>직급</th>
										<th>계약연봉</th>
									</tr>
								</thead>
								<tbody id="dynamicTbody">

								</tbody>
						</table>
						
						
						<span style="font-weight: bold; font-size: 1.1em;">정보입력</span> 
						<input type="text" placeholder="사원번호" id="memNo" class="register_text">
						<input type="text" placeholder="이름" id="mamName" class="register_text"> 
						<input type="text" placeholder="비밀번호" id="memPwd" class="register_text"> 
						<input type="text" placeholder="입사일" id="memHiredate" class="register_text"> 
						<input type="text" placeholder="부서명" id="memDepart" class="register_text"> 
						<input type="text" placeholder="직급" id="memPosi" class="register_text">
						<input type="text" placeholder="계약연봉" id="memSalary" class="register_text">
						<input type="button" class="btn btn-info" onclick="memberTableCreate()"
						class="register_text" value="입력">
						
						</div>
					</div>
						
				</form>


			</div>
		</div>
	</div>
</div>






<!-- /.container-fluid -->
<div></div>
<div></div>

<!-- End of Main Content -->

<jsp:include page="../inc/bottom.jsp" />

