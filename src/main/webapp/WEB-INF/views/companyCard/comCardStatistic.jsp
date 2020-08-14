<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
			
			$('#deptS').click(function(){
				$.ajax({
					url:"<c:url value='/comCardStatistic.do'/>",
					type:"post",
					data:"flag=dept",
					success:function(res){
						alert("부서별 조회");
					},
					error:function(xhr, status, error){
						alert(status+", "+error);
					}
				});
			});
			
			$('#posS').click(function(){
				$.ajax({
					url:"<c:url value='/comCardStatistic.do'/>",
					type:"post",
					data:"flag=pos",
					success:function(res){
						alert("직급별 조회");
					},
					error:function(xhr, status, error){
						alert(status+", "+error);
					}
				});
			});
		});
 
 
      google.charts.load('current', {'packages':['line']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
	      var data = new google.visualization.DataTable();
	      
	      <c:forEach var="vo" items="${list}">
		      data.addColumn('number', vo.getDeptName());
	      </c:forEach>
	
	      data.addRows([
	        [1,  37.8, 80.8, 41.8],
	        [2,  30.9, 69.5, 32.4],
	        [3,  25.4,   57, 25.7],
	        [4,  11.7, 18.8, 10.5],
	        [5,  11.9, 17.6, 10.4],
	        [6,   8.8, 13.6,  7.7],
	        [7,   7.6, 12.3,  9.6],
	        [8,  12.3, 29.2, 10.6],
	        [9,  16.9, 42.9, 14.8],
	        [10, 12.8, 30.9, 11.6],
	        [11,  5.3,  7.9,  4.7],
	        [12,  6.6,  8.4,  5.2],
	        [13,  4.8,  6.3,  3.6],
	        [14,  4.2,  6.2,  3.4]
	      ]);
	
	      var options = {
	        chart: {
	          title: '법인카드 통계',
	          subtitle: '부서별 검색자료'
	        },
	        width: 900,
	        height: 500,
	        axes: {
	          x: {
	            0: {side: 'top'}
	          }
	        }
	      };
	
	      var chart = new google.charts.Line(document.getElementById('line_top_x'));
	
	      chart.draw(data, google.charts.Line.convertOptions(options));
    }
    
</script>

<!-- Begin Page Content -->

<div class="container-fluid">
	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">법인카드 통계</h1>

		<a href="#"
			class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
			class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
	</div>

	<!-- Content Row -->

	<div class="row">

		<div class="col-xl-12 " >
			<div class="card shadow mb-4" style="height:fit-content; min-height:650px;  width: 99%;padding: 0px 0px 10px 0px;">
				<!-- Card Header - Dropdown -->
				
					<form name="memRegisterFrm" method="post">
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">법인카드</h6>
						<div style="float: right">
							<button type="submit" class="btn btn-info" formaction="<c:url value='/companyCard/comCardList.do'/> "
							 >조회</button>
						</div>
						
					</div>
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">						
						<div class="search" style="margin-left: 10px;">
							<button type="submit" class="btn btn-info" id="deptS">부서별 조회</button>
						</div>
						<div class="search">
							<button type="submit" class="btn btn-info" id="posS">직급별 조회</button>
						</div>
						<div class="search" style="margin-right: 20px;">
							<label for="usedate1" style="margin-right: 20px;">사용일별</label>
							<input type="text" name="usedate1" id="usedate1" value="${dpdvo.usedate1 }"> ~
							<input type="text" name="usedate2" id="usedate2" value="${dpdvo.usedate2 }">
						</div>
						
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div id="line_top_x">
						
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

