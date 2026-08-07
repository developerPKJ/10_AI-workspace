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

	<h1>문맥을 유지하면서 채팅해보기 (대화 기록 유지)</h1>

	<!-- 
		- 그동안 우리가 만든 대화 채팅은 "1회성 1턴" 임!!
		- 다음 턴에서 텍스트를 던지면 LLM 은 이전 턴에서 대화했던 내용이 리셋되서
		  문맥 파악을 하지 못한다.
	-->
	
	<div id="chatMessages"></div>
	
	<br>
	
	<textarea id="messageInput" 
			  rows="3" cols="60" placeholder="메세지를 입력하세요.."
			  style="resize : none;"></textarea>

	<br>
	<button type="button" id="btn">전송</button>
	
	<script>
		$(function() {
			
			$("#btn").click(function() {
				
				let message = $("#messageInput").val();
				
				if(message.trim().length == 0) {
					// > 비어있는 메세지일 경우
					
					return;
				
				} else {
					// > 비어있지 않은 메세지일 경우
					
					// 출력창에 내보내고 입력 초기화 후 요청
					$("#chatMessages").append("<p>나 : " + message + "</p>");
					$("#messageInput").val("");
					
					$.ajax({
						url : "/ai/chat3/send",
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




