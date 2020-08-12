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

<body class="bg-gradient-primary-log">

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
										<h1 class="h4 text-gray-900 mb-4">Welcome I.C.E. ADMIN!</h1>
									</div>
									<form class="user" name="loginFrm" method="post"
										action="<c:url value="/log/login_admin.do"/>">
										<div class="form-group">
											<input type="text" class="form-control form-control-user"
												name="identNum" aria-describedby="emailHelp"
												placeholder="Your identification number..."
												value="${cookie.ck_identNum_ad.value }">
										</div>
										<div class="form-group">
											<input type="password" class="form-control form-control-user"
												name="pwd" placeholder="Password">
										</div>
										<div class="form-group">
											<div class="custom-control custom-checkbox small">
												 <input type="checkbox" 
													id="rememCheck"  name="rememCheck"
													<c:if test="${!empty cookie.ck_identNum_ad }">
														checked="checked"
													</c:if>>   
													
												<label  for="rememCheck">Remember Me</label>
											</div>
										</div>

										<input type="submit" value="Login"
											class="btn btn-primary btn-user btn-block">
									</form>
									<hr>
									<div class="text-center">
										<a class="small" href="forgot-password.html">Forgot
											Password?</a>
									</div>

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
