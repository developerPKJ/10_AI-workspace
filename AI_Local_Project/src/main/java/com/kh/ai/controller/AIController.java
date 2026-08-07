package com.kh.ai.controller;

import org.springframework.ai.chat.client.ChatClient;
import org.springframework.ai.chat.model.ChatModel;
import org.springframework.ai.chat.prompt.Prompt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AIController {

	@Autowired
	private ChatModel chatModel;
	
	@Autowired
	private ChatClient chatClient;

	@GetMapping("/chat1")
	public String chatPage1() {
		
		return "chatting1";
	}
	
	@ResponseBody
	@PostMapping("/chat1/send")
	public String sendMessage1(String message) {
		
		// ChatModel 객체 이용
		String reply = chatModel.call(new Prompt(message))
								.getResult()
								.getOutput()
								.getText();
		
		return reply;
	}
	
	// --------------------------------------------
	
	@GetMapping("/chat2")
	public String chatPage2() {
		
		return "chatting2";
		
	}
	
	@ResponseBody
	@PostMapping("/chat2/send")
	public String sendMessage2(String message) {
		
		// > ChatClient 객체 이용
		String reply = chatClient.prompt(message)
								 .call()
								 .content();
		
		return reply;
		
	}
	
	
}








