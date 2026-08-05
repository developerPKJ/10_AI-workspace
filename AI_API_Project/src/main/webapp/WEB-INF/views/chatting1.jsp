<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>

	<h1>Spring AI 의 가장 기본적인 객체를 이용해서 채팅해보기 (ChatModel 객체)</h1>

	<div id="chatMessages"></div>
	
	<br>
	
	<textarea id="messageInput" 
			  rows="3" cols="60" placeholder="메세지를 입력하세요.."
			  style="resize : none;"></textarea>

	<br>
	<button type="button" id="btn">전송</button>
	
	<script>
		$(() => {
			
			$("#btn").click(() => {
				
				// 옵션) 메세지가 비어있는지 확인
				let message = $("#messageInput").val();
			
				if(message.trim().length == 0) {
					// > 메세지가 비어있을 경우 - 요청 X (API 키 사용 절약)
					
					return; // 클릭이벤트 핸들러 함수가 그대로 끝
					
				} else {
					// > 메세지가 비어있지 않은 경우 - 요청 O (ajax)
					
					// 내가 작성한 메세지를 (message 변수) 출력창 (div) 에 내보내고 입력 초기화
					$("#chatMessages").append("<p>나 : " + message + "</p>");
					$("#messageInput").val("");
					
					// ajax 를 통해 화면 깜빡임 없이 Controller 로 요청 (post 방식)
					$.ajax({
						url : "/ai/chat1/send",
						type : "post",
						data : { message : message },
						success : function(result) {
							
							$("#chatMessages").append("<p>AI : " + result.replaceAll("\n", "<br>") + "</p>");
							
						},
						error : function() {
							
							console.log("AI 요청용 ajax 통신 실패!");
						}
					});
					
				}
			});
			
		});
	</script>
	
</body>
</html>






