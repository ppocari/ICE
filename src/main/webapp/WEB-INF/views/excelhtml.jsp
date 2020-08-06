<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table class="table table-striped">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">이름</th>
				<th scope="col">이메일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="data" items="${datas}">
				<tr>
					<td scope="row">${data.num}</td>
					<td>${data.name}</td>
					<td>${data.email}</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>


</body>
</html>