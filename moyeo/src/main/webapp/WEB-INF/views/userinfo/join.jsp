<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<meta charset="utf-8" />
<title>Moyeo 회원가입</title> 
<style type="text/css">
.container {
    position: absolute;

    left: 50%;
    top: 112.8%;
    transform: translate(-50%, -50%);
    width: 670px;
    height: 1750px;
    background: #FFFFFF;
    border: 1px solid #AACDFF;
    box-shadow: 7px 7px 39px rgba(0, 104, 255, 0.25);
    border-radius: 20px;

    margin: 0px;
    padding: 100px;
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    flex-wrap: nowrap;
}

h2 {
    width: 466px;
    height: 104px;
    left: 725px;
    top: 102px;

    font-family: 'Noto Sans CJK KR';
    font-style: normal;
    font-weight: 700;
    font-size: 38px;
    line-height: 47px;

    color: #0068FF;
    justify-content: space-evenly;


}

button {
    width: 467px;
    height: 50px;
    left: 725px;
    top: 875px;
    background-color: #FFFFFF;
    color: royalblue;
    border-radius: 8px;
    border: #0068FF solid 1px;
}

input {
    padding: 0px;
    border: none;
    border-bottom: 1px solid #CFCFCF;
    width: 466px;
    height: 30px;
}

label {
    color: lightgrey;
}

.radio {
    align-items: center;
    font-size: 20pt;
    width: 15px;
    height: 15px;
}

/* div.container {
    justify-content: space-between;
    flex-direction: row;
    align-items: center;
} */ 

input.agree {
    align-items: center;
    font-size: 20pt;
    width: 15px;
    height: 15px;
}

.join_button {
    width: 300px;
    height: 70px;
    background-color: #0068FF;
    color: white;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.2s;
    font-family: 'Noto Sans CJK KR';
    font-style: normal;
    font-weight: 700;
    font-size: 38px;
}

.join_button:hover {
    background-color: #0052CC;
    transform: scale(1.05);
}

.button-container {
    display: flex;
    justify-content: center;
    margin-top: 20px; /* 필요한 여백을 조정해주세요 */
}


.id_input_re_1{
   color : blue;
   display : none;
}
/* 중복아이디 존재하는 경우 */
.id_input_re_2{
   color : red;
   display : none;
}
.id_input_re_1, .id_input_re_2 {
        display: none;
}

/* 이름 2글자 */
.name_input_re{
   color: red;
   display: none;
}
/* 아이디 정규식 */
.id_input_re{
   color: red;
   display: none;
}
/* 비밀번호 정규식 */
.pw_input_re{
   color: red;
   display: none;
}
.pw_input_re2{
   color: blue;
   display: none;
}
/* 이메일 정규식 */
.email_input_re{
   color: red;
   display: none;
}
/* 생년월일 정규식 */
.year_input_re{
   color: red;
   display: none;
}
/* 휴대폰번호 정규식 */
.phone_input_re{
   color: red;
   display: none;
}

