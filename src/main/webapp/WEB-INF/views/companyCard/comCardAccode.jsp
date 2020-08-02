<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	var totalCount=0;
	
	$(function(){
		$('#code').focus();
		
		$('form[name=frmCode]').submit(function(){
			if($('#code').val().length<1){
				alert('사용처를 입력하세요');
				$('#code').focus();
				//event.preventDefault();
				return false;
			}	
			
			
			event.preventDefault();
		});
		
	});
	
	
	
	
	
</script>
<style type="text/css">

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
	
</style>
</head>
<body>
	<h1>계정코드</h1>
	<p>사용처를 입력하세요</p>

	<form name="frmCode" method="post" >
		<label for="group">계정코드 그룹</label>
		<input type="text" name="group" id="group" ><br>
		<label for="code">사용처</label>
		<input type="text" name="code" id="code" >
		
		<table> 
			<tr> 
				<td>계정코드</td>
				<td>계정그룹</td>
				<td>계정제목</td>
				<td>내용 </td>
			</tr>
			<c:forEach var="vo" items="${list }">
				<tr> 
					<td> </td>
					<td> </td>
					<td> </td>
					<td> </td>
					<td> </td>
					<td> </td>
				</tr>
			</c:forEach>
		</table>
		<input type="submit" value="찾기">
	</form>	
	
	<div id="divCount"></div>
	<div id="divZip"></div>
	<div id="divPage"></div>
	
	
</body>
</html>






