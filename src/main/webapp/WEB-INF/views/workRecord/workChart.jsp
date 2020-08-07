<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<%@include file="../inc/top.jsp"%>
<!-- jquery cdn -->	
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>	
<!-- jqplot cdn -->	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqPlot/1.0.9/jquery.jqplot.min.css">	
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqPlot/1.0.9/jquery.jqplot.min.js"></script>	
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqPlot/1.0.9/plugins/jqplot.barRenderer.min.js"></script>	
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqPlot/1.0.9/plugins/jqplot.categoryAxisRenderer.min.js"></script>	
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqPlot/1.0.9/plugins/jqplot.pointLabels.min.js"></script>

<style type="text/css">
	#divChart{
		float: left;
	}
	
	#divWorkColor{
		float: left;
	}
</style>

	
<!-- bar 차트 -->	
<!-- Begin Page Content -->
	<div class="container-fluid">
		<!-- Page Heading -->
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">근태 통계확인</h1>
		</div>
		<div><span id="name">${userName}님</span></div>
		<!-- Content Row -->
		<div class="row">
			<!-- Area Chart -->
			<div class="col-xl-12 " >
				<div class="card shadow mb-4" style="fit-content">
					<!-- 근태관리 조회 -->
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h5 class="m-0 font-weight-bold text-primary">월별 확인</h5>
  					</div>
  						<div id="divWorkColor">
							<canvas id="canvas1" width="50" height="50"
   								 style="background-color:#567cec"></canvas>
								 <label>출근</label> 
							 <canvas id="canvas1" width="50" height="50"
   								 style="background-color:#fb1a66"></canvas>
								<label>퇴근(미달)</label> 
							<canvas id="canvas1" width="50" height="50"
   								 style="background-color:#52e407"></canvas>
								<label>퇴근(초과)</label>								
						</div>
						<!-- 통계 API -->
						<div id="divChart">
							<div id="chartdiv3" style="height:100%;width:80%;"></div>	
						</div>
				</div>
			</div>
		</div>
	</div>
  
<script>	
$(function(){	
// bar 차트	
	var workOver = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
	var workUnder = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
	var workAvg = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

	$.jqplot('chartdiv3',  [workOver,workUnder,workAvg], {
		seriesDefaults:{
		// 바 그래프	
		renderer:$.jqplot.BarRenderer,	
		rendererOptions: { fillToZero: true },	
		  pointLabels: { show: true }	
		},	
		axes: {
		  xaxis: {
		    renderer: $.jqplot.CategoryAxisRenderer,	
		    ticks: ['1월', '2월', '3월', '4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		  }
		},
		//bar 색 변경
		seriesColors:['#567cec', '#fb1a66', '#52e407'],
		//배경색
		grid:{
			background:'#ffffff'
		},
		title:'출퇴근 통계 그래프',//제목
		animate : true, // 애니메이션 설정
		animateReplot : false, // 애니메이션 반복 설정
		captureRightClick : true, // 오른쪽 마우스 클릭 이벤트
	});	
	
	function draw() {
		var canvas = document.getElementById('canvas');
			if (canvas.getContext) {
				var ctx = canvas.getContext('2d');
				
				ctx.fillStyle = "rgba(0, 0, 200, 0.5)";
				ctx.fillRect(25, 25, 100, 100);
				
			}
	}
});	
</script>	
<%@include file="../inc/bottom.jsp"%>


