<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/address.css" />

<script type="text/javascript">

</script>
<style type="text/css">



</style>


<nav>
	<div id="addressNavAll">
		<div id="addressNav1">
			<div id="menu_address">연락처 추가</div>
			<div><a href="<c:url value='//'/>">>조직도에서 추가</a></div>
			<div><a href="">>직접추가</a></div>
		</div>
		<div id="addressNav2">
			<!-- 주소록은 10개까지만 생성 가능! -->
			<div id="addressNav2_title">
				<a>내 주소록</a><a id="address_option">설정</a>
			</div>
			<!-- 특정 주소록X, 그냥 주소록 영역임
					누르면 주소록명 목록이 아래에 쫙 펼쳐짐 
					toggle로 javascript에서 기능 구현 -->
			<div>
				<a><span>★</span>즐겨찾기</a>
			</div>
			<div>
				<a>전체 연락처</a>
			</div>
			<div>
				<a> > 기본</a>
			</div>
			<div>
				<a> > 주소록2</a>
			</div>
			<div>
				<a> > 주소록3</a>
			</div>
			<!-- 주소록명 수정 페이지에서 
				첫번째 순서인 주소록을 addressMain페이지에 보여줌.  -->
			<!-- order 순서에 따름 -->
		</div>
		<div id="addressNav3">
			<div>
				<a>연락처 불러오기</a>
			</div>
			<div>
				<a>연락처 저장/내보내기</a>
			</div>
			<div>
				<a>중복 연락처 정리하기</a>
			</div>
			<div>
				<a>휴지통</a>
			</div>
		</div>
	</div>
</nav>
