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
	width: 110px;
}
</style>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function(){
		
		$("form[name=memRegisterFrm]").submit(function(){
			if($("#dynamicTbody").text() == '' ) {
				alert("정보를 입력해주세요");
				event.preventDefault();
			}else{
				if($("#dynamicTbody tr #memRegisterCheck").is(":checked")) {
					
					console.log($("#dynamicTbody tr #memRegisterCheck").next().text());
					alert("check");
					
				}else{
					alert("uncheck");
					event.preventDefault();
				}
			}
			
		});
		
		$("#memHiredate").datepicker();
	});
	

	function memberTableCreate(){
		var tc = new Array();
		var str = '';
		
		var memNo = $("#memNo").val();
		var memName = $("#mamName").val();
		var memPwd = $("#memPwd").val();
		var memTel = $("#memTel").val();
		var memEmail = $("#memEmail").val();
		var memHiredate = $("#memHiredate").val();
		var memDepart = $("#memDepart").val();
		var memPosi = $("#memPosi").val();
		var memSalary = $("#memSalary").val();
					
		str += '<tr>';
		str += '<td><input type="checkbox" id="memRegisterCheck"></td>'
		str += '<td><input type=text name="memNo" class="registerTable" value="' + memNo + '"/></td>';
		str += '<td><input type=text name="memName" class="registerTable" value="' + memName + '"/></td>';
		str += '<td><input type=text name="memPwd" class="registerTable" value="' + memPwd + '"/></td>';
		str += '<td><input type=text name="memTel" class="registerTable" value="' + memTel + '"/></td>';
		str += '<td><input type=text name="memEmail" class="registerTable" value="' + memEmail + '"/></td>';
		str += '<td><input type=text name="memHiredate" class="registerTable" value="' + memHiredate + '"/></td>';
		str += '<td><input type=text name="memDepart" class="registerTable" value="' + memDepart + '"/></td>';
		str += '<td><input type=text name="memPosi" class="registerTable" value="' + memPosi + '"/></td>';
		str += '<td><input type=text name="memSalary" class="registerTable" value="' + memSalary + '"/></td>';
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
			<div class="card shadow mb-4">
				<!-- Card Header - Dropdown -->
				<form name="memRegisterFrm" method="post" action="/member/register.do">
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">사원등록</h6>
						<button type="submit" class="btn btn-info"
							 style="float: right">사원정보 반영하기</button>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div class="chart-area" style="overflow: scroll;">


							<table class="table table-bordered" id="dynamicTable">
								<thead>
									<tr>
										<th>db반영</th>
										<th>사원번호</th>
										<th>이름</th>
										<th>비밀번호</th>
										<th>전화번호</th>
										<th>이메일</th>
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
						<input type="text" placeholder="전화번호" id="memTel" class="register_text">
						<input type="text" placeholder="이메일" id="memEmail" class="register_text"> 
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



<!-- Content Row -->
<div class="row">

	<!-- Content Column -->
	<div class="col-lg-6 mb-4">

		<!-- Project Card Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">Projects</h6>
			</div>
			<div class="card-body">
				<h4 class="small font-weight-bold">
					Server Migration <span class="float-right">20%</span>
				</h4>
				<div class="progress mb-4">
					<div class="progress-bar bg-danger" role="progressbar"
						style="width: 20%" aria-valuenow="20" aria-valuemin="0"
						aria-valuemax="100"></div>
				</div>
				<h4 class="small font-weight-bold">
					Sales Tracking <span class="float-right">40%</span>
				</h4>
				<div class="progress mb-4">
					<div class="progress-bar bg-warning" role="progressbar"
						style="width: 40%" aria-valuenow="40" aria-valuemin="0"
						aria-valuemax="100"></div>
				</div>
				<h4 class="small font-weight-bold">
					Customer Database <span class="float-right">60%</span>
				</h4>
				<div class="progress mb-4">
					<div class="progress-bar" role="progressbar" style="width: 60%"
						aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
				</div>
				<h4 class="small font-weight-bold">
					Payout Details <span class="float-right">80%</span>
				</h4>
				<div class="progress mb-4">
					<div class="progress-bar bg-info" role="progressbar"
						style="width: 80%" aria-valuenow="80" aria-valuemin="0"
						aria-valuemax="100"></div>
				</div>
				<h4 class="small font-weight-bold">
					Account Setup <span class="float-right">Complete!</span>
				</h4>
				<div class="progress">
					<div class="progress-bar bg-success" role="progressbar"
						style="width: 100%" aria-valuenow="100" aria-valuemin="0"
						aria-valuemax="100"></div>
				</div>
			</div>
		</div>

		<!-- Color System -->
		<div class="row">
			<div class="col-lg-6 mb-4">
				<div class="card bg-primary text-white shadow">
					<div class="card-body">
						Primary
						<div class="text-white-50 small">#4e73df</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6 mb-4">
				<div class="card bg-success text-white shadow">
					<div class="card-body">
						Success
						<div class="text-white-50 small">#1cc88a</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6 mb-4">
				<div class="card bg-info text-white shadow">
					<div class="card-body">
						Info
						<div class="text-white-50 small">#36b9cc</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6 mb-4">
				<div class="card bg-warning text-white shadow">
					<div class="card-body">
						Warning
						<div class="text-white-50 small">#f6c23e</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6 mb-4">
				<div class="card bg-danger text-white shadow">
					<div class="card-body">
						Danger
						<div class="text-white-50 small">#e74a3b</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6 mb-4">
				<div class="card bg-secondary text-white shadow">
					<div class="card-body">
						Secondary
						<div class="text-white-50 small">#858796</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6 mb-4">
				<div class="card bg-light text-black shadow">
					<div class="card-body">
						Light
						<div class="text-black-50 small">#f8f9fc</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6 mb-4">
				<div class="card bg-dark text-white shadow">
					<div class="card-body">
						Dark
						<div class="text-white-50 small">#5a5c69</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<div class="col-lg-6 mb-4">

		<!-- Illustrations -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">Illustrations</h6>
			</div>
			<div class="card-body">
				<div class="text-center">
					<img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;"
						src="img/undraw_posting_photo.svg" alt="">
				</div>
				<p>
					Add some quality, svg illustrations to your project courtesy of <a
						target="_blank" rel="nofollow" href="https://undraw.co/">unDraw</a>,
					a constantly updated collection of beautiful svg images that you
					can use completely free and without attribution!
				</p>
				<a target="_blank" rel="nofollow" href="https://undraw.co/">Browse
					Illustrations on unDraw &rarr;</a>
			</div>
		</div>

		<!-- Approach -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">Development
					Approach</h6>
			</div>
			<div class="card-body">
				<p>SB Admin 2 makes extensive use of Bootstrap 4 utility classes
					in order to reduce CSS bloat and poor page performance. Custom CSS
					classes are used to create custom components and custom utility
					classes.</p>
				<p class="mb-0">Before working with this theme, you should
					become familiar with the Bootstrap framework, especially the
					utility classes.</p>
			</div>
		</div>

	</div>
</div>


<!-- /.container-fluid -->
<div></div>
<div></div>

<!-- End of Main Content -->

<jsp:include page="../inc/bottom.jsp" />

