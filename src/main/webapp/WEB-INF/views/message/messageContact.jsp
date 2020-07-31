<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="<c:url value='/resources/se2/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">

$(function(){
	
});
</script>
<style type="text/css">

</style>
</head>
<body>

<div class="container-fluid">
	<div id="main" style="font-size:13px;">
		
		
	<form name="frmContact" method="post"  
				action="<c:url value='/message/messageContact.do'/> ">
		<table  width="90%" cellpadding="5" cellspacing="0" border="1" align="center" 
			style="width:700px; height: 500px; border-collapse:collapse; 
			border:1px gray solid; table-layout: fixed;" class="table table-bordered">
			<tr>
				<td colspan="3">쪽지 주소록
				
				</td>
			</tr>
			<tr>
				<td rowspan="3">부서별
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
				
				<td>
					<div id="centerBottom">
						<h3>이름으로찾기</h3>
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
				
				<td rowspan="3">
					<h3>받는 사람
						<em class="cnt">8</em>
						 / 10
					</h3>
					<div>
						<ul>
							<li></li>
						</ul>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<ul>
						
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