<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../inc/top.jsp" %>
        <!-- Begin Page Content -->
        
        <div class="container-fluid">
		
          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
	     <h1 class="h3 mb-0 text-gray-800">Main</h1>

           </div>


          <!-- Content Row -->

          <div class="row">

            <!-- 공지사항 -->
            <div class="col-xl-7 col-lg-7">
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

            <div class="col-xl-5 col-lg-5">
              <!-- 사내게시판 -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">인기 게시글</h6>
                </div>
                <div class="card-body" style="height: 385px;">
                  <div class="text-left">
                  	<table id="boardTable" class="table table-hover">
					<tbody>
					<!-- 반복 시작 -->
						<c:if test="${!empty boardList }">
							<c:forEach var="boardVo" items="${boardList }">
								<tr onclick="location.href='<c:url value="/board/boardCountUpdate.do?boardNo=${boardVo.boardNo }"/>'">
									<td width="25%;">${boardVo.nickname }</td>
									<td>${boardVo.title }</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty boardList }">
							<tr>
								<td colspan="6" style="text-align: center;">게시글이 존재하지 않습니다</td>
							</tr>
						</c:if>
						<!-- 반복 끝 -->
					</tbody>
				</table>
                  </div>
                </div>
              </div>
            </div>
          </div>
			<hr>
        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

 <%@ include file="../inc/bottom.jsp" %>     