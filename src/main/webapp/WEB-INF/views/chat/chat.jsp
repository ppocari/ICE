<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>채팅</title>
</head>
<body>	
	닉네임 : <input type="text" id="nick"/>
	<input type="button" id="connect" value="접속"/>
	<input type="button" id="close" value="해제"/>

	<h2>메시지 출력 영역</h2>
	<div id="chatArea">
	<div id="chatMessageArea"></div>
	</div>
	<br/><br/>

	<input type="text" id="msg"/>
	<input type="button" value="전송" id="send"/>
</body>

<script src="js/jquery.min.js"></script>
<script>
	var wsocket;

	//jquery의 시작 이벤트
	$(function(){
		$("#send").on("click", function(){
			send();
		});
		$("#connect").on("click", function(){
			connect();
		});
		$("#close").on("click", function(){
			close();
		});
	});

	function connect(){
		//웹 소켓 연결
		wsocket = new WebSocket("<c:url value='/echo'/>");

		//웹 소켓 이벤트 연결
		wsocket.onopen = onOpen;
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;

	}

	function close(){
		//연결해제
		wsocket.close();
	}

	//웹 소켓에 메시지를 전송하는 메소드
	function send(){
		//서버에 메시지 전송
		var nick = $("#nick").val();
		var msg = $("#msg").val();
		wsocket.send(nick + ":" + msg);

		//메시지 영역 클리어
		$('#msg').val("");
	}

	function onOpen(evt){
		appendMessage("연결되었습니다.");

	}

	function onClose(evt){
		appendMessage("연결이 해제되었습니다.");

	}

	function onMessage(evt){
		appendMessage(evt.data);

	}

	function appendMessage(msg){
		//msg를 추가
		$("#chatMessageArea").append(msg + "<br/>");

	}

</script>
</html>

<%@ include file="../inc/bottom.jsp"%>