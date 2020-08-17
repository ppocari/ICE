<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/inc/top.do"/> 
<!-- jqplot cdn -->	
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqPlot/1.0.9/jquery.jqplot.min.js"></script>	
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqPlot/1.0.9/plugins/jqplot.barRenderer.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqPlot/1.0.9/plugins/jqplot.pieRenderer.js"></script>	
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqPlot/1.0.9/plugins/jqplot.categoryAxisRenderer.min.js"></script>	
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqPlot/1.0.9/plugins/jqplot.pointLabels.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqPlot/1.0.9/plugins/jqplot.enhancedPieLegendRenderer.js"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jqplot/jquery.jqplot.css'/>" />


<style type="text/css">
	/*차트*/
	.jqplot-pie-series.jqplot-data-label{
		color: white;
	}
	
	/*바 차트*/
	div#chartdiv2 {
	    margin-left: 50%;
	    margin-top: -25%;
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
	
<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">근태관리 통계</h1>
	</div>

	<!-- Content Row -->
	<div class="row">
		<!-- Area Chart -->
		<div class="col-xl-11">
			<div class="card shadow mb-4" style="fit-content;height: fit-content;height: 550px;">
				<!-- 근태관리 조회 -->
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h5 class="m-0 font-weight-bold text-primary">월별 확인 - 그래프</h5>
					<form method="post" id="workChart" name="workChart" action="<c:url value='/workRecord/workChart.do'/>">
						<img alt="" src="<c:url value='/resources/img/workRecord/circle.jpg'/>">
						<label>연도</label>&nbsp;&nbsp;&nbsp;
						<select id="year" name="year">
							<option value="2019"
								<c:if test="${year=='2019'}">
								selected
								</c:if>
							>2019년</option>
							<option value="2020"
								<c:if test="${year=='2020'}">
								selected
								</c:if>
							>2020년</option>
						</select>
						<label>월</label>&nbsp;&nbsp;&nbsp;
						<select id="month" name="month">
							<option value="01"
								<c:if test="${month=='01'}">
								selected
								</c:if>
							>1월</option>
							<option value="02"
								<c:if test="${month=='02'}">
								selected
								</c:if>
							>2월</option>
							<option value="03"
								<c:if test="${month=='03'}">
								selected
								</c:if>
							>3월</option>
							<option value="04"
								<c:if test="${month=='04'}">
								selected
								</c:if>
							>4월</option>
							<option value="05"
								<c:if test="${month=='05'}">
								selected
								</c:if>
							>5월</option>
							<option value="06"
								<c:if test="${month=='06'}">
								selected
								</c:if>
							>6월</option>
							<option value="07"
								<c:if test="${month=='07'}">
								selected
								</c:if>
							>7월</option>
							<option value="08"
								<c:if test="${month=='08'}">
								selected
								</c:if>
							>8월</option>
							<option value="09"
								<c:if test="${month=='09'}">
								selected
								</c:if>
							>9월</option>
							<option value="10"
								<c:if test="${month=='10'}">
								selected
								</c:if>
							>10월</option>
							<option value="11"
								<c:if test="${month=='11'}">
								selected
								</c:if>
							>11월</option>
							<option value="12"
								<c:if test="${month=='12'}">
								selected
								</c:if>
							>12월</option>
						</select>
						<input type="submit" class="btn btn-primary" id="btSearch" value="조회">
					</form>
 					</div>
				<!-- 통계 API -->
				<div id="ChartDiv">
					<div id="chartdiv1" style="height:100%; width:40%; "></div>	
					<div id="chartdiv2" style="height:400px; width:40%; position: absolute;"></div>	
				</div>
				
				
				<input type="hidden" id="avg" value="${avg }">
				<input type="hidden" id="over" value="${over }">
				<input type="hidden" id="under" value="${under }">
				<input type="hidden" id="half" value="${half }">
			</div>
		</div>
	</div>
</div>

<!-- 
<div class="container-fluid">
	<div class="row">
		<div class="col-xl-12 " >
			<div class="card shadow mb-4" style="fit-content;">
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h5 class="m-0 font-weight-bold text-primary">월별 확인 - 테이블</h5>
					<input type="submit" class="btn btn-primary" id="btTable" value="테이블 보기">
				</div>
				<div id="table" style="height: 300px; overflow:auto;">
					<div id="ajaxTable"></div>
				</div>
			</div>
		</div>
	</div>
</div>
 -->
<script>	
//테이블 데이터 
function makeList(xmlStr){
		var str = "<table class='table table-bordered table-hover'>";
			str += "<tr style='background:gray; color:white;'><th>오늘날짜</th>";
			str += "<th>출근시간</th>";
			str += "<th>퇴근시간</th>";
			str += "<th>근무시간</th></tr>";
			
		if(xmlStr==''){
			str += "<tr><td colspan='4' style='text_align:center'>해당 날짜에 근태 기록이 없습니다.</td></tr>";
			str += "</table>";
			$("#ajaxTable").html(str);
			
			return;
		}else{
			$(xmlStr).each(function(idx, item){
				var cmpRegdate = item.cmpRegdate;
				var cmpIn = item.cmpIn;
				var cmpOut = item.cmpOut;
				var cmpStatus = item.cmpStatus;
				
				str += "<tr>";
				str += "<td>"+cmpRegdate+"</td>";
				str += "<td>"+cmpIn+"</td>";			
				str += "<td>"+cmpOut+"</td>";	
				/*if(cmpStatus == '지각'){
					str += "<td style='color:red';>"+cmpStatus+"</td>";			
				}
				if(cmpStatus == '반차'){
					str += "<td style='color:orange';>"+cmpStatus+"</td>";			
				}
				if(cmpStatus == '초과근무'){
					str += "<td style='color:green';>"+cmpStatus+"</td>";			
				}
				if(cmpStatus == '퇴근'){
					str += "<td>"+cmpStatus+"</td>";			
				}*/
				str += "<td>"+(cmpOut-cmpIn)+"</td>"; 	
				str += "</tr>"; 	
			});
			
			str += "</table>";
			
			$("#ajaxTable").html(str);
		}
}

$(function(){
	$("#btTable").click(function(){
		if($(this).val()=="테이블 보기"){
			$(this).val("테이블 닫기");
			$("#ajaxTable").css("display","block");
		}else{
			$(this).val("테이블 보기");
			$("#ajaxTable").css("display","none");
		}
		
		var year = $("#year option:selected").val();
		var month = $("#month option:selected").val();

		event.preventDefault();
		$.ajax({
			url:"/ice/workRecord/searchWork.do?month="+month+"&year="+year+"",
			type:"get",
			datatype:"json",
			success:function(res){
				makeList(res);	
			},
			error:function(xhr, status, error){
				alert(status + ", " + error);
			}
		});
	});
	
	
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
<%@include file="../inc/bottom.jsp"%>


