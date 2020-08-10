<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/divForm/tableForm.css'/>"/>
<link rel="stylesheet" type="text/css" 
	href="<c:url value='/resources/css/divForm/divForm.css'/>"/>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
	$(function(){
		$('#addResource').click(function(){
			window.open('<c:url value="/resource/addResource.do"/>', 'addRes', 
					'width=600, height=500, left=800, top=200, location=yes, resizable=yes');
		});
		
		/* highlight */
		$("#tableForm tr:gt(0)").hover(function(event) {
			$(this).addClass("highlight");
		}, function(event) {
			$(this).removeClass("highlight");
		});
		
		/* 자원명 누르면 수정화면 ajax 처리해서 보여주기 */
		$(".goDetail").click(function(){
			//1. 번호를 받는다
			var res_no=$(this).attr('id');
			
			//2. controller 처리를 한다
			var resNo;
			var resName;
			var resImageVar;
			var resSize;
			var resOriginalImage;
			var resLocation;
			var resSubdesc;
			var resRegdate;
			var resState;
			var resIsDel;
			
			$(function(){
				
				$.ajax({
					url:"<c:url value='/resource/detailResource.do'/>",
					type:"get",
					data:{
						resNo:res_no
					},
					success:function(res){
						resNo=res.resNo;
						resName=res.resName;
						if(res.resImage!=null && res.resImage.length!=0) {
							resImage=res.resImage;
						}
						if(res.resSize!=0) {
							resSize=res.resSize;
						}
						if(res.resOriginalImage!=null && res.resOriginalImage.length!=0) {
							resOriginalImage=res.resOriginalImage;
						}
						if(res.resLocation!=null && res.resLocation.length!=0) {
							resLocation=res.resLocation;
						}
						if(res.resSubdesc!=null && res.resSubdesc.length!=0) {
							resSubdesc=res.resSubdesc;
							
							resSubdesc.replace('\r\n', '<br>');
							
						}
						if(res.resImage!=null && res.resImage.length!=0) {
							resImageVar="<c:url value='/resource_file/"+resImage+"'/>";
						}
						if(res.resRegdate!=null && res.resRegdate.length!=0) {
							resRegdate=res.resRegdate;
						}
						if(res.resState!=null && res.resState.length!=0) {
							resState=res.resState;
						}
						if(res.resIsDel!=null && res.resIsDel.length!=0) {
							resIsDel=res.resIsDel;
						}
					
					/* 	var str="";
							str+="번호 : " + res.resNo+"<br>";
							str+="이름 : " + res.resName+"<br>";
						alert(str); */
						
						$('#loadDetailResource').css('visibility', 'visible');
						
						$('#spanResName').html('');
						$('#divImage').html('');
						$('#spanResLocation').html('');
						$('#spanResState').html('');
						$('#spanResSubdesc').html('');

						$('#spanResName').html(resName);
						if(res.resImage!=null && res.resImage.length!=0) {
							$('#divImage').html('<img width="250" height="250" id="spanResImage" style="border: 1px solid lightgray" src="'+resImageVar+'">');
						}
							
						$('#spanResLocation').html(resLocation);
						$('#spanResState').html(resState);
						$('#spanResSubdesc').html(resSubdesc);
						
					},
					error:function(xhr, status, error) {
						alert(status+", "+error);
					}
				});
			});
			

			
			// 3. div 텍스트 공간에 html < % @ include file="/detailResource.do" % >를 넣는다.
			/* #loadDetailResource */
		});
	});
	function resEdit(resNo) {
		window.open('<c:url value="/resource/editResource.do?resNo='+resNo+'"/>', 'addRes', 
		'width=600, height=500, left=800, top=200, location=yes, resizable=yes');
		
	}
	
	function resDel(resNo, resName) {
		var result=confirm("정말로 \'"+ resName +"\'을/를 삭제하시겠습니까?")
		if(result) {
			window.open('<c:url value="/resource/delResource.do?resNo='+resNo+'"/>', 'addRes', 
			'width=600, height=500, left=800, top=200, location=yes, resizable=yes');
			
		}
		
	}

</script>

<style type="text/css">

/* 자원목록 */
#tableDivForm{
	font-size: 0.9em;
}

#searchLoc{
	text-align: right;
} 

article > div {
	float:left;
}

#RESbottom{
	clear:both;
}

button{
	border: 1px solid lightgray;
	font-size: 0.8em;
	
}

a {
	color:#858796;
	font-size: 0.9em;
	margin-left:3px;
	text-decoration: none;
	cursor: pointer;
}

a:hover{
	text-decoration: underline;
}

article{
	font-size: 1.25em;
}

/* 자원 상세보기 */
	.divSection{
		margin:10px;
	}
	
	#divContent{
		margin: 0 auto;
		font-size: 0.8em;
	}
	
	#divDesc{
		text-align: left;
	}
	
	#divResName{
		font-weight: bold;
		text-align: center;
		
	}
	
	#divButton{
		text-align: center;
		clear:both;
		margin: 10px;
		
	}
	
	#divButton > button{
		border-radius: 5px 5px 5px 5px;
		border: 1px solid #DCDDE3;
		margin-right: 5px;
	}
	
	#divImage{
		margin: 0 auto;
	}

</style>

<section>
	<article>
		<header>
			<h3>
				자원관리<span></span>
			</h3>
		</header>
		<div class="col-xl-7 ">
			<div class="card shadow mb-4">
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">자원목록</h6>
					<div style="float: right">
						<button id="addResource" type="button" class="btn btn-info"
						 >자원 추가</button>
					</div>
				</div>
				<div id="tableDivForm">
					<table id="tableForm">
						<tr id="tableTrForm" class="card-header">
							<th>자원명</th>
							<th>장소</th>
							<th>상태</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
						<c:forEach var="rm" items="${manageList }">
							<tr>
								<td class="goDetail" id="${rm.resNo }">${rm.resName }</td>
								<td>${rm.resLocation }</td>
								<td>${rm.resState }</td>
								<td><button onclick="resEdit(${rm.resNo})">수정</button></td>
								<td><button onclick="resDel(${rm.resNo }, '${rm.resName}')">삭제</button></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
		
		<div class="col-xl-4 ">
			<div class="card shadow mb-4">
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">상세보기</h6>
				</div>
				<div id="loadDetailResource" style="visibility:hidden" class="card-body">
					<div id="divAll">
							<div class="divSection" id="divResName">
								<span id="spanResName"></span>
							</div>
							<div id="divContent">
								<div class="divSection" id="divImage">
								<!-- 이미지 -->
								</div>
								<div class="divSection" id="divDesc">
									<div>
										<span>장소: </span>
										<span id="spanResLocation">
										</span>
									</div>
									<div>
										<span>상태: </span>
										<span id="spanResState"></span>
									</div>
									<div>
										<span>자원설명: </span>
										<p id="spanResSubdesc">
											
										</p>
									</div>
								</div>
							</div>
							<div id="divButton">
								<button id="btEdit">수정</button> 
								<button id="btDel">삭제</button>
							</div>
					</div>
				</div>
			</div>
		</div>
	</article>
</section>

<div id="RESbottom">
<%@include file="../inc/bottom.jsp"%>
</div>