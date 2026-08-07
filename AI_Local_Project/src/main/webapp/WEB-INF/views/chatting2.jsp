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

	<h1>로컬 모델과 ChatClient 객체를 통해 채팅하기</h1>

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
					
					return;
				
				} else {
				
					$("#chatMessages").append("<p>나 : " + message + "</p>");
					$("#messageInput").val("");
					
					$.ajax({
						url : "/ai/chat2/send",
						type : "post",
						data : { message : message },
						success : function(result) {
							
							$("#chatMessages").append("<p>AI : " + result.replaceAll("\n", "<br>") + "</p>");
							
						},
						error : function() {
							
							console.log("AI 채팅 요청용 ajax 통신 실패!");
						}
					});
					
				}
			});
			
		});
	</script>

</body>
</html>



