<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="/inc/top.do"/>        
<script type="text/javascript">
$(function(){
	$("#dynamicTbody tr").click(function(){
	    var docNo = $(this).children().eq(0).val();
	    window.open('/ice/payment/docView.do?docNo='+docNo,'Docviewer',
	    		'width=1100,height=950,left=0,top=0,location=no,resizable=no,scroll=no');
	 });
	
});
</script>
        <div class="container-fluid">
		
          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
	     <h1 class="h3 mb-0 text-gray-800">Main</h1>

          </div>

          <!-- Content Row -->
          <div class="row">

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">TODAY</div>
                      <%
                      	Date today = new Date();
                      	SimpleDateFormat sdf_today = new SimpleDateFormat("yyyy년 MM월 dd일");
                      %>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><%=sdf_today.format(today) %></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-calendar fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                <a href="<c:url value ='/companyCard/comCardList.do'/> " style="text-decoration: none;">
	                  <div class="row no-gutters align-items-center">
	                    <div class="col mr-2">
	                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">법인카드 </div>
	                      <div class="h5 mb-0 font-weight-bold text-gray-800">조회 바로가기</div>
	                    </div>
	                    <div class="col-auto">
	                      <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
	                    </div>
	                  </div>
                  </a>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                <a href="<c:url value='/payment/write/payList.do' />" style="text-decoration: none;">
	                  <div class="row no-gutters align-items-center">
	                    <div class="col mr-2">
	                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1">결재 서류
	                      
	                      </div>
	                      <div class="row no-gutters align-items-center">
	                        <div class="col-auto">
	                          <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">결재 작성 바로가기</div>
	                        </div>
	                        <div class="col">
	                          <div class="progress progress-sm mr-2">
	                            <div class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
	                          </div>
	                        </div>
	                      </div>
	                    </div>
	                    <div class="col-auto">
	                      <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
	                    </div>
	                  </div>
                  </a>
                </div>
              </div>
            </div>

            <!-- Pending Requests Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                <a href="<c:url value='/address/addressMain.do'/>" style="text-decoration: none;">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">주소록</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">주소록 바로가기</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-comments fa-2x text-gray-300"></i>
                    </div>
                  </div>
                  </a>
                </div>
              </div>
            </div>
          </div>

          <!-- Content Row -->

          <div class="row">

            <!-- Area Chart -->
            <div class="col-xl-8 col-lg-7">
              <!-- Project Card Example -->
              <div class="card shadow mb-4" style="height: 440px;">
               	<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">미결 문서
                  		<c:if test="${!empty paylist}">
	                      	<span class="badge badge-danger badge-counter" style="position: relative;">
	                      		${fn:length(paylist) }
	                      	</span>
	                      </c:if>
                  </h6>
                  <div class="dropdown no-arrow">
                   <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                     <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                   </a>
                   <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                     <a class="dropdown-item" href="<c:url value='/payment/confirm/undecided.do'/>">더보기</a>
                   </div>
                 </div>
                </div>
                 
                <div class="card-body" style="height: 300px;">
                  <table id="UDpayTable" class="table table-hover" style="overflow-x: hidden; overflow-y: scroll;">
					<tbody id="dynamicTbody">
					<!-- 반복 시작 -->
						<c:if test="${!empty paylist }">
						<c:forEach var="payVo" items="${paylist }">
							<tr>
								<input type="hidden" value="${payVo.docNo}" id="docNum">
								<td>[${payVo.typeName }] ${payVo.writedate }</td>
								<td>${payVo.name }</td>
								<td>${payVo.title }</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty paylist }">
						<tr>
							<td colspan="6" style="text-align: center;">문서가 존재하지 않습니다</td>
						</tr>
					</c:if>
						<!-- 반복 끝 -->
					</tbody>
				</table>
                </div>
              </div>
              
            </div>

            <!-- 공지사항 -->
            <div class="col-xl-4 col-lg-5">
              <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">공지사항</h6>
                </div>
                
                <!-- Card Body -->
                <div class="card-body"  style="height: 385px;overflow: hidden;">
                  <div style="height: 300px;">
                    <table id="noticeTable" class="table table-hover">
					<!-- 반복 시작 -->
						<c:if test="${!empty notiList }">
							<c:forEach var="notiVo" items="${notiList }">
								<tr onclick="location.href='<c:url value="/notice/noticeCountUpdate.do?noticeNo=${notiVo.noticeNo }"/>'">
									<td>
										<c:if test="${notiVo.category=='전체' }">
											<i class="fas fa-circle text-primary"></i>
										</c:if>
										<c:if test="${notiVo.category=='경영' }">
											<i class="fas fa-circle text-success"></i>
										</c:if>
										<c:if test="${notiVo.category=='회계' }">
											<i class="fas fa-circle text-info"></i>
										</c:if>
										<c:if test="${notiVo.category=='영업' }">
											<i class="fas fa-circle text-warning"></i>
										</c:if>
										${notiVo.title }
									</td>
									<td width="10%">
										<c:if test="${notiVo.newImgTerm<24 }">
											<img src="<c:url value='/resources/img/new.gif' />" 
												alt="new이미지">
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty notiList }">
							<tr>
								<td colspan="6" style="text-align: center;">게시글이 존재하지 않습니다</td>
							</tr>
						</c:if>
						<!-- 반복 끝 -->
				</table>
                  </div>
                  <div class="mt-4 text-center small">
                    <span class="mr-2">
                      <i class="fas fa-circle text-primary"></i> 전체
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-success"></i> 경영
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-info"></i> 회계
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-warning"></i> 영업
                    </span>
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