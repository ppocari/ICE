<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="../inc/top.jsp"%>
<!-- jqplot cdn -->	
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqPlot/1.0.9/jquery.jqplot.min.js"></script>	
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqPlot/1.0.9/plugins/jqplot.barRenderer.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqPlot/1.0.9/plugins/jqplot.pieRenderer.js"></script>	
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqPlot/1.0.9/plugins/jqplot.categoryAxisRenderer.min.js"></script>	
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqPlot/1.0.9/plugins/jqplot.pointLabels.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqPlot/1.0.9/plugins/jqplot.enhancedPieLegendRenderer.js"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jqplot/jquery.jqplot.css'/>" />


<style type="text/css">
	#divChart{
		float: left;
	}
	
	#divWorkColor{
		float: left;
	}
	
	.jqplot-pie-series.jqplot-data-label{
		color: white;
	}
	
	canvas.jqplot-pieRenderer-highlight-canvas{
		width: 20%;
	}
	
	.jqplot-cursor-tooltip{
		width: 50px;
	}
	
	/*툴팁*/
	table.jqplot-table-legend{
		width: 30%;
    	height: 10%;
	}
	div.jqplot-table-legend-swatch{
		width: 100%;
	}
	
	.card.shadow.mb-4 {
	    width: 60%;
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
						<form method="post" id="workChart" action="<c:url value='/workRecord/workChart.do'/>">
							<label>조회 할 날짜 : </label>
							<input id="cmpMonth" name="cmpMonth">
							<input type="submit" class="btn btn-primary" id="btSearch" value="조회">
						</form>
  					</div>
						<!-- 통계 API -->
						<div id="ChartDiv1">
							<div id="chartdiv1" style="height:100%;width:80%;"></div>	
						</div>
						<input type="hidden" id="avg" value="${avg }">
						<input type="hidden" id="over" value="${over }">
						<input type="hidden" id="under" value="${under }">
				</div>
			</div>
		</div>
	</div>
<script>	
$(function(){
	var avg = Number($("#avg").val());
	var over = Number($("#over").val());
	var under = Number($("#under").val());
	/* 
	// bar 차트	
	var workOver = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
	var workUnder = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
	var workAvg = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
	$.jqplot('ChartDiv1',  [workOver,workUnder,workAvg], {
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
		cursor: {
            show: true,
            zoom: true,
            looseZoom: true,
            showTooltip: true
        },
		title:'출퇴근 통계 그래프',//제목
		animate : true, // 애니메이션 설정
		animateReplot : false, // 애니메이션 반복 설정
		captureRightClick : true, // 오른쪽 마우스 클릭 이벤트
	});	
	 */
	//원형 그래프
	data1 = [[['정상', avg],['미달', under], ['초과', over]]];
    toolTip1 = ['정상', '미달', '초과'];
 
    jQuery.jqplot('chartdiv1', 
        data1,
        {
	    	height: 400,
	        width: 400,
            title: '출퇴근 통계 그래프', 
            seriesColors:['#567cec', '#fb1a66', '#52e407'],
            seriesDefaults: {
                shadow: false, 
                renderer: jQuery.jqplot.PieRenderer, 
                rendererOptions: { padding: 2, sliceMargin: 2, showDataLabels: true }
            },
            legend: {
                show: true,
                location: 'e',
                renderer: $.jqplot.EnhancedPieLegendRenderer,
                rendererOptions: {
                    numberColumns: 3,
                    toolTips: toolTip1
                }
            },
        }
    );
	
	
	
	$("#cmpMonth").datepicker({
        dateFormat:'yy-mm',
           changeYear:true,
           changeMonth:true,
           dayNamesMin:['일','월','화','수','목','금','토'],
           monthNamesShort: ['1월', '2월', '3월', '4월', '5월',
           	'6월', '7월', '8월', '9월', '10월', '11월', '12월'],
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


