<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>AI Local Project</h1>
	
	<h3>API 방식 VS 로컬 방식</h3>
	
	<p>
		1) API 방식
		- Google, OpenAI 등 외부 서버에 요청을 보내서 AI 응답을 받아오는 방식 <br>
		- 인터넷 연결 필수, API Key 필요, 요청마다 과금 위험 <br>
		- 모델 성능이 좋음(서버 고성능) <br>
		
		2) 로컬 방식
		- 내 컴퓨터에 직접 LLM 모델을 설치하고 실행하는 방식 <br>
		- 인터넷 불필요 (웹 코드와 연결할 경우는 필요), API 키 불필요, 무료 <br>
		- 내 컴퓨터의 사양에 따라 성능이 달라짐 <br>
		
		<br>
		
		- 로컬 방식을 온프레미스(On-Premise) 환경이라고 부름 <br>
		- > 서버, 네트워크, 소프트웨어 등 IT 전반적인 자원을 외부 클라우드가 아닌
			자체 시설에 직접 설치하고 운영하는 방식 <br>
		- 데이터가 외부로 나가지 않기 때문에 보안이 중요한 기관
		  (금융, 군사, 의료, 공공기관 등)에서 주로 사용 <br>

		<br>

		- 온프레미스의 반대는 클라우드환경 <br>
	</p>

	<br>
	<br>

	<h3>로컬 모델 구축을 위한 기술</h3>

	<p>
		- Ollama <br>

		로컬 환경에서 AI 모델을 실행할 수 있도록 해주는 도구 <br>
		AI 모델을 실행시킬 수 있는 환경(JVM처럼) <br>
		설치가 쉽고, 모델 다운로드 및 실행 또한 간편함
	</p>
</body>
</html>