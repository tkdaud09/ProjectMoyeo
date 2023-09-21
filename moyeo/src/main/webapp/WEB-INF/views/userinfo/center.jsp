<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  
<head>

   <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login.css" >

<style>
.modal {
   display: none;
   position: fixed;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
   background-color: rgba(0, 0, 0, 0.7);
   z-index: 9999;
}

.modal-content {
   background-color: #fff;
   margin: 15% auto;
   padding: 20px;
   width: 60%;
}
</style>

<script>
   // JavaScript 함수를 사용해서 클릭 이벤트 처리
   function toggleAnswer(id) {
      var answerElement = document.getElementById(id);
      if (answerElement.style.display === 'none'
            || answerElement.style.display === '') {
         answerElement.style.display = 'block';
      } else {
         answerElement.style.display = 'none';
      }
   }
   
   function openModal() {
        document.getElementById('surveyModal').style.display = 'block';
    }
    function closeModal() {
        document.getElementById('surveyModal').style.display = 'none';
    }
    function displayInProgress() {
        alert('아직 준비중입니다');
        return false;  // 폼 제출을 중단
    }
</script>
</head>




<body>
<section class="">
    <div class="container">
        <div class="py-10">
        
       <div class="center_con">
   <h1 class="center_t1">고객센터에 모여!</h1>
   <h2 class="center_t2">여러분의 여행, 여러분의 행복을 위한 모여 고객센터입니다.</h2>




<div class="c_con1">

   <div class="c_con1_left">
      <h3 class="c_con1_tit">문의하기</h3>
      <ul>
         <li><strong>전화</strong>: &nbsp;&nbsp;123-456-7890 (운영시간: 월~금, 09:00 ~ 18:00)</li>
         <li><strong>이메일</strong>: &nbsp;&nbsp;support@moyeo-travel.com</li>
         <li><strong>FAQ</strong>: &nbsp;&nbsp;자주 묻는 질문은 <a href="#">여기</a>에서 확인하세요.</li>
      </ul>
   </div>
   
   <div class="c_con1_right">
      <h3 class="c_con1_tit">서비스 이용 가이드</h3>
      <ul>
         <li><strong>예약하기</strong> : &nbsp;&nbsp;원하는 패키지를 선택한 후, 장바구니 이동 후 결제 하세요!</li>
         <li><strong>결제</strong> : &nbsp;&nbsp;다양한 결제 옵션 중에서 선택하여 결제를 완료하세요!</li>
         <li><strong>여행 준비</strong> : &nbsp;&nbsp;여행일정, 준비물 체크리스트 등을 이메일로 보내드립니다!</li>
         <li><strong>여행 즐기기</strong> : &nbsp;&nbsp;지정된 날짜에, 여행을 즐기세요!</li>
         <li><strong>후기 작성</strong> : &nbsp;&nbsp;여행이 끝난 후, 여러분의 소중한 후기를 남겨주세요!</li>
      </ul>
   </div>
   
</div>  
   
   	<div class="c_con2">
      <h3 class="c_con1_tit sp"><a href="${pageContext.request.contextPath}/qa/list">1:1문의 게시판 바로가기</a></h3>
    </div>
   
   <div class="c_con2">
      <h3 class="c_con1_tit sp">자주 묻는 질문 (FAQ)</h3>
      <ul>
           <li class="faq-question" onclick="toggleAnswer('answer1')"><a href="javascript:void(0)">✔️ 환불 규정은 어떻게 되나요?</a></li>
           <div id="answer1" class="faq-answer">환불 규정에 대한 설명이 들어갑니다.</div>
           
           <li class="faq-question" onclick="toggleAnswer('answer2')"><a href="javascript:void(0)">✔️ 예약 변경은 가능한가요?</a></li>
           <div id="answer2" class="faq-answer">예약 변경에 대한 설명이 들어갑니다.</div>
           
           <li class="faq-question" onclick="toggleAnswer('answer3')"><a href="javascript:void(0)">✔️ DIY 투표 변경일은 언제인가요?</a></li>
           <div id="answer3" class="faq-answer">DIY에 대한 설명이 들어갑니다.</div>
           
           <li class="faq-question" onclick="toggleAnswer('answer4')"><a href="javascript:void(0)">✔️ 새롭게 패키지가 변하는 날짜는 언제인가요?</a></li>
           <div id="answer4" class="faq-answer">패키지에 대한 설명이 들어갑니다.</div>
       </ul>
    </div>
    
    
    
<div class="c_con3">
   <h3 class="c_con1_tit">여러분의 의견을 들려주세요!</h3>
    <p>
        서비스 개선을 위해 여러분의 의견이 필요합니다. <a href="javascript:void(0)" onclick="openModal()">여기</a>를 클릭하여 설문조사에 참여해 주세요.
    </p>
    
		    <!-- 설문조사 모달 -->
		    <div id="surveyModal" class="modal">
		        <div class="modal-content">
		            <h4>설문조사</h4>
		            <form action="#" method="post" onsubmit="return displayInProgress();">
		                <label for="title">제목:</label>
		                <input type="text" id="title" name="title"><br>
		                <label for="content">내용:</label><br>
		                <textarea id="content" name="content"></textarea><br>		
		                <input type="submit" value="보내기">
		            </form>
		            <button onclick="closeModal()">닫기</button>
		        </div>
		    </div>
		</div>
	</div>
</div>
</div>
</section>
</body>
</html>