<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<style type="text/css">
	
	/*top*/
	div#work {
	    background: white;
	    height: 10%;
	}

	input#btStart {
	    width: 110px;
	    margin-right: 1%;
	    float: right;
	}

	input#btEnd {
	    width: 110px;
	    margin-right: 2%;
	    float: right;
	}
	
	span#spanDate {
	    margin-left: 2%;
	    margin-top: 2%;
	}
	
	#h2{
		font-weight: bold;
		margin-left: 2%;
	}
	
	#btSearch{
		float: right;
		width: 7%;
    	margin-right: 3%;
	}
	
	
	
	/*detail*/
	#modal{
		width: 30%;
		height: 40%;
		border: 1px solid gray;
		background: white;
		margin-bottom: 2%;
	}
	
	#modal div{
		margin-left: 5%;
		margin-top: 3%;
	}
	
	button#btClose {
	    float: right;
	    margin-right: 5%;
	    margin-top: 16%;
	    width: 17%;
	}
	
	/*table*/
	#name{
		margin-left: 1%;
	    font-weight: bold;
	    font-size: 1.3em;
	}
</style>
<link type="text/css" href="<c:url value='/resources/css/sb-admin-2.min.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function() {
		$("#btStart").click(function() {
			if(confirm("확인을 누르시면 취소할 수 없습니다.") == true){
				$.ajax({
					url:"<c:url value='/workRecord/ajaxStart.do'/>",
					type:"post",
					dataType:"text",
					success:function(res){
						$("#Start").append(res);
					},
					error(xhr,status,error){
						alert(status+","+error);
					}
				});
				alert("출근처리가 되었습니다.");
				$(this).hide();
			}else{
				return;
			}
		});
		
		$("#btEnd").click(function() {
			if(confirm("확인을 누르시면 취소할 수 없습니다.") == true){
				$.ajax({
					url:"<c:url value='/workRecord/ajaxEnd.do'/>",
					type:"post",
					dataType:"text",
					success:function(res){
						$("#End").append(res);
					},
					error(xhr,status,error){
						alert(status+","+error);
					}
				});
				alert("퇴근처리가 되었습니다.");
				$(this).hide();
			}else{
				return;
			}
		});
		
		/*
		$("form[name=frm]").submit(function() {
			event.PreventDefault();
			location.href="";
		});
		*/
		
		$("#btDetail").click(function() {
			window.open('<c:url value="/workRecord/detail.do"/>','workList',
		'width=600,height=500,left=0,top=0,location=yes,resizable=yes');
		});
		
		
		
		$("tr#workList").click(function() {
			$("#modal").show();
		});
		
	});//doc
</script>
	<h2 id="h2">근태관리</h2>
	<hr>
	<div id="work">
		<form name="frm" method="post"
			action="<c:url value='/workRecord/workRecord.do'/>"><br>
			<span id="spanDate">
				<img alt="" src="<c:url value='/resources/img/workRecord/circle.jpg'/>">
				<label>근무일자</label>&nbsp;&nbsp;&nbsp;<input type="date" name="start">
				~ <input type="date" name="end">
				<input type="submit" id="btSearch" class="btn btn-primary" value="조회">
			</span>
		</form>
	</div><br><br>
	<!-- style="display: none;" -->
	<%-- 
	<div id="modal" class="" >
		<div>
			<label>출근시간 : </label>
			<span id="modal_Start"> 8</span>
		</div>
		<div>			
			<label>퇴근시간 :</label>
			<span id="modal_End"> 8</span>
		</div>
		<div>			
			<label>지각시간 :</label>
			<span id=""> 0</span>
		</div>
		<div>			
			<label>결근 :</label>
			<span id=""> X</span>
		</div>
		
		<c:if text="결근시 사유서 작성페이지 이동">
			
		</c:if>
		
		<div>			
			<label>결근사유 :</label>
			<span id=""> 결근하지않았습니다.</span>
		</div>
		<button id="btClose" class="btn btn-primary">닫기</button>
	</div>
	 --%>
	<div>
		<span id="name">${userName}님</span>
		<input type="button" class="btn btn-primary" id="btEnd" value="퇴근">
		<input type="button" class="btn btn-primary" id="btStart" value="출근">
	</div>
	<table class="table table-hover">
		<tr>
			<th>출근시간</th>
			<th>퇴근시간</th>
			<th>근무시간</th>
			<th>지각시간</th>
			<th>결근</th>
		</tr>
		<tr id="workList">
			<td id="Start">${list.cmpIn }</td>
			<td id="End">${list.cmpOut }</td>
			<td>8시간</td>
			<td>0시간</td>
			<td>X</td>
			<td><button id="btDetail" class="btn btn-primary">상세보기</button></td>
		</tr>
	</table>
<%@include file="../inc/bottom.jsp"%>