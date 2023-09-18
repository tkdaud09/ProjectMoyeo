<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login.css" >

<style>

input[type="password"] {
   width: 100%;
   padding: 8px;
   border: 1px solid #ccc;
   border-radius: 4px;
}


</style>

<script>
/*유효성 검사 통과 유무 변수*/
//var pwCurrent = false;           //현재 비번 일치 확인


$(document).ready(function(){
   //이전버튼 눌렀을 경우
   /*
    $("#mypage").click(function(){
        //alert("이전 버튼 작동");
        $("#modifypw_form").submit();
    });
   */
   //이전버튼 눌렀을 경우
    $("#mypage").click(function(){
        history.back(); // 이전 페이지로 이동
    });
    
   //변경버튼 눌렀을 경우
    $("#update").click(function(){
       
       $('.error').css('display','none');
        //alert("변경 버튼 작동");
      var check = true;             // 비번
        
        /* 입력값 변수 */
        var currentPw = $('#currentPw').val(); //현재 비밀번호 입력란
        var pw = $('.pw_input').val(); // 비밀번호 입력란
        var pwck = $('.pwck_input').val();// 비밀번호 확인 입력란

        //alert("현재 비밀번호 = "+ originalPw);
        
        if(currentPw == ""){
           $('.final_current_ck').css('display','block');
           check = false; 
        }
        
        if(pw == ""){
           $('.final_pw_ck').css('display', 'block');
           check = false; 
        }
        
        if(pwck == ""){
           $('.final_pwck_ck').css('display', 'block');
           check = false; 
        } else if(pw != pwck) {
           $('.pwck_input_re_2').css('display', 'block');
           check = false; 
        }
    
        
        
        /* 최종 유효성 검사 */
        if(!check){
           return;
        }
           $("#modifypw_form").attr("action", "${pageContext.request.contextPath}/user/modifypw");
           $("#modifypw_form").submit();
    });
});

 //비밀번호 유효성 
$('.pw_input').on("input", function() {
    var password = $(this).val(); // .pw_input에 입력되는 값
    var pwfailMessage = $('.pw_input_re'); // 비밀번호 유효성 관련 메시지 요소 선택
    var pwpassMessage = $('.pw_input_re2');
    var regPw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/; // 비밀번호 유효성을 검사하는 정규식
    
    if (!regPw.test(password)) {
       pwfailMessage.css("display", "block"); // 비밀번호가 정규식과 맞지 않는 경우 메시지 표시
        pwCheck = false; // 비밀번호 유효성을 나타내는 변수를 false로 설정
    } else {
       pwfailMessage.css("display", "none"); // 비밀번호가 정규식과 일치하는 경우 메시지 숨김
       pwpassMessage.css("display", "block")
        pwCheck = true; // 비밀번호 유효성을 나타내는 변수를 true로 설정
        
    }
});


</script>

</head>
<body>
  <section class="">
	  <div class="container">
		<div class="py-10">
		<div class="join_form_section">
      
      
      
      <h2 class="title_f">비밀번호 변경</h2>
      <form id="modifypw_form" action="modifypw" method="post">
         <input type="hidden" class="id_input" name="id" value="${userinfo.id }">
         <div class="form-group">
            <label for="currentPw">현재 비밀번호</label> <input type="password"
               class="currentPw" id="currentPw" name="pw">
            <span class="final_current_ck error">비밀번호를 입력해주세요.</span>
         </div>
         
         <c:if test = "${result == 0 }">
               <div class = "login_warn">사용자 비밀번호를 잘못 입력하셨습니다.</div>
         </c:if>
         
         <div class="form-group">
            <label for="pw">새 비밀번호</label> <input type="password"
               class="pw_input" id="pw" name="updatePw"> <span
               class="final_pw_ck error">비밀번호를 입력해주세요.</span> <span class="pw_input_re error">8~16자의
               영문 대소문자 숫자 및 특수문자를 최소 하나씩 입력해주세요.</span> <span class="pw_input_re2 error">사용
               가능한 비밀번호 입니다.</span>
         </div>
         <div class="form-group">
            <label for="pw2">비밀번호 재확인</label> <input type="password"
               class="pwck_input" id="pw2" name="updatePw2"> <span
               class="final_pwck_ck error">비밀번호 재확인을 입력해주세요.</span> <span
               class="pwck_input_re_1 error">비밀번호가 일치합니다.</span> <span
               class="pwck_input_re_2 error">비밀번호가 일치하지 않습니다.</span>
         </div>
         <div class="form-group fg_btn">
           <button type="button" class="btn btn1" id="update">변경</button>
           <button type="button" class="btn btn2" id="mypage">이전</button>
        </div>
      </form>
      
   </div>
   </div>
   </div>
   </section>
   
   
   
   
</body>
</html>