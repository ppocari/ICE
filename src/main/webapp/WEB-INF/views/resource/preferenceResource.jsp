<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="<c:url value = "/resources/vendor/jquery/jquery.min.js"/>"></script>
<script type="text/javascript">
	$(function(){
		function addKind() {
			var addKind=$('#rkKind').val();
			location.href="<c:url value='/resource/preferenceResource.do?rkNo="+rkNo+"&rkKind="+rkKind+"&mode='/>";
					/* "<c:url value='/resource/handleReserve.do?rvNo="+rvNo+"&mode="+mode+"&message="+message+"'/>"; */
		}
		
		function editKind(rkNo, rkKind){
			var editId=$('button[name=btEdit'+rkNo+']').attr('id');
			alert("rkNo="+rkNo+", rkKind="+rkKind);
			alert(editId);
			if(editId=='isEdit') {
				alert('isEdit 수행함!');
				$('button[name=btEdit'+rkNo+']').attr('id', 'yesEdit');
				$('#td'+rkNo+'').html('');
				$('#td'+rkNo+'').html('<input type="text" style="width:100px" placeholder="'+rkKind+'">');
				
				$('#del'+rkNo+'').html('취소');
			}else if(editId=='yesEdit') {
				alert("yesEdit 수행함");
				location.href="<c:url value='/resource/preferenceResource.do?rkNo="+rkNo+"&rkKind="+rkKind+"&mode=edit'/>";
				$('button[name=btEdit]').attr('id', 'isEdit');
			}
		}
		
		function delKind(rkNo, rkKind) {
			var canDel= $('#canDel').val();
			if(canDel == '취소') {
				$('#td'+rkNo+'').html('');
				$('#td'+rkNo+'').html('<button name="btEdit" id="isEdit" onclick="editKind('+rkNo+', '+rkKind+')">수정');
				
				$('#del'+rkNo+'').html('삭제');
			}else if(canDel == '삭제') {
				location.href="<c:url value='/resource/preferenceResource.do?rkNo="+rkNo+"&mode=del'/>";
			}
		}
	});
	
	
</script>
</head>
<body>
	<section>
		<article>
			<table>
				<tr>
					<th>자원종류</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
				<c:forEach var="rk" items="${rkList }">
				<tr>
					<td id="td${rk.rkNo }">${rk.rkKind }</td>
					<td><button name="btEdit${rk.rkNo }" id="isEdit" onclick="editKind(${rk.rkNo}, ${rk.rkKind })" >수정</button></td>	
					<td><button id="del${rk.rkNo }" onclick="delKind(${rk.rkNo}, ${rk.rkKind })">삭제</button></td>	
				</tr>
				</c:forEach>
			</table>
			<input id="rkKind" style="width:100px" type="text" name="rkKind">
			<button onclick="addKind()">추가</button>
		</article>
	</section>
</body>
</html>