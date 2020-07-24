<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Accordion - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#tabs" ).tabs();
    $( "#accordion_1" ).accordion();
    $( "#accordion_2" ).accordion();
    $( "#accordion_3" ).accordion();
  } );
  </script>
  <style type="text/css">

/* 	.ui-accordion{
  		color:yellow;
  	} */

/*누르면 움직일 때만 적용되는 색*/
/* 	.ui-accordion-header{
  		color:green;
  	} */

/*선택된 메뉴 색*/
/* .ui-accordion-header-active{
  		color:yellow;
  	} */

/*선택 안 된 메뉴 색*/
/*   	.ui-accordion-header-collapsed{
  		color:blue;
  	} */

/*통일된 메뉴 색*/
/* 	.ui-accordion-icons{
  		color:brown;
  	} */

/* 	.ui-accordion-header-icon{ 
  		color:purple;
  	} */

/*내용 글자 색*/
/* .ui-accordion-content{ 
  		color:blue;
  	}
  	 */
/*활성화된 내용 글자 색*/
/*  .ui-accordion-content-active{ 
  		color:purple;
  	}  */
body {
	font-family: Arial, Helvetica, sans-serif;
}

table {
	font-size: 1em;
}

.ui-draggable, .ui-droppable {
	background-position: top;
}

#selectMenu {
	width: 500px;
}
</style>
</head>
<body>
<section>
	<article id="selectMenu">
	
<div class="jojicdo_tab" id="tabs">
  <ul>
    <li><a href="#tabs-1">Nunc tincidunt</a></li>
    <li><a href="#tabs-2">Proin dolor</a></li>
    <li><a href="#tabs-3">Aenean lacinia</a></li>
  </ul>
  <div id="tabs-1">
    <p>
    
    <div id="accordion_1">
  <h3>영업부</h3>
  <div>
    <p>
    	<b>이름 전화번호 이메일 직책</b>
    </p>
   		<a>홍길동 010-2222-3333 ererer@naver.com 팀장  </a>
   		<a>강호동 010-2222-3333 ererer@naver.com 팀장  </a>
  </div>
  <h3>인사부</h3>
  <div>
    <p>
   		<b>이름 전화번호 이메일 직책</b>
   		<a>김연아 010-9999-3222 wwww@gmail.com 대리  </a>
    </p>
  </div>
  <h3>마케팅부</h3>
  <div>
    <p>
  
    </p>
    <ul>
      <li>List item one</li>
      <li>List item two</li>
      <li>List item three</li>
    </ul>
  </div>

  </div>
</div>
    
    
  </div>
  <div class="jojicdo_tab" id="tabs-2">
    <p>
    
    <div id="accordion_2">
  <h3>영업부</h3>
  <div>
    <p>
    	
    </p>
  </div>
  <h3>Section 2</h3>
  <div>
    <p>
    Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet
    purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor
    velit, faucibus interdum tellus libero ac justo. Vivamus non quam. In
    suscipit faucibus urna.
    </p>
  </div>
  <h3>Section 3</h3>
  <div>
    <p>
    Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis.
    Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero
    ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis
    lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.
    </p>
    <ul>
      <li>List item one</li>
      <li>List item two</li>
      <li>List item three</li>
    </ul>
  </div>
  <h3>Section 4</h3>
  <div>
    <p>
    Cras dictum. Pellentesque habitant morbi tristique senectus et netus
    et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in
    faucibus orci luctus et ultrices posuere cubilia Curae; Aenean lacinia
    mauris vel est.
    </p>
    <p>
    Suspendisse eu nisl. Nullam ut libero. Integer dignissim consequat lectus.
    Class aptent taciti sociosqu ad litora torquent per conubia nostra, per
    inceptos himenaeos.
    </p>
  </div>
</div>
    
    
  </div>
  <div class="jojicdo_tab" id="tabs-3">
    <p>


<div  id="accordion_3">
  <h3>영업부</h3>
  <div>
    <p>
    	
    </p>
  </div>
  <h3>Section 2</h3>
  <div>
    <p>
    Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet
    purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor
    velit, faucibus interdum tellus libero ac justo. Vivamus non quam. In
    suscipit faucibus urna.
    </p>
  </div>
  <h3>Section 3</h3>
  <div>
    <p>
    Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis.
    Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero
    ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis
    lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.
    </p>
    <ul>
      <li>List item one</li>
      <li>List item two</li>
      <li>List item three</li>
    </ul>
  </div>
  <h3>Section 4</h3>
  <div>
    <p>
    Cras dictum. Pellentesque habitant morbi tristique senectus et netus
    et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in
    faucibus orci luctus et ultrices posuere cubilia Curae; Aenean lacinia
    mauris vel est.
    </p>
    <p>
    Suspendisse eu nisl. Nullam ut libero. Integer dignissim consequat lectus.
    Class aptent taciti sociosqu ad litora torquent per conubia nostra, per
    inceptos himenaeos.
    </p>
  </div>
</div>
    
    

  </div>
</div>


	</article>
</section>

</body>
</html>