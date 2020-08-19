<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>I.C.E.</title>

<!-- Custom fonts for this template-->
<link
	href="<c:url value="/resources/vendor/fontawesome-free/css/all.min.css"/>"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="<c:url value="/resources/css/sb-admin-2.min.css"/>"
	rel="stylesheet">
</head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<c:url value = "/resources/vendor/jquery/jquery.min.js"/>"></script>
<script type="text/javascript">
	$(function(){
		$("#wr_submit").click(function(){
			if($('#memNo').val().length<6 || $('#memNo').val().length>6){
				alert('일치하지 않는 사원번호 입니다.');
				$('#memNo').focus();
				event.preventDefault();
			}else if($('#email').val().length<1){
				alert('이메일을 입력하세요');
				$('#email').focus();
				event.preventDefault();
			}
		}); 
		
		$("#back").click(function(){
			location.href="<c:url value='/log/login.do'/>"
		});
		
	});
</script>

<body class="bg-gradient-primary-log-admin">	
	<div class="container">
		<!-- Outer Row -->
		<div class="row justify-content-center">		
			<div class="col-xl-10 col-lg-12 col-md-9" style="margin-top: 165px;">
				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">비밀번호 찾기</h1>
									</div>
									<form class="user" name="findFrm" method="post"
										action="<c:url value="/log/findPwd.do"/>">
										<div class="form-group">
											<label for="memNo">사원번호</label> 
											<input type="text" class="form-control form-control-user"
												name="memNo" id="memNo" 
												placeholder="Your identification number...">	
										</div>
										<div class="form-group">
											<label for="email">이메일</label> 
											<input type="text" class="form-control form-control-user"
												name="email" placeholder="email@naver.com"
												id="email">
											</div>
										<hr>
										<input type="submit" id="wr_submit" value="비밀번호 찾기"
											class="btn btn-primary btn-user btn-block">	
										<input type="button" id="back" class="btn btn-primary btn-user btn-block" value="돌아가기">
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

