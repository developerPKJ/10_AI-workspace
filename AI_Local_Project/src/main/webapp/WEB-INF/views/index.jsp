<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>Spring AI + 로컬 모델</h1>

	<!-- 즉, 내 컴퓨터에 직접 LLM 모델을 설치해보겠다. -->

	<h3>* API 방식 VS 로컬 방식</h3>

	<p>
		1) API 방식 (AI_API_Project 에서 했던 것) <br>
		
		- Google, OpenAI 사 등 외부 서버에 요청을 보내서 AI 응답을 받아오는 방식 <br>
		- 인터넷 연결 필수, API Key 필요, 요청마다 과금 위험 <br>
		- 모델 성능이 좋음 (서버가 고성능) <br>	
		
		2) 로컬 방식 (AI_Local_Project 에서 진행) <br>
		
		- 내 컴퓨터에 직접 LLM 모델을 설치하고 실행하는 방식 <br>
		- 인터넷 불필요 (웹 코드와 연결할 경우에는 필요), API Key 불필요, 무료 <br>
		- 내 컴퓨터의 사양에 따라 성능/속도가 달라짐 <br>
		
		<br>
		
		- 로컬 방식을 온프레미스 (On-Premise) 환경이라고 부른다. <br>
		
		온프레미스 : 서버, 네트워크, 소프트웨어 등 IT 전반적인 자원을 외부 클라우드가 아닌 자체 시설 (사내 서버실 등) 에
				   직접 설치하고 운영하는 방식 <br>
		데이터나 정보 등이 외부로 나가지 않기 때문에 주로 "보안이 중요한 기관들 (금융, 군사, 의료, 공공기관 등)" 에서 주로 사용한다. <br>
		
		<br>
		
		- 온프레미스의 반대되는 개념은 클라우드 (Cloud) 환경이다. <br>
		
		클라우드 : AWS, Google Cloud 등 외부 서버를 빌려 쓰는 방식
		(즉, AI_API_Project 에서 썼던 API 방식이 결국은 클라우드 방식에 해당됨) 
	</p>
	
	<br>
	<hr>
	
	<h3>* 로컬 모델 구축을 위한 기술</h3>

	<p>
		- Ollama <br>
		
		로컬 환경에서 AI 모델을 쉽게 실행할 수 있도록 해주는 도구 <br>
		즉, AI 모델을 실행시켜줄 수 있는 환경 (Java 로 따지면 JVM 같은 느낌) <br>
		설치도 쉽고, 설치 후 터미널에서 명령어 한 줄로 모델 다운로드 및 실행 가능 <br>
		기본적으로 http://localhost:11434 에서 모델 서버가 실행됨 <br>
		
		<br>
		
		- Ollama 설치 방법 <br>
		<a href="https://ollama.com">올라마 설치 링크</a> 에서 다운로드 후 설치 <br>
		
		<br>
		
		- Ollama 에서 사용할 수 있는 로컬 LLM 종류 (대표적인 오픈소스들) <br>
		
		llama3.2 (Meta) : 가볍고 빠름, 일반적인 대화에 적합 (무난) <br>
		gemma3 (Google) : Google 이 공개한 오픈소스 모델 (Gemini 의 본체 느낌) <br>
		qwen2.5 (Alibaba) : 중국 알리바바에서 만든 모델, 한국어 성능 괜찮음 <br>
		mistral (Mistral) : 유럽에서 만든 모델, 가볍고 성능 좋은 편 <br>
		
		<br>
		
		EXAONE (LG), kanana (Kakao) 등 국내 모델들도 다양함 (한국어 성능이 제일 좋음) <br>
		
		<br>
		
		모델마다 크기 (파라미터 수) 가 다 다르고, 크기가 클수록 성능은 좋지만 느림 <br>
		
		<!-- https://ollama.com/search 에서 사용 가능한 모델들 확인 가능 -->
		
		<br>
		
		- Ollama 주요 명령어 (터미널에서 실행) <br>
		
		ollama pull 모델명 : 모델 다운로드 <br>
		ollama run 모델명 : 모델 실행 (터미널에서 직접 대화 가능) <br>
		ollama list	: 다운로드된 모델들의 목록 확인 <br>
		ollama rm 모델명 : 모델 삭제 <br>
		ollama serve : Ollama 서버 구동 (보통 설치 후 바로 실행됨) <br>
		quit ollama : Ollama 서버 종료
	</p>
	
	<br>
	<hr>
	
	<h3>
		<a href="/ai/chat1">로컬 LLM 과 채팅해보기 1</a>
	</h3>

	<h3>
		<a href="/ai/chat2">로컬 LLM 과 채팅해보기 2</a>
	</h3>

</body>
</html>








