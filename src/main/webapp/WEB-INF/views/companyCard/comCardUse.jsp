<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

.search input {
	width: 150px;
}

.edit_tr > td > input[type=text]{
	border: 1px solid white;
	
}

</style>
<script type="text/javascript">
	$(function(){
		$("form[name=comCardFrm]").submit(function(){
			var year = $("#year").text();
			var month = $("#month").val();
			
			 $(this).attr("action", "/ice/companyCard/comCardUse.do"); 
			
			
		});
		

		$(".acccode").click(function(){	
			var loc_num = $(this).next().val();
			console.log(loc_num);
			window.open('/ice/companyCard/Accode.do?loc_num='+loc_num,'companyCard',
			'width=1000,height=600,left=50,top=50,location=yes,resizable=yes');
			
		});
		
		$("#accReg").click(function(){
			$("form[name=regAccFrm]").submit();
	
			
		});
	});
		
		
	
	
</script>
<!-- Begin Page Content -->

<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">법인카드</h1>

		<a href="#"
			class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
			class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
	</div>

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-12 " style="height:fit-content; min-height:650px;  width: 99%;padding: 0px 0px 10px 0px;">
			<div class="card shadow mb-4" >
				<!-- Card Header - Dropdown -->
				<form name="comCardFrm" method="post"
					action="<c:url value='/companyCard/comCardUse.do'/> ">
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">미등록/등록</h6>
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
							
								<input id="year" name ="year" value="<%= year %>" style="border: hidden; width: 50px;"> 
								<select id="month" name ="month">
									<option value="<%= 0%>">--선택--</option>
									<%
									for( int i=1; i<Integer.parseInt(month); i++){
										%>
									<c:set var="i" value="<%=i %>" />
									<option value="<%=i%>"
										<c:if test="${month == i }">
												selected="selected"
											</c:if>><%= i %>월
									</option>
									<%}%>
								</select>
							
							<button type="submit" class="btn btn-success" > 조회</button>
							<input type="button" class="btn btn-info" id="accReg" value="등록">
						</div>

					</div>
					
				</form>
				<!-- Card Body -->
				<form action="<c:url value='/companyCard/regAccode.do'/>"
					name="regAccFrm" method="post">
					<div class="card-body">
						<div class="chart-area" style="overflow: scroll; overflow-x: scroll; height: 630px; ">
							<table class="table table-bordered table-hover" id="dynamicTable" style="width: 1770px;">
								<thead>
									<tr>
										<th style="width: 7%">카드사</th>
										<th style="width: 15%">카드번호</th>
										<th style="width: 8%">사원이름</th>
										<th style="width: 10%">계정제목</th>
										<th style="width: 13%">사용처</th>
										<th style="width: 10%">사용금액</th>
										<th style="width: 10%">사용일</th>
										<th style="width: 7%">부서</th>
										<th style="width: 7%">직급</th>
									</tr>
								</thead>
								<tbody id="dynamicTbody">
									<!-- 반복시작 -->
									<c:if test="${empty list }">
										<tr>
											<td colspan="9">해당 월의 데이터가 없습니다</td>
										</tr>
									</c:if>
									<c:set var="i" value="${1 }" />
									<c:if test="${!empty list }">
										<c:forEach var="vo" items="${list }">
											<tr id="edit_tr${i}" >
												<input type="hidden" name="accItems[${i}].no"  value="${vo.no }"/></td>
												<td>${vo.company }
													<input type="hidden" name="accItems[${i}].company"  value="${vo.company }" />
												</td>
												<td>${vo.cardNo }
													<input type="hidden" name="accItems[${i}].cardNo"  value="${vo.cardNo }" />
												</td>
												<td>${vo.name }
													<input style="width: 100px;" type="hidden" name="accItems[${i}].name"  value="${vo.name }" />
												</td>
												<td>
													<input type="text" id="acccode_name${i }" class="acccode" value="" name="accItems[${i}].accCode_name" style="width: 100px;" > 
													<input type="hidden" value="${i}" id="edit_td${i}">
													<input type="hidden" id="acccode${i }" class="acccode" value="" name="accItems[${i}].accCode" style="width: 100px;" > 
												</td>
												<td>${vo.usePlace }
													<input type="hidden" name="accItems[${i}].usePlace"  value="${vo.usePlace }" />
												</td>
												<td>
													<fmt:formatNumber value="${vo.price }" pattern="#,###"/>원
													<input type="hidden" name="accItems[${i}].price"  value="${vo.price}"  />
												</td>
												<td>${vo.useDate }
													<input type="hidden" name="accItems[${i}].useDate"  value="${vo.useDate }" />
												</td>
												<td>${vo.deptName }
													<input type="hidden" style="width: 100px;" name="accItems[${i}].deptName"  value="${vo.deptName }"  />
												</td>
												<td>${vo.posName }
													<input type="hidden" style="width: 100px;" name="accItems[${i}].posName"  value="${vo.posName }" readonly="readonly" />
												</td>
											</tr>
											<c:set var="i" value="${i+1 }" />
										</c:forEach>
									</c:if>
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

