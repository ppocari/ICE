<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jqplot cdn -->	
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqPlot/1.0.9/jquery.jqplot.min.js"></script>	
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqPlot/1.0.9/plugins/jqplot.barRenderer.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqPlot/1.0.9/plugins/jqplot.pieRenderer.js"></script>	
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqPlot/1.0.9/plugins/jqplot.categoryAxisRenderer.min.js"></script>	
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqPlot/1.0.9/plugins/jqplot.pointLabels.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqPlot/1.0.9/plugins/jqplot.enhancedPieLegendRenderer.js"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jqplot/jquery.jqplot.css'/>" />
<style>
	/*차트*/
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

	/*바 차트*/
	div#chartdiv2 {
	    margin-left: 50%;
	    margin-top: -31%;
	}
	
	/*툴팁*/
	table.jqplot-table-legend{
		width: 30%;
    	height: 10%;
	}
	div.jqplot-table-legend-swatch{
		width: 100%;
	}
</style>
<script>
	$(function() {
		var avg = Number($("#avg").val());
		var over = Number($("#over").val());
		var under = Number($("#under").val());
		var half = Number($("#half").val());
		
		var workAvg = [avg];
		var workOver = [over];
		var workUnder = [under];
		var workHalf = [half];
		 
		// bar 차트	
		$.jqplot('chartdiv2',  [workAvg,workUnder,workOver,workHalf], {
			seriesDefaults:{
			renderer:$.jqplot.BarRenderer,	
			rendererOptions: { fillToZero: true },	
			  pointLabels: { show: true }	
			},	
			axes: {
			  xaxis: {
			    renderer: $.jqplot.CategoryAxisRenderer,	
			    ticks: [$("#month option:selected").val()],
			  }
			},
			//bar 색 변경
			seriesColors:['#567cec', '#e74a3b', '#1cc88a','#f6c23e'],
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
			title:'막대 그래프',//제목
			animate : true, // 애니메이션 설정
			animateReplot : false, // 애니메이션 반복 설정
			captureRightClick : true, // 오른쪽 마우스 클릭 이벤트
		});	
		 
		//원형 그래프
		data1 = [[['정상', avg],['지각', under], ['초과', over], ['반차',half]]];
	    toolTip1 = ['정상', '지각', '초과','반차'];
	 
	    jQuery.jqplot('chartdiv1', 
	        data1,
	        {
		    	height: 400,
		        width: 400,
	            title: '원형 그래프', 
	            seriesColors:['#567cec', '#e74a3b', '#1cc88a','#f6c23e'],
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
	                    numberColumns: 4,
	                    toolTips: toolTip1
	                }
	            },
	        }
	    );
	});
</script>
<!-- 통계 API -->
<div id="ChartDiv" style="height:100%; width:100%;">
	<div id="chartdiv1" style="height:100%; width:50%; "></div>	
	<div id="chartdiv2" style="height:100%; width:50%;"></div>	
</div>



<input type="hidden" id="avg" value="${avg }">
<input type="hidden" id="over" value="${over }">
<input type="hidden" id="under" value="${under }">
<input type="hidden" id="half" value="${half }">
