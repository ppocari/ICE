<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">

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
<!-- Bootstrap core JavaScript-->
 
  <script src="<c:url value = "/resources/vendor/jquery/jquery.min.js"/>"></script>
  <script src="<c:url value = "/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

  <!-- Core plugin JavaScript-->
  <script src="<c:url value = "/resources/vendor/jquery-easing/jquery.easing.min.js"/>"></script>

  <!-- Custom scripts for all pages-->
  <script src="<c:url value = "/resources/js/sb-admin-2.min.js"/>"></script>

<%--  <!-- Page level plugins -->
  <script src="<c:url value = "/resources/vendor/chart.js/Chart.min.js"/>"></script>

  <!-- Page level custom scripts -->
  <script src="<c:url value = "/resources/js/demo/chart-area-demo.js"/>"></script>
  <script src="<c:url value = "/resources/js/demo/chart-pie-demo.js"/>"></script>  --%>


<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css"/>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script> 
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" /> -->


</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<c:set var="posCode" value="${sessionScope.posCode }" />
			<a class="sidebar-brand d-flex align-items-center justify-content-center"
				href="<c:url value='/main/main_user.do'/>">
				
				<!-- <c:url value='/main/main_admin.do'/> -->
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">${sessionScope.userName }</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link"
				href="index.html"> <i class="fas fa-fw fa-tachometer-alt"></i> <span>Let's
						work out!!</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<%
				
				String posCode = (String)session.getAttribute("posCode");
				if (posCode.equals("999")) { //관리자
			%>
			<div class="sidebar-heading">workspace</div>
			
			<!-- Nav Item - 사원관리 -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseNine"
				aria-expanded="true" aria-controls="collapseNine"> <i
					class="fas fa-fw fa-folder"></i> <span>사원관리</span>
			</a>
				<div id="collapseNine" class="collapse"
					aria-labelledby="headingThree" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="<c:url value="/member/memList.do" />">사원조회 및 관리</a>
						<a class="collapse-item" href="<c:url value="/member/memWrite.do" />">사원등록</a>
						
					</div>
				</div>
			</li>


			<!-- Nav Item - 자원관리-->		
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseFour"
				aria-expanded="true" aria-controls="collapseFour"> <i
					class="fas fa-fw fa-folder"></i> <span>자원 관리</span>
			</a>
				<div id="collapseFour" class="collapse" aria-labelledby="headingFour"
					data-parent="#accordionSidebar" >
					<div class="bg-white py-2 collapse-inner rounded">
						<div class="bg-white py-2 collapse-inner rounded">
							<a class="collapse-item"
								href="<c:url value='/resource/resourceMain.do'/>">자원관리</a>
						</div>

					</div>
				</div>
			</li>

			
			
			<!-- Nav Item -게시판-->		
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseEight"
				aria-expanded="true" aria-controls="collapseEight"> <i
					class="fas fa-fw fa-folder"></i> <span>게시판 관리</span>
			</a>
				<div id="collapseEight" class="collapse" aria-labelledby="headingEight"
					data-parent="#accordionSidebar" >
					<div class="bg-white py-2 collapse-inner rounded">
						<div class="bg-white py-2 collapse-inner rounded">
							<a class="collapse-item" href="<c:url value='/notice/noticeList.do'/>">공지사항</a>
							<a class="collapse-item" href="<c:url value='/board/boardList.do'/>">사내게시판</a>
						</div>

					</div>
				</div>
			</li>
			
			
			<!-- Nav Item -발권소-->		
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseFive"
				aria-expanded="true" aria-controls="collapseFive"> <i
					class="fas fa-fw fa-folder"></i> <span>식권관리대장</span>
			</a>
				<div id="collapseFive" class="collapse" aria-labelledby="headingEight"
					data-parent="#accordionSidebar" >
					<div class="bg-white py-2 collapse-inner rounded">
						<div class="bg-white py-2 collapse-inner rounded">
							<a class="collapse-item" href="<c:url value='/spay/sListAll.do'/>">사내 식권 구매내역</a>
							<!-- <a class="collapse-item" href="https://admin.iamport.kr/payments" target="_blank">환불 내역 및 상세데이터</a> -->
						</div>

					</div>
				</div>
			</li>
			

			<%
				}else { //관리자가 아니고 팀장 , 경리, 사원
			%>


			<!-- Heading -->
			<div class="sidebar-heading">workspace</div>
			
			<!-- Nav Item - 근태관리 -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#collapseOne"
			aria-expanded="true" aria-controls="collapseThree"> 
				<i class="fas fa-fw fa-folder"></i> <span>근태관리</span>
			</a>
				<div id="collapseOne" class="collapse"
					aria-labelledby="headingThree" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" 
			href="<c:url value='/workRecord/workRecord.do'/>">출퇴근</a>
						<a class="collapse-item" href="<c:url value='/workRecord/workChart.do'/>">통계보기</a>
					</div>
				</div>
			</li>

			<!-- Nav Item - 전자결재 Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseThree"
				aria-expanded="true" aria-controls="collapseThree"> <i
					class="fas fa-fw fa-folder"></i> <span>전자결재</span>
			</a>
				<div id="collapseThree" class="collapse"
					aria-labelledby="headingThree" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">결재함</h6>
						<a class="collapse-item" href="<c:url value="/payment/confirm/undecided.do" />">미결함</a>
						<a class="collapse-item" href="<c:url value="/payment/confirm/decided.do" />">기결함</a>
						<a class="collapse-item" href="<c:url value="/payment/confirm/rejected.do" />">반려함</a>
						
						<div class="collapse-divider"></div>
						<h6 class="collapse-header">기안함</h6>
						<a class="collapse-item" href="<c:url value='/payment/write/payList.do' />">기안 작성</a>
						<a class="collapse-item" href="<c:url value='/payment/write/imsyBox.do' />">임시보관함</a>
						<a class="collapse-item" href="<c:url value='/payment/write/sentpayList.do' />">기안완료함</a>
						<a class="collapse-item" href="<c:url value='/payment/write/setForm.do' />">문서 양식설정</a>
					</div>
				</div>
			</li>

			<!-- Nav Item - 자원관리-->		
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseFour"
				aria-expanded="true" aria-controls="collapseFour"> <i
					class="fas fa-fw fa-folder"></i> <span>자원관리</span>
			</a>
				<div id="collapseFour" class="collapse" aria-labelledby="headingFour"
					data-parent="#accordionSidebar" >
					<div class="bg-white py-2 collapse-inner rounded">
						<div class="bg-white py-2 collapse-inner rounded">
							<a class="collapse-item"
								href="<c:url value='/resourceUser/resourceMain.do'/>">자원목록</a>
							<a class="collapse-item"
								href="<c:url value='#'/>">예약현황</a>
						</div>

					</div>
				</div>
			</li>

			<!-- Nav Item - 법인카드-->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseFive"
				aria-expanded="true" aria-controls="collapseFive">
				<i class="fas fa-fw fa-folder"></i> <span>법인카드</span>
			</a>
				<div id="collapseFive" class="collapse" aria-labelledby="headingFive"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="<c:url value='/companyCard/MycomCard.do'/>">내 법인카드</a>
						<a class="collapse-item" href="<c:url value='/companyCard/comCardList.do'/>">법인카드 조회</a>
						<a class="collapse-item" href="<c:url value='/companyCard/comCardStatistic.do'/>">법인카드 통계</a>
						<%
						if(posCode.equals("920")){%> <!-- 경리 -->
							<a class="collapse-item" href="<c:url value='/companyCard/comCardUse.do'/>">미등록/등록</a>
							<a class="collapse-item" href="<c:url value='/companyCard/comCardUpload.do'/>">사용내역 업로드</a>
						<% }%>

					</div>
				</div>
			</li>

			<!-- Nav Item - 주소록-->		
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseSix"
				aria-expanded="true" aria-controls="collapseSix"> <i
					class="fas fa-fw fa-folder"></i> <span>주소록</span>
			</a>
				<div id="collapseSix" class="collapse" aria-labelledby="headingSix"
					data-parent="#accordionSidebar" >
					<div class="bg-white py-2 collapse-inner rounded">
						<div class="bg-white py-2 collapse-inner rounded">
							<a class="collapse-item" href="<c:url value='/address/addressMain.do'/>">주소록</a>
							<a class="collapse-item" href="<c:url value='#'/>">주소록 다운</a>

						</div>

					</div>
				</div>
			</li>
			
			<!-- Nav Item - 식권결제-->		
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseSeven"
				aria-expanded="true" aria-controls="collapseSeven"> <i
					class="fas fa-fw fa-folder"></i> <span>식권결제</span>
			</a>
				<div id="collapseSeven" class="collapse" aria-labelledby="headingSeven"
					data-parent="#accordionSidebar" >
					<div class="bg-white py-2 collapse-inner rounded">
						<div class="bg-white py-2 collapse-inner rounded">
							<a class="collapse-item" href="<c:url value='/spay/sbuy.do'/>">결제</a>
							<a class="collapse-item" href="<c:url value='/spay/sList.do'/>">사용내역</a>
						</div>

					</div>
				</div>
			</li>
			
			<!-- Nav Item -게시판-->		
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseEight"
				aria-expanded="true" aria-controls="collapseEight"> <i
					class="fas fa-fw fa-folder"></i> <span>게시판</span>
			</a>
				<div id="collapseEight" class="collapse" aria-labelledby="headingEight"
					data-parent="#accordionSidebar" >
					<div class="bg-white py-2 collapse-inner rounded">
						<div class="bg-white py-2 collapse-inner rounded">
							<a class="collapse-item" href="<c:url value='/notice/noticeList.do'/>">공지사항</a>
							<a class="collapse-item" href="<c:url value='/board/boardList.do'/>">사내게시판</a>
						</div>

					</div>
				</div>
			</li>
			
			<!-- Nav Item -게시판-->		
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseNine"
				aria-expanded="true" aria-controls="collapseNine"> <i
					class="fas fa-fw fa-folder"></i> <span>쪽지</span>
			</a>
				<div id="collapseNine" class="collapse" aria-labelledby="headingNine"
					data-parent="#accordionSidebar" >
					<div class="bg-white py-2 collapse-inner rounded">
						<div class="bg-white py-2 collapse-inner rounded">
							<a class="collapse-item" href="<c:url value='/message/msgWrite.do'/>">쪽지쓰기</a>
							<a class="collapse-item" href="<c:url value='/message/msgSendList.do'/>">보낸쪽지함</a>
							<a class="collapse-item" href="<c:url value='/message/msgRecList.do'/>">받은쪽지함</a>
							<a class="collapse-item" href="<c:url value='#'/>">휴지통</a>
						</div>

					</div>
				</div>
			</li>
			<!-- Nav Item -스케줄-->		
			<li class="nav-item"><a class="nav-link collapsed" href="<c:url value='/schedule/schedule.do'/>"> 
				<i class="fas fa-fw fa-folder"></i> <span>스케줄</span>
				</a>
			</li>

			
			<%
				}
			%>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>	<!-- 쪽지 이동 -->
					</button>

					<!-- Topbar Search -->
					<form
						class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
						<div class="input-group">
							<input type="text" class="form-control bg-light border-0 small"
								placeholder="Search for..." aria-label="Search"
								aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-primary" type="button">
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
					</form>

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<li class="nav-item dropdown no-arrow d-sm-none"><a
							class="nav-link dropdown-toggle" href="#" id="searchDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
								aria-labelledby="searchDropdown">
								<form class="form-inline mr-auto w-100 navbar-search">
									<div class="input-group">
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="Search for..." aria-label="Search"
											aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>
							</div></li>

						<!-- Nav Item - Alerts -->
						<li class="nav-item dropdown no-arrow mx-1"><a
							class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts -->
								<span class="badge badge-danger badge-counter">3+</span>
						</a> <!-- Dropdown - Alerts -->
							<div
								class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="alertsDropdown">
								<h6 class="dropdown-header">Alerts Center</h6>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-primary">
											<i class="fas fa-file-alt text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 12, 2019</div>
										<span class="font-weight-bold">A new monthly report is
											ready to download!</span>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-success">
											<i class="fas fa-donate text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 7, 2019</div>
										$290.29 has been deposited into your account!
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-warning">
											<i class="fas fa-exclamation-triangle text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 2, 2019</div>
										Spending Alert: We've noticed unusually high spending for your
										account.
									</div>
								</a> <a class="dropdown-item text-center small text-gray-500"
									href="#">Show All Alerts</a>
							</div></li>

						<!-- Nav Item - Messages -->
						<li class="nav-item dropdown no-arrow mx-1"><a
							class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> 
							<i class="fas fa-envelope fa-fw"></i>
								<!-- Counter - Messages --> <span
								class="badge badge-danger badge-counter">7<!-- 아직 안읽은 쪾지 개수 count(*)해서 뿌려주기  --></span>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="messagesDropdown">
								<h6 class="dropdown-header">Message Center</h6>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"
											src="https://source.unsplash.com/fn_BT9fwg_E/60x60" alt="">
										<div class="status-indicator bg-success"></div>
									</div>
									<div class="font-weight-bold">
										<div class="text-truncate">Hi there! I am wondering if
											you can help me with a problem I've been having.</div>
										<div class="small text-gray-500">Emily Fowler Â· 58m</div>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"
											src="https://source.unsplash.com/AU4VPcFN4LE/60x60" alt="">
										<div class="status-indicator"></div>
									</div>
									<div>
										<div class="text-truncate">I have the photos that you
											ordered last month, how would you like them sent to you?</div>
										<div class="small text-gray-500">Jae Chun Â· 1d</div>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"
											src="https://source.unsplash.com/CS2uCrpNzJY/60x60" alt="">
										<div class="status-indicator bg-warning"></div>
									</div>
									<div>
										<div class="text-truncate">Last month's report looks
											great, I am very happy with the progress so far, keep up the
											good work!</div>
										<div class="small text-gray-500">Morgan Alvarez Â· 2d</div>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"
											src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="">
										<div class="status-indicator bg-success"></div>
									</div>
									<div>
										<div class="text-truncate">Am I a good boy? The reason I
											ask is because someone told me that people say this to all
											dogs, even if they aren't good...</div>
										<div class="small text-gray-500">Chicken the Dog Â· 2w</div>
									</div>
								</a> <a class="dropdown-item text-center small text-gray-500"
									href="<c:url value='/message/messageList.do'/>">Read More Messages<!-- 받은 쪽지함으로 이동 --></a>
							</div></li>

						<div class="topbar-divider d-none d-sm-block"></div>

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.userName }</span>
								<c:if test="${empty sessionScope.memImg}">
									<img class="img-profile rounded-circle" style="width: 33px; height: 33px;"
								src="<c:url value= '/resources/img/ICElogo.png' />">
								</c:if>
								<c:if test="${!empty sessionScope.memImg}">
									<img class="img-profile rounded-circle"
								src="<c:url value= '/pd_images/${sessionScope.memImg}' />">
								</c:if>
								
								 
						</a> <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="<c:url value='/mypage/mypage.do'/>"> <i
									class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> MyPage
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
									Settings
								</a> 
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="<c:url value='/log/logout.do'/>" > <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									Logout
								</a>
							</div></li>
					</ul>
				</nav>
				<!-- End of Topbar -->

