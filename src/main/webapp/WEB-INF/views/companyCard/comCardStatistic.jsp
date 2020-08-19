<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/inc/top.do"></c:import>

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
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 
<script type="text/javascript">
	 $(function(){
			$( "input[name=usedate1]" ).datepicker({
				dateFormat:'yy-mm-dd',
		         changeYear:true,
		         changeMonth:true,
		         dayNamesMin:['일','월','화','수','목','금','토'],
		         monthNames:['1월','2월','3월','4월','5월','6월',
		            '7월','8월','9월','10월','11월','12월']
			} );
			
			$( "input[name=usedate2]" ).datepicker({
				dateFormat:'yy-mm-dd',
		         changeYear:true,
		         changeMonth:true,
		         dayNamesMin:['일','월','화','수','목','금','토'],
		         monthNames:['1월','2월','3월','4월','5월','6월',
		            '7월','8월','9월','10월','11월','12월']
			} );
			
			$("#deptS").click(function(){
				$('#flag').val("dept");
			});
			$("#posS").click(function(){
				$('#flag').val("pos");
			});
		});
 
 
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
    	  var data = google.visualization.arrayToDataTable([ 
    		  ['Sort', 'Price'], 
    		  ${result} 
   		 ]);

	      var options = {
	        chart: {
	          title: '법인카드 통계',
	          subtitle: '부서별 검색자료'
	        },
	        width: 900,
	        height: 500,
	        
	      };
	
	      var chart = new google.visualization.PieChart(document.getElementById('piechart'));
	
	      chart.draw(data, options);
    }
    
</script>

<!-- Begin Page Content -->

<div class="container-fluid">
	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">법인카드 통계</h1>

		
	</div>

	<!-- Content Row -->

	<div class="row">

		<div class="col-xl-12 " >
			<div class="card shadow mb-4" style="height:fit-content; min-height:650px;  width: 99%;padding: 0px 0px 10px 0px;">
				<!-- Card Header - Dropdown -->
				
					<form name="memRegisterFrm" method="post" action="<c:url value='/companyCard/comCardStatistic.do'/>">
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">법인카드</h6>
						<div class="search" style="margin-left: 10px;">
							<button type="submit" class="btn btn-info" id="deptS">부서별 조회</button>
						</div>
						<div class="search">
							<button type="submit" class="btn btn-info" id="posS">직급별 조회</button>
							<input type="hidden" name="flag" id="flag" value="">
						</div>
						
					</div>
					<%--<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">						
						 <div class="search" style="margin-right: 20px;">
							<label for="usedate1" style="margin-right: 20px;">사용일별</label>
							<input type="text" name="usedate1" id="usedate1" value="${dpdvo.usedate1 }"> ~
							<input type="text" name="usedate2" id="usedate2" value="${dpdvo.usedate2 }">
						</div> 
						
					</div>--%>
					<!-- Card Body -->
					<div class="card-body">
						<div id="piechart">
						
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

