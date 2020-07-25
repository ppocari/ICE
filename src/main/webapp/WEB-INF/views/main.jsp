<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Main.css"/>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function() {
		$(".nav li").hover(function() {
	        $(this).children("ul").stop().slideToggle(500)
	    })
	});
</script>
<meta charset="UTF-8">
<title>I.C.E.</title>
</head>
<body>
	<header id="header_top">
		<a href="#" id="header_a"><img alt="메인 홈 가기" src="<c:url value='/resources/img/logo.PNG'/>"></a>
		<ul id="header_ul">
			<li>기능1</li>
			<li>기능2</li>
			<li>기능3</li>
		</ul>
	</header>
	<div id="div_top">
		<div id="div_a_title">
			<a href="#"><img src="<c:url value='/resources/img/title_logo1.PNG'/>"></a>
			<a href="#"><img src="<c:url value='/resources/img/title_logo2.PNG'/>"></a>
		</div>
        <ul class="nav">
          <li class="menu1"><a href="" class="menu_a1">전자결재</a>
            <ul class="sub sub1">
              <li><a href="#">메뉴1-1</a></li>
              <li><a href="#">메뉴1-2</a></li>
              <li><a href="#">메뉴1-3</a></li>
            </ul>
          </li>
          
          <li class="menu2"><a href="" class="menu_a2">메뉴2</a>
            <ul class="sub sub2">
              <li><a href="#">메뉴2-1</a></li>
              <li><a href="#">메뉴2-2</a></li>
              <li><a href="#">메뉴2-3</a></li>
            </ul>
          </li>
          
          <li class="menu3"><a href="" class="menu_a3">메뉴3</a>
            <ul class="sub sub3">
              <li><a href="#">메뉴3-1</a></li>
              <li><a href="#">메뉴3-2</a></li>
              <li><a href="#">메뉴3-3</a></li>
            </ul>
          </li>
          
          <li class="menu4"><a href="" class="menu_a4">메뉴4</a>
            <ul class="sub sub4">
              <li><a href="#">메뉴4-1</a></li>
              <li><a href="#">메뉴4-2</a></li>
              <li><a href="#">메뉴4-3</a></li>
            </ul>
          </li>
        </ul>
	</div>
	<nav class="navBar">
		<div>
			test	
		</div>
	</nav>
	<div id="divbox">
		<div id="divbox1" class="divbox">
			<div id="text">쪽지함
				<a href="#"><img src="<c:url value='/resources/img/plus.png'/>"></a>
			</div>
		</div>	
		
		<div id="divbox2" class="divbox">
			<div id="text">일정
				<a href="#"><img src="<c:url value='/resources/img/plus.png'/>"></a>
			</div>
			<div id="div_date"><input type="date" id="date"></div>
			<div id="button_cal">
				<button id="button_today" >오늘일정</button>
				<button id="button_nextday" >내일일정</button>
			</div>
			<div id="div_cal_text">여기에 일정 뿌릴예정~</div>
		</div>	
		
		<div id="divbox3">
			<img alt="I.C.E 대표 이미지" src="<c:url value='/resources/img/qq.PNG'/>" id="img"> 
		</div>	
		
		<div id="divbox4" class="divbox">
			<div id="text">전자결제
				<a href="#"><img src="<c:url value='/resources/img/plus.png'/>"></a>
			</div>
		</div>	
		
		<div id="divbox5" class="divbox">
			<div id="text">공지사항 
				<a href="#"><img src="<c:url value='/resources/img/plus.png'/>"></a>
			</div>
		</div>	
		
		<div id="divbox6" class="divbox">
			<div id="text">자유게시판
				<a href="#"><img src="<c:url value='/resources/img/plus.png'/>"></a>
			</div>
		</div>
		
	</div>
	
	
	
	
	
	
	
</body>
</html>