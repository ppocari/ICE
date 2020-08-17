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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<script>
	$(function() {
		$("#accordion").accordion();
		
		$('input[type=reset]').click(function(){

			
			self.close();

			
			
		});
		

		$('form[name=organForm]').submit(function(){
			var idList=$('input[type=radio]:checked').attr('id').split('_');
//${organ.name }_${organ.hp1}_${organ.hp2}_${organ.hp3}_${organ.email1 }_${organ.email2 }_${organ.deptName}_${organ.posName}
			
			var name= idList[0];
			var hp1= idList[1];
			var hp2= idList[2];
			var hp3= idList[3];
			var em1= idList[4];
			var em2= idList[5];
			var deptN= idList[6];
			var posN= idList[7];
			
			$(opener.document).find("input[name=name]").val(name);
			$(opener.document).find("input[name=hp1]").val(hp1);
			$(opener.document).find("input[name=hp2]").val(hp2);
			$(opener.document).find("input[name=hp3]").val(hp3);
			$(opener.document).find("input[name=email1]").val(em1);
			$(opener.document).find("input[name=email2]").val(em2);
			$(opener.document).find("input[name=deptName]").val(deptN);
			$(opener.document).find("input[name=posName]").val(posN);
			
			self.close();
		});
		
		
	});
</script>
<style type="text/css">

.highlight{
	background-color: #ececec;
}
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
	background-color: #d2d2d2;
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
	width: 400px;
	font-size: 0.8em;
	margin-left: 6px;
}

#selectMenu a {
	text-decoration: underline;
}

#selectMenu input[type=radio] {
	width: 0.8em;
	margin-left: 15px;
	margin-bottom: 3px;
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

#frm{
	margin-top: 4px;
}

#frm span {
	margin:2px;
}

#organ_inputs{
	margin-top: 10px;
	margin-bottom: 10px;
}
#organ_inputs input{
	background-color: #4e73df;
	color:white;
}

article{
	font-size:1.25em;
}

</style>
</head>
<body style="overflow: hidden;">
<div class="row" style="padding-left: 15px;">
	<!-- Area Chart -->
	<div class="col-xl-12 " style="position: relative;left: -7px;">
	<div class="card shadow mb-4" style="height:fit-content;width: 99%;">
	<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
		<h6 class="m-0 font-weight-bold text-primary">조직도</h6>
	</div>
	<section>
		<article id="selectMenu">

			<!-- 아코디언 시작 -->
			<div id="accordion">
				<c:forEach var="dept" items="${deptList }">
					<h3>${dept.deptName }</h3>
					<div id="accordionSubDiv">
						<table class="organTable">
							<tr>
								<th></th>
								<th class="organTable_normal">이름</th>
								<th class="organTable_wide">전화번호</th>
								<th class="organTable_wide">이메일</th>
								<th class="organTable_normal">직책</th>
							</tr>
						</table>
						<c:forEach var="organ" items="${organList }">
							<c:if test="${dept.deptCode eq organ.deptCode }">
								<table class="organTable">
									<tr id="${organ.memNo }">
										<th class="organTable_narrow">
											<input type="radio" name="addressOrganRadio" 
												id="${organ.name }_${organ.hp1}_${organ.hp2}_${organ.hp3}_${organ.email1 }_${organ.email2 }_${organ.deptName}_${organ.posName}" 
												class="organ_checkboxOne">
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
				<form name="organForm">
					<div id="organ_inputs">
						<input type="submit" class="btn btn-primary" value="주소록에 추가"> 
						<input type="reset" class="btn btn-primary" value="취소">
					</div>
				</form>
		</article>
	</section>
	</div></div></div>
</body>
</html>