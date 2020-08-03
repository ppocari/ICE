<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
.search input{
	width:150px;
}


</style>
<script type="text/javascript">
	$(function(){
		$("form[name=comCardFrm]").submit(function(){
			var year = $("#year").text();
			var month = $("#month").val();
			
			 $(this).attr("action", "/ice/companyCard/comCardUse.do?year="+year+"&month="+month); 
			
			
		});
		
		/* $("#dynamicTbody tr").click(function(){
			var str = '';
			//{"memno":"111910","useplace":"서울시","no":7,"acccode":null,"price":9000,"cardno":"4321222233331234","posname":"사원1","fileno":"1","deptname":"영업1팀","name":"정그래","usedate":"2020-07-31"}
			$.ajax({
				url: "<c:url value='/companyCard/comCardAjax.do' />",
				type: "get",
				data: "comcard_no="+$(this).children().eq(0).val(),
				dataType: "json",
				success:function(res){
					str += '<tr>';
					str += '<td><input type="text" name="CARDNO" class="registerTable" value="'+res.cardno+'" /></td>';
					str += '<td><input type="text" name="NAME" class="registerTable" value="'+res.name+'" /></td>';
					str += '<td><input type="text" name="ACCCODE" class="registerTable" value="'+res.acccode+'" /></td>';
					str += '<td><input type="text" name="USEPLACE" class="registerTable" value="'+res.useplace+'" /></td>';
					str += '<td><input type="text" name="PRICE" class="registerTable" value="'+res.price+'" /></td>';
					str += '<td><input type="text" name="USEDATE" class="registerTable" value="'+res.usedate+'">';
					str += '<td><input type="text" name="DEPTNAME" class="registerTable" value="'+res.deptname+'" /></td>';
					str += '<td><input type="text" name="POSNAME" class="registerTable" value="'+res.posname+'" /></td>';
					str += '</tr>';
					
					
					$("#dynamicTbody2").append(str);
				}
				
			});
		}); */
		
		$("#acccode").click(function(){
			var edit_memNo = $(this).children().eq(0).text();
			window.open('/ice/companyCard/Accode.do','companyCard',
			'width=400,height=500,left=50,top=50,location=yes,resizable=yes');
			
		});
	});
		
		
	
	
</script>
<!-- Begin Page Content -->

<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">미등록/등록</h1>

		<a href="#"
			class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
			class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
	</div>

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-12 " >
			<div class="card shadow mb-4" >
				<!-- Card Header - Dropdown -->
				<form name="comCardFrm" method="post"  
				action="<c:url value='/companyCard/comCardUse.do'/> ">
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">미등록</h6>
						<div style="float: right">
							<% Date d = new Date();
								SimpleDateFormat sdf_year  = new SimpleDateFormat("yyyy");
								SimpleDateFormat sdf_month  = new SimpleDateFormat("MM");
								
								String year = sdf_year.format(d);
								String month = sdf_month.format(d);
								
								if(month.length() == 1){
									month = "0"+month;
								}
							%>
							<label id = "year"><%= year %></label>
							<select id = "month">
 								<%
								for( int i=1; i<Integer.parseInt(month); i++){
									%>
									<c:set var = "i" value="<%=i %>"/>
									<option value="<%=i%>" 
										<c:if test="${dsvo.month == i }">
											selected="selected"
										</c:if>
									><%= i %>월 </option>
								<%}%>
							</select>
							<button type="submit" class="btn btn-info">조회</button>
							<input type="button" value="등록으로 이동">
						</div>
						
					</div>		
					<!-- Card Body -->
					<div class="card-body">
						<div class="chart-area" style="overflow: scroll;">
							<table class="table table-bordered table-hover" id="dynamicTable">
								<thead>
									<tr>
										<th>카드번호</th>
										<th>사원이름</th>
										<th>계정코드</th>
										<th>사용처</th>
										<th>사용금액</th>
										<th>사용일</th>
										<th>부서</th>
										<th>직급</th>
									</tr>
								</thead>
								<tbody id="dynamicTbody">
									<!-- 반복시작 -->
									<c:if test="${empty list }"> 
										<tr>
											<td colspan="8">해당 월의 데이터가 없습니다</td>
										</tr>
									</c:if>
									<c:set var="i" value="${1 }" />	
									<c:if test="${!empty list }"> 
										<c:forEach var="vo" items="${list }">
											<tr id = "edit_tr${i}">
												<input type="hidden" value="${vo.NO }" id = "edit_td${i}"> 
												<td>${vo.CARDNO } </td>		
												<td>${vo.NAME } </td>		
												<td><input type="text" id="acccode" value=""></td>		
												<td>${vo.USEPLACE } </td>		
												<td>${vo.PRICE } </td>		
												<td>${vo.USEDATE } </td>		
												<td>${vo.DEPTNAME } </td>		
												<td>${vo.POSNAME } </td>		
											</tr>
											<c:set var="i" value="${i+1 }" />	
										</c:forEach>
									</c:if>
										
									
								</tbody>
						</table>
										
						</div>
					</div>		
				</form>
				<hr>
				<form name="memRegisterFrm" method="post"  
				action="<c:url value='/member/memList.do?searchKeyWord=all'/> ">
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">등록</h6>
						<div style="float: right">
							<button type="submit" class="btn btn-info"
							 >전체조회</button>
						</div>
						
					</div>		
					<!-- Card Body -->
					<div class="card-body">
						<div class="chart-area" style="overflow: scroll;">


							<table class="table table-bordered table-hover" id="dynamicTable2">
								<thead>
									<tr>
										<th>카드번호</th>
										<th>사원이름</th>
										<th>계정코드</th>
										<th>사용처</th>
										<th>사용금액</th>
										<th>사용일</th>
										<th>부서</th>
										<th>직급</th>
									</tr>
								</thead>
								<tbody id="dynamicTbody2">
									
								</tbody>
						</table>
										
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