/* 유효성 검사 문구 */
.final_id_ck{
    display: none;
    color: red;
}
.final_pw_ck{
    display: none;
    color: red;
}
.final_pwck_ck{
    display: none;
    color: red;
}
.final_name_ck{
    display: none;
    color: red;
}
.final_email_ck{
    display: none;
    color: red;
}
.final_gender_ck{
    display: none;
    color: red;
}    
.final_year_ck{
    display: none;
    color: red;
}
.final_phone_ck{
    display: none;
    color: red;
}
.final_address_ck{
    display: none;
    color: red;
}
/* 비밀번호 확인 일치 유효성검사 */
.pwck_input_re_1{
        color : blue;
        display : none;    
}
.pwck_input_re_2{
        color : red;
        display : none;    
}
</style>
</head>
<body>

	
   <div>
        <div class="container" >
            <h2>회원가입을 위해<br>정보를 입력해주세요.</h2>
            <form id="join_form" name="login" action="/join" method="post" >
            <label for="id">* 아이디<br>
               <input type="text" class="id_input" name="id" id="id" >
               <span class="id_input_re_1">사용 가능한 아이디입니다.</span>
                <span class="id_input_re_2">사용 불가(중복, 조건미달) 아이디입니다.</span>
                <span class="final_id_ck">아이디를 입력해주세요.</span>
                <span class="id_input_re">4~20자의 영문 대소문자 및 숫자만 입력가능합니다.</span>
            </label><br><br>
            <label for="pw">* 비밀번호<br>
                 <input type="password" class="pw_input" name="pw" id="pw" >
               <span class="final_pw_ck">비밀번호를 입력해주세요.</span>
               <span class="pw_input_re">8~16자의 영문 대소문자 숫자 및 특수문자를 최소 하나씩 입력해주세요.</span>
               <span class="pw_input_re2">사용 가능한 비밀번호 입니다.</span>
            </label><br><br>
            <label for="pw2">* 비밀번호 확인<br>
                 <input type="password" class="pwck_input" name="pw2" id="pw2" ><span id="check"></span>
               <span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span> 
               <span class="pwck_input_re_1">비밀번호가 일치합니다.</span> 
               <span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span> 
          </label><br><br>
         <label for="name">* 이름<br>
            <input type="text" class="name_input" name="name" id="name" value="" >
                <span class="name_input_re">2~4 글자의 한글만 가능합니다.</span>
               <span class="final_name_ck">이름을 입력해주세요.</span>
            </label><br><br>
         <label for="year">* 생년월일<br>
                 <input type="text" class="year_input" name="birth" id="birth" placeholder="ex)2000-01-01" ><br>
               <span class="final_year_ck">생년월일을 입력해주세요.</span>
               <span class="year_input_re">생년월일을 맞게 입력해주세요.</span>
            </label><br><br>
            <label for="address">* 주소</label><br>
               <span class="final_address_ck">우편번호 찾기를 선택해주세요.</span>
               <input type="text" class="address_input" id="postcode" placeholder="우편번호" readonly="readonly" >
               <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
               <input type="text" id="roadAddress" placeholder="도로명주소" size="60" readonly="readonly" ><br>
               <input type="hidden" id="jibunAddress" placeholder="지번주소" size="60">
               <span id="guide" style="color:#999;display:none"></span>
               <input type="text" id="detailAddress" placeholder="상세주소" size="60">
               <input type="hidden" id="extraAddress" placeholder="참고항목" size="60">
               <input type="hidden" id="engAddress" placeholder="영문주소" size="60">
               <input type="hidden" id="totaladdress" name="address" value="">
            <br><br>
            
            <label for="gender">성별<br></label>
               <input type="radio" class="radio" name="gender" value="m" id="man">&nbsp; 남성
               <input type="radio" class="radio" name="gender" value="f" id="woman">&nbsp; 여성
               <span class="final_gender_ck">성별을 선택해주세요.</span><br><br>
            <br><br>
            
         <label for="email">* 이메일<br></label>
           <span class="final_email_ck">이메일을 입력해주세요.</span>
           <span class="email_input_re">이메일을 형식에 맞게 입력해주세요</span>
           <input type="text" class="email_input" id="user_email" ><br>
              <input type="hidden" id="totalemail" name="email" value=""> <br>
           <div class="input-group-addon">
              <button type="button" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
             </div><br>
           <div class="mail-check-box">
              <input class="mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
           </div>
             <div>
              <span id="mail-check-warn"></span>
           </div><br><br>
           
           
           <label for="phone">* 휴대전화<br>
                <span class="final_phone_ck">휴대폰번호를 입력해주세요.</span>
              <span class="phone_input_re">번호를 형식에 맞게 입력해주세요.</span>
              <input type="text" class="phone_input" name="phone" id="phone" placeholder="010-****-****" ><br> <br>
            </label><br><br>
            <div class="button-container">
               <input type="button" class="join_button" value="가입하기">
         </div>
            </form>
        </div>
    </div>
    
