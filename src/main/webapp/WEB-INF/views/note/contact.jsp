<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="<c:url value='/resources/se2/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>


	<div id="main" style="font-size:13px;">
		
		
		
		<table  width="90%" cellpadding="5" cellspacing="0" border="1" align="center" 
			style="width:700px; height: 500px; border-collapse:collapse; border:1px gray solid; table-layout: fixed;">
			<tr>
				<td colspan="3">쪽지 주소록
				
				</td>
			</tr>
			<tr>
				<td rowspan="3">부서별
					<div id="leftBottom">
						<ul>
							<li>
								<a href="#" id="all">전체
								</a>
							</li>
							<li>
								<a href="#" id="all">과장이상
								</a>
							</li>
							<li>
								<a href="#" id="all">팀장
								</a>
							</li>
							<li>
								<a href="#" id="all">경리
								</a>
							</li>
						</ul>
					</div>
				
				</td>
				
				<td>
					<div id="centerBottom">
						<h3>이름으로찾기</h3>
						<div class="search_bar">
							<form action="">
								<fieldset>
									<span class="search_box" style="layout: fixed; width:200px">
										<input type="text" id="nameSearch" style="width:120px;">
									</span>
									<button>찾기</button>
								</fieldset>
							</form>
						</div>
					</div>
				
				</td>
				
				<td rowspan="3">
					<h3>받는 사람
						<em class="cnt">8</em>
						 / 10
					</h3>
					<div>
						<ul>
							<li></li>
						</ul>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<ul>
						<li>
							<input type="checkbox" class="" value="">
							<label>장준환</label><br>
						</li>
						<li>
							<input type="checkbox" class="" value="">
							<label>김동율</label><br>
						</li>
						<li>
							<input type="checkbox" class="" value="">
							<label>정시하</label><br>
						</li>
						<li>
							<input type="checkbox" class="" value="">
							<label>정은경</label>
						</li>
					</ul>
				</td>
			</tr>
			<tr>
				<td align="center">
					<a href="#"><img alt="" src="<c:url value='/resources/img/cLeft.jpg'/>"></a>
					<a href="#"><img alt="" src="<c:url value='/resources/img/cRight.jpg'/>"></a>
				</td>
				
			</tr>
			<tr>
				<td colspan="3" align="center">
					<button>전송</button>
					<button>취소</button>
				</td>
			</tr>
		
		</table>
		
		
	
	
	
	
	</div>
</body>
</html>