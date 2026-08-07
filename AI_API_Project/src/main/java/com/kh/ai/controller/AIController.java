package com.kh.ai.controller;

import java.util.ArrayList;

import org.springframework.ai.chat.client.ChatClient;
import org.springframework.ai.chat.messages.AssistantMessage;
import org.springframework.ai.chat.messages.Message;
import org.springframework.ai.chat.messages.UserMessage;
import org.springframework.ai.chat.model.ChatModel;
import org.springframework.ai.chat.prompt.Prompt;
// > Gemini 를 쓰든, GPT 를 쓰든, Claude 를 쓰든 간에 부모 인터페이스로 가져다 쓴다!!
//   AI 연동할 모델 종류가 달라지더라도 코드는 똑같이 재사용 가능!! (다형성 적용)
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class AIController {
	
	// ChatModel 객체 의존성 주입 받기
	// > 별도로 Bean 으로 등록할 필요 없이 바로 가져다 쓸 수 있다!!
	@Autowired
	private ChatModel chatModel;
	// > ChatModel : Spring AI 모듈에서 AI 모델과 직접 통신하는 핵심 객체 (가장 기본적인 객체)
	//				 call() 메소드로 프롬프트 (사용자의 메세지) 를 전달하고 AI 의 응답을 받아옴
	
	// ChatClient 객체 의존성 주입 받기
	// > 내가 직접 Bean 으로 등록한 다음에 가져다 써야 한다!!
	@Autowired
	private ChatClient chatClient;
	// > ChatClient : ChatModel 객체를 감싸서 만든 객체 (ChatModel 에 비해 더 다양한 기능 제공)
	//				  prompt() -> call() -> content() 메소드 체이닝으로 곧바로 응답 텍스트 추출 가능
	//				  (ChatModel 보다 오히려 코드가 더 간결해짐)

	// 채팅 페이지로 이동 1
	@GetMapping("/chat1")
	public String chatPage1() {
		
		return "chatting1";
		// > /WEB-INF/views/chatting1.jsp
	}
	
	// 기본적인 채팅 요청을 받아 처리해주는 컨트롤러
	@ResponseBody
	@PostMapping("/chat1/send")
	public String sendMessage1(String message) {
		
		// 요청 시 전달값으로 사용자의 프롬프트를 받아옴
		// System.out.println(message);
		
		// 이 전달받은 message 를 Gemini 서버로 요청해서 또 보내기 (API 방식)
		// > ChatModel 객체를 이용해서 보내볼 것 (의존성 주입으로 객체 받아오기)
		String reply = chatModel.call(new Prompt(message))
								.getResult()
								.getOutput()
								.getText();
		// > ChatModel 객체를 통해 사용자의 프롬프트를 전달하고 결과를 text 문자열로 받아옴
		
		// System.out.println(reply);
		
		return reply;
	}
	
	// ------------------------------------
	
	@GetMapping("/chat2")
	public String chatPage2() {
		
		return "chatting2";
		// > /WEB-INF/views/chatting2.jsp
	}
	
	// 실제 API 통신을 하는 메소드
	@ResponseBody
	@PostMapping("/chat2/send")
	public String sendMessage2(String message) {
		
		// > 이번에는 사용자가 입력한 message 를 ChatClient 객체를 통해 전달하고 응답 받기
		//   (ChatClient 객체가 필요함, 의존성 주입으로 받아서 쓸 것)
		
		String reply = chatClient.prompt(message)
							     .call()
							     .content();
		// > ChatClient 객체를 통해 사용자의 프롬프트를 전달하고 응답 text 를 받아옴
		//   ChatModel 대비 코드가 훨씬 간결해짐 (좀 더 명시적이기도 함)
		
		return reply;
	}

	private ArrayList<Message> chatHistory = new ArrayList<>();
	// - Message 객체 : LLM과 사람이 나누는 대화 내용을 담는 객체
	// - UserMessage 객체 : 사용자의 텍스트 메시지를 담는 객체
	// - AssistantMessage 객체 : LLM이 응답한 텍스트 메시지를 담는 객체


	@GetMapping("/chat3")
	public String chatPage3() {
		return "chatting3";
		// > /WEB-INF/views/chatting3.jsp 로 포워딩
	}

	@ResponseBody
	@PostMapping("/chat3/send")
	public String sendMessage3(String message) {
		// 전달받은 message를 API로 넘기기 - ChatModel 객체 이용
		// 문맥 유지의 원리 : 이전에 나눴던 텍스트와 응답을
		// ArrayList같은곳에 저장했다가 텍스트 보낼때 같이 보냄

		// 사용자 메세지 대화 기록에 추가
		chatHistory.add(new UserMessage(message));
		// DB 테이블에 추가로 insert

		// 대화기록을 LLM에 전달
		String reply = chatModel.call(new Prompt(chatHistory))
								.getResult()
								.getOutput()
								.getText();
		// DB 테이블에 추가로 insert

		// chatClient 객체로 문맥을 유지하고 싶으면
		// String reply = chatClient.prompt(chatHistory)
		// 					     .call()
		// 					     .content();
								
		// LLM 응답을 대화 기록에 추가
		chatHistory.add(new AssistantMessage(reply));
		// 서버가 꺼졌다 켜지면 데이터가 모두 날라감
		// 대화 맥락을 유지하고 싶으면 실제로는 DB에 따로 저장필요
		// > 대화자 ID, 채팅내역, User/Assistant 여부, 시간
		// ArrayList에 해당 아이디의 회원 대화내역 SELECT해와서 시작
		// > 프라이버시 문제

		return reply;
	}
	
}






