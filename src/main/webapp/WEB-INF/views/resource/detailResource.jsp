<link rel="stylesheet" type="text/css" 
	href="<c:url value='/resources/css/divForm/divForm.css'/>"/>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
$(function(){
	
	$('#buReset').click(function(){
		location.href="<c:url value='/resource/resourceMain.do'/>"
		
	});
});

function resEdit(resNo) {
	window.open('<c:url value="/resource/editResource.do?resNo='+resNo+'&mode=redirect"/>', 'addRes', 
	'width=600, height=500, left=800, top=200, location=yes, resizable=yes');
	
}
</script>

<style type="text/css">
	.divSection{
		margin:20px;
	}
	
	#divContent{
		margin: 0 auto;
		width: 700px;	
	}
	
	#divImage{
		float:left;
	}
	
	#divDesc{
		float:left;
	}
	
	#divResName{
		font-weight: bold;
		text-align: center;
		font-size: 1.2em;
		
	}
	
	#divButton{
		text-align: center;
		clear:both;
		margin: 10px;
		
	}
	
	#divButton > button{
		border-radius: 5px 5px 5px 5px;
		border: 1px solid #DCDDE3;
		margin-right: 5px;
	}
	
</style>
<div id="divAll">
	<c:if test="${!empty rm }">
		<div class="divSection" id="divResName">
			<span>${rm.resName }</span>
		</div>
		<div id="divContent">
			<div class="divSection" id="divImage">
				<c:if test="${!empty rm.resImage }">
					<img width="300" height="300" src="<c:url value='/resource_file/${rm.resImage }'/>">
				</c:if>
			</div>
			<div class="divSection" id="divDesc">
				<div>
					<span>장소</span>
					<span>
						${rm.resLocation }
					</span>
				</div>
				<div>
					<span>상태</span>
					<span>${rm.resState }</span>
				</div>
				<div>
					<span>자원설명</span>
					<p>
						<%
							pageContext.setAttribute("newLine", "\r\n");
						%>
						${fn:replace(rm.resSubdesc, newLine, '<br>')}
					</p>
				</div>
			</div>
		</div>
		<div id="divButton">
			<button  onclick="resEdit(${rm.resNo})">수정</button> 
			<button id="buReset">취소</button>
		</div>
	</c:if>
</div>
