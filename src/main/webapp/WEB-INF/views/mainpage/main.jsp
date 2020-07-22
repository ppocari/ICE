<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../inc/top.jsp" %>

<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function() {
		$('#message_hide').click(function() {
			$('#card_message').hide();
		});
		
		$('#message_show').click(function() {
			$('#card_message').show();
		});
		
		$('#payment_hide').click(function() {
			$('#card_payment').hide();
		});
		
		$('#payment_show').click(function() {
			$('#card_payment').show();
		});
		
		/*
		전체 hide
		$('hide').click(function() {
			$('.card-body').hide();
		});
		
		$('show').click(function() {
			$('.card-body').show();
		});
		*/
	});
</script>
        <!-- Begin Page Content -->
        <div class="container-fluid">
		
          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">마이페이지!!!</h1>
            <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
          </div>


          <!-- Content Row -->
          <div class="row">

            <!-- Content Column -->
            <div class="col-lg-6 mb-4">

              <!-- message -->
              <div class="col-xl-8 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">쪽지함</h6>
                  <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                      <div class="dropdown-header">Dropdown Header:</div>
                      <a class="dropdown-item" id="message_show" href="#">Show</a>
                      <a class="dropdown-item" id="message_hide" href="#">Hide</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">more</a>
                    </div>
                  </div>
                </div>
                <!-- Card Body -->
                <div class="card-body" id="card_message">
                  <%@include file="message.jsp" %>
                </div>
              </div>
            </div>

             <!-- payment -->
              <div class="col-xl-8 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">결재함</h6>
                  <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                      <div class="dropdown-header">Dropdown Header:</div>
                      <a class="dropdown-item" id="payment_show" href="#">Show</a>
                      <a class="dropdown-item" id="payment_hide" href="#">Hide</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">more</a>
                    </div>
                  </div>
                </div>
                <!-- Card Body -->
                <div class="card-body" id="card_payment">
                  <%@include file="payment.jsp" %>
                </div>
              </div>
            </div>

            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

 <%@ include file="../inc/bottom.jsp" %>     