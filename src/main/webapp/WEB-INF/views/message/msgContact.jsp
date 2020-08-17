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


<div class="container-fluid">

	<div id="main" style="font-size:13px;"class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
		
	<form name="frmContact" method="post"  
				action="<c:url value='/message/messageContact.do'/> ">
		<table  width="90%" cellpadding="5" cellspacing="0" border="1" align="center" 
			style="width:700px; height: 500px; border-collapse:collapse; 
			border:1px gray solid; table-layout: fixed;" class="table table-bordered">
			<tr class="fixed_top">

				<td colspan="3">쪽지 주소록
				
				</td>
			</tr>
			<tr class="fixed_top">
				<td rowspan="3" style="vertical-align:top;">부서별
					<div id="leftBottom">
						<ul>
							<li>
								<a href="#" id="all">전체
								</a>
							</li>
							<li>
								<a href="#" id="all">과장이상
								</a>
							</li>
							<li>
								<a href="#" id="all">팀장
								</a>
							</li>
							<li>
								<a href="#" id="all">경리
								</a>
							</li>
						</ul>
					</div>
				
				</td>
				
				<td style="vertical-align:top;">
					<div id="centerBottom">
<!-- 	뭔 소린지 모르겠음
						<h3>이름으로찾기</h3>

						<div class="search_bar">
							<form action="">
								<fieldset>
									<span class="search_box" style="layout: fixed; width:200px">
										<input type="text" id="nameSearch" style="width:120px;">
									</span>
									<button>찾기</button>
								</fieldset>
							</form>

						이름으로찾기
 -->
						<div class="divSearch">
						   	<form name="frmSearch" method="post" 
						   		action='<c:url value="/message/messageContact.do"/>'>
						        <select name="searchCondition">
						            <option value="title" 
						            	<c:if test="${param.searchCondition=='title' }">
						            		selected="selected"
						            	</c:if>
						            >제목</option>
						            <option value="content" 
						            	<c:if test="${param.searchCondition=='content' }">
						            		selected="selected"
						            	</c:if>
						            >내용</option>
						            <option value="name" 
						            	<c:if test="${param.searchCondition=='name' }">
						            		selected="selected"
						            	</c:if>
						            >작성자</option>
						        </select>   
						        <input type="text" name="searchKeyword" title="검색어 입력"
						        	value="${param.searchKeyword}">   
								<input type="submit" value="검색">
						    </form> 

						</div>
					</div>
				
				</td>
				
				<td rowspan="3" style="vertical-align:top;">
					받는 사람
					<em class="cnt">8</em>
					 / 10
					
					<div>
						<ul>
							<li>
								
							</li>
						</ul>
					</div>
				</td>
			</tr>
			<tr class="fixed_top">
				<td>
					<ul>

						<li>
							<input type="checkbox" class="" value="">
							<label>장준환</label><br>
						</li>
						<li>
							<input type="checkbox" class="" value="">
							<label>김동율</label><br>
						</li>
						<li>
							<input type="checkbox" class="" value="">
							<label>정시하</label><br>
						</li>
						<li>
							<input type="checkbox" class="" value="">
							<label>정은경</label>
						</li>

						
							<li>
								<%-- <input type="checkbox" name="searchResult"
								 id="searchResult" value="option1" aria-label="..."
								 >${param.memNo } --%>
									
							</li>
						

					</ul>
				</td>
			</tr>
			<tr>
				<td align="center">
					<a href="#"><img alt="" src="<c:url value='/resources/img/cLeft.jpg'/>"></a>
					<a href="#"><img alt="" src="<c:url value='/resources/img/cRight.jpg'/>"></a>
				</td>
				
			</tr>
			<tr>
				<td colspan="3" align="center">

					<button>전송</button>
					<button>취소</button>

					<button type="submit" class="btn btn-primary btn-xs">확인</button>
  					<button type="button" name="backBt"class="btn btn-default btn-xs"
  						onClick="self.close();">취소</button>

				</td>
			</tr>
		
		</table>
		
		
	

	</form>
</div>

	
	</div>
</body>
</html>