<script>
   
   /* 주소 합성 */
   function address() {
       const postnum = $("#postcode").val();
       const roadname = $("#roadAddress").val();
       const detailaddress = $("#jibunAddress").val();
   
       if (postnum != "" && roadname != "" && detailaddress != "") {
           const fullAddress = "우편번호 " + postnum + ", 주소 " + roadname + " " + detailaddress;
           $("#totaladdress").val(fullAddress);
       }
   };
   
   /* 유효성 검사 통과유무 변수 */
   var idCheck = false;             // 아이디
   var idckCheck = false;           // 아이디 중복 검사
   var pwCheck = false;             // 비번
   var pwckCheck = false;           // 비번 확인
   var pwckcorCheck = false;        // 비번 확인 일치 확인
   var nameCheck = false;           // 이름
   var emailCheck = false;           // 이메일   
   var mailnumCheck = false;        // 이메일 인증번호 확인
   var genderCheck = false;         //성별
   var yearCheck = false;         //생년월일
   var phoneCheck = false;
   
   $(document).ready(function(){
      $(".join_button").on("click", function(){
         address();
           /* 입력값 변수 */
           var id = $('.id_input').val();                // id 입력란
           var pw = $('.pw_input').val();                // 비밀번호 입력란
           var pwck = $('.pwck_input').val();            // 비밀번호 확인 입력란
           var name = $('.name_input').val();            // 이름 입력란
           var email = $('.email_input').val();           // 이메일 입력란
           var phone = $('.phone_input').val();
           var gender = $('.gender_input').val();
           var year = $('.year_input').val();
           
          /* 아이디 유효성검사 */
          if(id == "" ){
              $('.final_id_ck').css('display','block');
              idCheck = false;
          }else{
              $('.final_id_ck').css('display', 'none');
              idCheck = true;
          }
          
           /* 비밀번호 유효성 검사 */
           if(pw == ""){
               $('.final_pw_ck').css('display','block');
               pwCheck = false;
           }else{
               $('.final_pw_ck').css('display', 'none');
               pwCheck = true;
           }

           /* 비밀번호 확인 유효성 검사 */
           if(pwck == ""){
               $('.final_pwck_ck').css('display','block');
               pwckCheck = false;
           }else{
               $('.final_pwck_ck').css('display', 'none');
               pwckCheck = true;
           }

           /* 이름 유효성 검사 */
           if(name == ""){
               $('.final_name_ck').css('display','block');
               nameCheck = false;
           }else{
               $('.final_name_ck').css('display', 'none');
               nameCheck = true;
           }
           
           /* 이메일 유효성 검사 */
           if(email == ""){
               $('.final_email_ck').css('display','block');
               emailCheck = false;
           }else{
               $('.final_email_ck').css('display', 'none');
               emailCheck = true;
           }
           
           /* 생년월일 유효성검사 */
          if(year == ""){
              $('.final_year_ck').css('display','block');
              yearCheck = false;
          }else{
               $('.final_year_ck').css('display', 'none');
               yearCheck = true;
          }
           
          /* 휴대폰 번호 유효성검사 */
          if(phone == ""){
              $('.final_phone_ck').css('display','block');
              phoneCheck = false;
          }else{
               $('.final_phone_ck').css('display', 'none');
               phoneCheck = true;
          }
          
          /* 성별 유효성검사 */
          if (!$('input[name="gender"]:checked').length) {
                $('.final_gender_ck').css('display', 'block');
                   genderCheck = false;
         } else {
                   $('.final_gender_ck').css('display', 'none');
                   genderCheck = true;
         }
          
            /* 최종 유효성 검사 */
            if(idCheck&&
                  idckCheck&&
                  pwCheck&&
                  pwckCheck&&
                  pwckcorCheck&&
                  nameCheck&&
                  emailCheck&&
                  mailnumCheck&&
                  genderCheck&&
                  yearCheck&&
                  phoneCheck){
                 $("#join_form").attr("action", "/moyeo/user/join");
                 $("#join_form").submit();
              }
              
              return false;
          });
      });
 
             
   /* 아이디 중복검사 */
   
   //아이디 중복검사 길이
   $('.id_input').on("propertychange change keyup paste input", function() {
   var id = $(this).val(); // .id_input에 입력되는 값
   var data = { id: id }; // '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'

   $.ajax({
       type: "post",
       url: "/moyeo/user/memberIdChk",
       data: data,
       success: function(result) {
           var idCheckMessage = $('.id_input_re_1');
           var idLengthCheckMessage = $('.id_input_re_2');

           if (id.length < 4 && id.length > 20) {
               idCheckMessage.css("display", "none");
               idLengthCheckMessage.css("display", "block");
               idCheck = false;
               idckCheck = false;
           } else {
               idLengthCheckMessage.css("display", "none");
               idCheck = true;
               idckCheck = true;
           }    
           
           if (result != 'fail' && id.length >= 4 && id.length <= 20) {
               idCheckMessage.css("display", "block");
               idCheck = true;
               idckCheck = true;
           } else {
               idCheckMessage.css("display", "none");
               idCheck = false;
               idckCheck = false;
               if (id.length >= 4 && id.length <= 20) {
                   idLengthCheckMessage.css("display", "block");
               }
           }
       } // success 종료
   }); // ajax 종료
}); // function 종료



      /* 이름 유효성 */
      $('.name_input').on("input", function() {
          var name = $(this).val(); // .name_input에 입력되는 값
          var nameCheckMessage = $('.name_input_re');
          var regName = /^[가-힣]{2,4}$/;
      
          if (!regName.test(name)) {
              nameCheckMessage.css("display", "block");
              nameCheck = false;
          } else {
              nameCheckMessage.css("display", "none");
              nameCheck = true;
          }
      });
          
      /* 아이디 유효성 */
      $('.id_input').on("input", function() {
          var id = $(this).val(); // .id_input에 입력되는 값
          var idCheckMessage = $('.id_input_re'); // 아이디 유효성 관련 메시지 요소 선택
          var regId = /^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/; // 아이디 유효성을 검사하는 정규식 (첫글자 숫자 x , 4~20자의 영문 대소문자 및 숫자)
          
          if (!regId.test(id)) {
              idCheckMessage.css("display", "block"); // 아이디가 정규식과 맞지 않는 경우 메시지 표시
              idCheck = false; // 아이디 유효성을 나타내는 변수를 false로 설정
          } else {
              idCheckMessage.css("display", "none"); // 아이디가 정규식과 일치하는 경우 메시지 숨김
              idCheck = true; // 아이디 유효성을 나타내는 변수를 true로 설정
          }
      });
      
      /* 비밀번호 유효성 */
    
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
      

      
      /* 생년월일 유효성 */
      $(document).ready(function() {
          $(".year_input").on("input", function() {
              var birthValue = $(this).val();
              var birthCheckMessage = $(".year_input_re");

              // 생년월일을 정규식으로 검사 (예: 2000-01-01)
              var regBirth = /^(19[0-9]{2}|2000|20[0-2][0-9])-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$/;

              if (!regBirth.test(birthValue)) {
                  birthCheckMessage.css("display", "block");
                  yearCheck = false;
              } else {
                  birthCheckMessage.css("display", "none");
                  yearCheck = true;
              }
          });
      });
      
      /* 휴대폰번호 유효성 */
      $(document).ready(function() {
          $('.phone_input').on("input", function() {
              var phoneValue = $(this).val();
              var phoneCheckMessage = $('.phone_input_re');
              
              var regPhone = /^01([0|1|6|7|8|9]?)-(\d{3,4})-(\d{4})$/;
              
              if (!regPhone.test(phoneValue)) {
                  phoneCheckMessage.css("display", "block");
                  phoneCheck = false;
              } else {
                  phoneCheckMessage.css("display", "none");
                  phoneCheck = true;
              }
          });
      });
      
       /* 이메일 */
     
      // user_email blur event
      $("#user_email").blur(email);
     
      /* 인증번호 이메일 전송 */
      $('#mail-Check-Btn').click(function() {
         const email = $('#totalemail').val(); // 이메일 주소값 얻어오기!
         const checkInput = $('.mail-check-input'); // 인증번호 입력하는곳 
   
         $.ajax({
              type: "GET",
              url: "mailCheck?email=" + email,
              success : function (data) {
               console.log("data : " +  data);
               checkInput.attr('disabled',false);
               code =data;
               alert('인증번호가 전송되었습니다.')
            }      
          });
      });

      // 인증번호 비교 
      $('.mail-check-input').blur(function() {
         const inputCode = $(this).val();
         const $resultMsg = $('#mail-check-warn');
   
         if (inputCode == code) {
            $resultMsg.html('인증번호가 일치합니다.');
            $resultMsg.css('color', 'blue');
            $('#mail-Check-Btn').attr('disabled', true);
            $('#totalemail').attr('readonly', true);
            mailnumCheck = true;     // 일치할 경우
         } else {
            $resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
            $resultMsg.css('color', 'red');
            mailnumCheck = false;    // 일치하지 않을 경우
         }
      });

      // 이메일 주소 합성 및 설정 함수
      function email() {
         const userEmail = $("#user_email").val();
         if (userEmail != "" ) {
            const fullEmail = userEmail;
            $("#totalemail").val(fullEmail);
         }
      };
      
      /* 이메일 유효성 */
      
      $(document).ready(function() {
       $('.email_input').on("input", function() {
           var userPart = $(this).val();
           var fullEmail = userPart;
   
           var emailCheckMessage = $('.email_input_re');
           var regMail = /^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$/;
   
           if (!regMail.test(fullEmail)) {
               emailCheckMessage.css("display", "block");
               emailCheck = false;
               $('#mail-Check-Btn').attr('disabled', true);
           } else { 
               emailCheckMessage.css("display", "none");
               emailCheck = true;
               $('#mail-Check-Btn').attr('disabled', false);
           }
       });
   });
      
    /*주소 API*/
      
     //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
   function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;
         
                document.getElementById("engAddress").value = data.addressEnglish;
                       
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 x`주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
      }
    
         /* 비밀번호 확인 일치 유효성 검사 */
         
         $('.pwck_input').on("propertychange change keyup paste input", function(){
          
             var pw = $('.pw_input').val();
             var pwck = $('.pwck_input').val();
             $('.final_pwck_ck').css('display', 'none');
          
             if(pw == pwck){
                 $('.pwck_input_re_1').css('display','block');
                 $('.pwck_input_re_2').css('display','none');
                 pwckcorCheck = true;
             }else{
                 $('.pwck_input_re_1').css('display','none');
                 $('.pwck_input_re_2').css('display','block');
                 pwckcorCheck = false;
             }        
             
         });
      
   </script>

  </body>
</html>

