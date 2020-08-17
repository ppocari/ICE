<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호 찾기</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/mypage/mainstyle.css'/>"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="<c:url value="/resources/css/sb-admin-2.min.css"/>" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="<c:url value='/resources/js/mypage/paging.js'/>"></script>

<script type="text/javascript">
	var totalCount=0;
	
	$(function(){
		$('#dong').focus();
		
		$('form[name=frmZip]').submit(function(){
			if($('#dong').val().length<1){
				alert('지역명을 입력하세요');
				$('#dong').focus();
				//event.preventDefault();
				return false;
			}	
			
			$.send(1);
			event.preventDefault();
		});
		
	});
	
	$.send = function(curPage){
		$('#currentPage').val(curPage);
		
		$.ajax({
			url:"<c:url value='/mypage/ajaxZipcode.do'/>",
			type:"post",
			dataType:"xml",
			data:$('form[name=frmZip]').serializeArray(),
			success:function(res){
				//alert(res);
				var errorCode=$(res).find("errorCode").text();
				var errorMessage=$(res).find("errorMessage").text();
				totalCount=$(res).find("totalCount").text();
				
				if(errorCode!=0){
					alert("에러:"+errorCode+" => " + errorMessage);
				}else{
					makeList(res);
					pageMake(); //페이징 처리 함수
				}
			},
			error:function(xhr, status, error){
				alert(status+", " + error);
			}
		});
	}
	
	function makeList(xmlStr){
		if(totalCount==0){
			$("#divZip")
				.html("<p style='text_align:center'>해당 주소가 없습니다.</p>");
			
			return;
		}
		
		$("#divCount").html("<p>도로명 주소 검색 결과 (" + totalCount +"건)</p>");
		
		var str = "<table class='box2'>";
		str += "<tr><th style='width:20%'>우편번호</th>";
		str += "<th style='width:80%'>도로명주소</th></tr>";
		
		$(xmlStr).find("juso").each(function(idx, item){
			var zipNo = $(this).find("zipNo").text();
			var roadAddr = $(this).find("roadAddr").text();
			
			str += "<tr>";
			str += "<td>"+ zipNo+"</td>";
			str += "<td><a href='#' "
			str += " onclick='setZipcode(\""+zipNo+"\", \""
					+roadAddr+"\")'>";
			str += roadAddr + "</a></td>";			
			str += "</tr>"; 	
		});
		
		str += "</table>";
		
		$("#divZip").html(str);
	}
	
	function pageMake(){
		var currentPage = $("#currentPage").val();
		var countPerPage = $("#countPerPage").val();
		var blockSize=10;
		
		pagination(currentPage, countPerPage,
				blockSize, totalCount);
		
		var str="";
		
		if(firstPage>1){
			str += "<a href='#' onclick='$.send("+(firstPage-1)+")'>";  
			str += "<img src='<c:url value='/resources/img/mypage/first.JPG'/>' alt='이전 블럭으로 이동'>";
			str += "</a>";
		}
			
		for(var i=firstPage;i<=lastPage;i++){ 
			if(i!=currentPage){
				str += "<a href='#' onclick='$.send("+ i +")'>["+ i 
						+"]</a>";
			}else{ 
				str += "<span style='color:blue;font-weight:bold'>";
				str += i + "</span>";
			}//if 					
		}//for 	
	
		if(lastPage <  totalPage){ 
			str += "<a href='#' onclick='$.send(" + (lastPage+1) +")'>"; 
			str += "<img src='<c:url value='/resources/img/mypage/last.JPG'/>'"; 
			str += " alt='다음 블럭으로 이동'>";
			str += "</a>";			
		}
		
		$("#divPage").html(str);
	}
	
	function setZipcode(zipcode, address){
		$(opener.document).find("#zipInput").val(zipcode);
		$(opener.document).find("input[name=addr]").val(address);
		
		self.close();
	}
	
</script>
<style type="text/css">
	body{
		margin: 0;
	}
	
	#divZip table{
		width: 430px;
		margin: 15px 0;
	}
	.blue{
		color:#006AD5;
	}
	#divPage{
		text-align: center;
	}

	label{
		font-size: 0.9em;
	}
	
	#body{
		margin: 15px;
	}
	
	#h1{
		margin: 0;
	    background: #4e73df;
	    color: white;
	    font-size: 1.7em;
	    font-weight: bold;
	    padding: 15px;
	}
</style>
</head>
<body>
	<h1 id="h1">도로명 주소 검색</h1>
	<div id="body">
		<p>도로명주소, 건물명 또는 지번을 입력하세요</p>
		<p class="blue">검색어 예 : 도로명(반포대로 58), 건물명(독립기념관), 지번(삼성동 25)</p>
		<form name="frmZip" method="post" >
			<label for="dong" style="font-weight: bold; font-size: 1.5em;">지역명</label>&nbsp;&nbsp;
			<input type="text" class="form-control" name="dong" id="dong" 
				style="display:inline; width: 200px;" value="${param.dong}">&nbsp;&nbsp;
			
			<input type="hidden" name="currentPage" id="currentPage" value="1"/> <!-- 요청 변수 설정 (현재 페이지. currentPage : n > 0) -->
			<input type="hidden" name="countPerPage" id="countPerPage" 
				value="5"/><!-- 요청 변수 설정 (페이지당 출력 개수. countPerPage 범위 : 0 < n <= 100) --> 
			<input type="hidden" name="confmKey" id="confmKey" 
				value="U01TX0FVVEgyMDE3MTIxODE3Mzc0MTEwNzU1Njg="/><!-- 요청 변수 설정 (승인키) -->
			
			<input type="submit" class="btn btn-primary" value="찾기">
		</form>	
		
		<div id="divCount"></div>
		<div id="divZip"></div>
		<div id="divPage"></div>
	</div>
</body>
</html>






