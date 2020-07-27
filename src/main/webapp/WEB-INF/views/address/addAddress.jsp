<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.divForm div, .divForm label, .divForm .sp1 {
	font-size: 1.0em;
}

.divForm form, .divForm {
	width: 450px;
}

.divForm fieldset {
	width: 90%;
	padding: 0;
	margin: 0 auto;
	border: 0;
	border-bottom: 2px solid #e2e2e2;
}

.divForm legend {
	font-weight: bold;
	color: #555555; /* #7AA3EB; */
	padding: 10px 0;
	margin: 10px 0;
	font-size: 1.3em;
}

.divForm div {
	clear: both;
	border-bottom: 1px solid #eee;
	padding: 5px 0;
	margin: 0;
	overflow: auto;
}

.divForm .firstDiv {
	border-top: 2px solid #e2e2e2 /* #aacc00 */;
}


.divForm label, .divForm .sp1 {
	width: 20%;
	float: left;
	text-align: right;
	padding: 3px 15px 0 0;
	clear: left;
	font-weight: bold;
}

.divForm input[type="text"] {
	/* width: 55%;
		height: 1.2em;
		font-size: 0.9em; */
	border: 1px solid #DCDDE3;
}

.divForm.text_width input[type="text"], .divForm.text_width input[type="password"]
	{
	width: 55%;
	height: 1.2em;
	font-size: 0.9em;
}

.divForm select {
	border: 1px solid #DCDDE3;
	font-size: 0.9em;
}

.divForm input[type=submit], input[type=reset] {
	font-size: 1.0em;
	margin-left: 5px;
	background-color: #f3f3f3;
	border-radius: 5px 5px 5px 5px;
	border: 1px solid gray;
}

#add_inputs{
	text-align:center;
}

</style>
</head>
<body>
<section>
	<article>
		<div class="divForm">
			<form>
				<fieldset>
					<legend>기본 정보</legend>
					<div>
						<label>이름</label> <input type="text">
					</div>
					<div>
						<label>전화번호</label> <input type="text">
					</div>
					<div>
						<label>이메일</label> <input type="text">
					</div>
					<div>
						<label>그룹 선택</label> <select>
							<!-- 여기에 ui-menu api 쓰기! -->
						</select>
					</div>

					<legend>추가 정보</legend>
					<div>
						<label>회사명</label> <input type="text">
					</div>
					<div>
						<label>부서</label> <input type="text">
					</div>
					<div>
						<label>직책</label> <input type="text">
					</div>

					<div id="add_inputs">
						<input type="submit" value="등록"> 
						<input type="reset" value="취소">
					</div>
				</fieldset>
			</form>
		</div>
	</article>
</section>

</body>
</html>