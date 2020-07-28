<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#accordion").accordion();

		$('input[type=checkbox]').click(function(){
			var result=""; //result 초기화
			$('input[type=checkbox]:checked').each(function(idx, item){
				result+="<span style='visibility:hidden'>"+$(this).attr('id')+"</span>";  //result="111910127420"
			});
			
			alert(result);
			$('#organ_inputs_div').html(result);
		});
		
	});
</script>
<style type="text/css">

/* 	.ui-accordion{
  		color:yellow;
  	} */

/*누르면 움직일 때만 적용되는 색*/
/* 	.ui-accordion-header{
  		color:green;
  	} */

/*선택된 메뉴 색*/
/* .ui-accordion-header-active{
  		color:yellow;
  	} */

/*선택 안 된 메뉴 색*/
/*   	.ui-accordion-header-collapsed{
  		color:blue;
  	} */

/*통일된 메뉴 색*/
.ui-accordion-icons {
	background-color: lightgray;
}

/* 	.ui-accordion-header-icon{ 
  		color:purple;
  	} */

/*내용 글자 색*/
/* .ui-accordion-content{ 
  		color:#4e73df;
  	} */

/*활성화된 내용 글자 색*/
/*  .ui-accordion-content-active{ 
  		color:purple;
  	}  */
.ui-state-active {
	border: none;
}

body {
	font-family: Arial, Helvetica, sans-serif;
}

table {
	font-size: 1em;
}

.ui-draggable, .ui-droppable {
	background-position: top;
}

#selectMenu {
	width: 350px;
	font-size: 0.6em;
	
}

#selectMenu a {
	text-decoration: underline;
}

#selectMenu input[type=checkbox] {
	width: 0.8em;
}

.organTable {
	width: 98%;
}

.organTable_narrow{
	width: 10%;
}

.organTable_normal{
	width: 15%;
}

.organTable_wide{
	width: 30%;
}


#organ_inputs {
	margin: 10px;
	padding: 10px;
	text-align: center;
}

#organ_inputs input {
	font-size: 1.0em;
	margin-left: 5px;
	background-color: #f3f3f3;
	border-radius: 5px 5px 5px 5px;
	border: 1px solid gray;
}

#accordionSubDiv {
	text-align:center;
	padding: 0px;
}

</style>
</head>
<body>
	<section>
		<article id="selectMenu">

			<!-- 아코디언 시작 -->
			<div id="accordion">
				<c:forEach var="dept" items="${deptList }">
					<h3>${dept.deptName }</h3>
					<div id="accordionSubDiv">
						<table class="organTable">
							<tr>
								<th class="organTable_narrow"><input type="checkbox" class="organ_checkboxAll"></th>
								<th class="organTable_normal">이름</th>
								<th class="organTable_wide">전화번호</th>
								<th class="organTable_wide">이메일</th>
								<th class="organTable_normal">직책</th>
							</tr>
						</table>
						<c:forEach var="organ" items="${organList }">
							<c:if test="${dept.deptCode eq organ.deptCode }">
								<table class="organTable">
									<tr>
										<th class="organTable_narrow">
											<input type="checkbox" id="${organ.memNo }_${organ.name}_${organ.deptName}" class="organ_checkboxOne">
										</th>
										<td class="organTable_normal">${organ.name }</td>
										<c:if test="${empty organ.hp1 }">
											<td class="organTable_wide"></td>
										</c:if>
										<c:if test="${!empty organ.hp1 }">
											<td class="organTable_wide">${organ.hp1}-${organ.hp2}- ${organ.hp3}</td>
										</c:if>
										<c:if test="${empty organ.email1 }">
											<td class="organTable_wide"></td>
										</c:if>
										<c:if test="${!empty organ.email1 }">
											<td class="organTable_wide">${organ.email1 }@${organ.email2 }</td>
										</c:if>
										<c:if test="${empty organ.posName } ">
											<td class="organTable_normal"></td>
										</c:if>
										<c:if test="${!empty organ.posName }">
											<td class="organTable_normal">${organ.posName}</td>
										</c:if>
									</tr>
								</table>
							</c:if>
						</c:forEach>
					</div>
				</c:forEach>
			</div>
			<!-- 아코디언 끝 -->
				<form id="frm">
					<div id="organ_inputs_div">
					<!-- result가 오는 곳 -->
					</div>
				<div id="organ_inputs">
					<input type="submit" value="주소록에 추가"> 
					<input type="reset" value="취소">
					</div>
				</form>
		</article>
	</section>
</body>
</html>