<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>email/email.jsp</title>
</head>
<body>
	<h1>이메일 발송 </h1>
	<a href="<c:url value='/email/send.do'/>">이메일 보내기</a>
</body>
</html>
