<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<meta charset="utf-8" />
<title>마이페이지</title>
<style type="text/css">
.container {
   position: absolute;
   left: 50%;
   top: 106.4%;
   transform: translate(-50%, -50%);
   width: 670px;
   height: 1650px;
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
   width: 400px;
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

/* 이메일 정규식 */
.email_input_re {
   color: red;
   display: none;
}

/* 휴대폰번호 정규식 */
.phone_input_re {
   color: red;
   display: none;
}

/* 유효성 검사 문구 */
.final_email_ck {
   display: none;
   color: red;
}

.final_phone_ck {
   display: none;
   color: red;
}
</style>
</head>
<body>

   <div>
      <div class="container">
         <h2>마이페이지</h2>
         <form id="mypage_form" name="login" action="modify" method="post">
            <input type="hidden"  value="${userinfo.id}">
            <input type="hidden"  value="${userinfo.name}"> <label
               for="id">* 아이디<br> <input type="text" class="id_input"
                value="${userinfo.id }" readonly> <br>
            </label><br> <br> <label for="name">* 이름<br> <input
               type="text" class="name_input" class="name_input" 
               value="${userinfo.name }" readonly><br>
            </label><br> <br> <label for="year">* 생년월일<br> <input
               type="text" class="year_input" name="birth"
               value="${userinfo.birth }" readonly><br>
            </label><br> <br> <label for="address">* 주소</label><br> <input
               type="text" id="address_input"
               value="${userinfo.address}" readonly> <br> <input
               type="text" id="postcode" placeholder="우편번호" readonly="readonly">
            <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
            <input type="text" id="roadAddress" placeholder="도로명주소" size="60"
               readonly="readonly"><br> <input type="hidden" id="jibunAddress"
               placeholder="지번주소" size="60"> <span id="guide"
               style="color: #999; display: none"></span> <input type="text"
               id="detailAddress" placeholder="상세주소" size="60"> <input
               type="hidden" id="extraAddress" placeholder="참고항목" size="60"> <input
               type="hidden" id="engAddress" placeholder="영문주소" size="60"> <input
               type="hidden" id="totaladdress" name="address" value=""> <br> <br> <label for="gender">성별<br></label> <input type="radio" class="radio" name="gender" value="m" id="man">&nbsp;
            남성 <input type="radio" class="radio" name="gender"
               value="f" id="woman">&nbsp; 여성 <br> <br> <br> <br> <label
               for="email">* 이메일<br>
            </label> <span class="final_email_ck">이메일을 입력해주세요.</span> <span
               class="email_input_re">이메일을 형식에 맞게 입력해주세요</span> <input
               type="text" class="email_input" id="user_email" 
               value="${userinfo.email }"><br> <input type="hidden"
               id="totalemail" name="email" > <br>
            <div class="input-group-addon">
               <button type="button" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
            </div>
            <br>
            <div class="mail-check-box">
                  <input class="mail-check-input" placeholder="인증번호 6자리를 입력해주세요!"
                     disabled="disabled" maxlength="6">
               </div>
               <div>
                  <span id="mail-check-warn"></span>
               </div> <br> <br> <br> <br> <br> <label
               for="phone">* 휴대전화<br> <input type="text"
                  class="phone_input" name="phone" id="phone"
                  value="${userinfo.phone }"><br> <span
                  class="final_phone_ck">휴대폰번호를 입력해주세요.</span> <span
                  class="phone_input_re">번호를 형식에 맞게 입력해주세요.</span>
            </label> <br> <input type="button" class="join_button" value="수정완료">
         </form>
      </div>
   </div>

   <script>
   
   /* 성별 radio 커튼 활성화 비활성화 */
   var userGender = "${userinfo.gender}";
   
   var manRadio = document.getElementById("man");
   var womanRadio = document.getElementById("woman");
   
   if (userGender === "m") {
       manRadio.checked = true;
       womanRadio.disabled = true; // 여성 라디오 버튼 비활성화
   } else if (userGender === "f") {
       womanRadio.checked = true;
       manRadio.disabled = true; // 남성 라디오 버튼 비활성화
   }
   
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
      var emailCheck = false;           // 이메일   
      var mailnumCheck = false;        // 이메일 인증번호 확인
      var phoneCheck = false;
      
      $(document).ready(function(){
         $(".join_button").on("click", function(){
            address();
            
            var originalEmail = "${userinfo.email}"; // 이전 이메일 주소
            var newEmail = $('#totalemail').val(); // 수정된 이메일 주소
          
            /* 입력값 변수 */
            var email = $('.email_input').val(); // 이메일 입력란
            var phone = $('.phone_input').val();
            
            /*
            if (newEmail !== originalEmail && !emailCheck) {
                alert("이메일 주소가 유효하지 않습니다. 확인 후 다시 시도해주세요.");
                return false;
            }
             */
          
              /* 이메일 유효성 검사 */
              if(email == "" || email !== originalEmail){
                  $('.final_email_ck').css('display','block');
                  emailCheck = false;
                  mailnumCheck = false;
              }else{
                  $('.final_email_ck').css('display', 'none');
                  emailCheck = true;
                  mailnumCheck = true;
              }
          
             /* 휴대폰 번호 유효성검사 */
             if(phone == ""){
                 $('.final_phone_ck').css('display','block');
                 phoneCheck = false;
             }else{
                  $('.final_phone_ck').css('display', 'none');
                  phoneCheck = true;
             }
       
             alert("emailCheck = " + emailCheck);
             alert("mailnumCheck = " + mailnumCheck);
             alert("phoneCheck = " + phoneCheck);
             
               /* 최종 유효성 검사 */
              if (emailCheck && mailnumCheck && phoneCheck) {
                    $("#mypage_form").attr("action", "/testmoyeo/user/modify");
                    $("#mypage_form").submit();
                 }
                 
                 return false;
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
            type : "GET",
            url : "mailCheck?email=" + email,
            success : function(data) {
               console.log("data : " + data);
               checkInput.attr('disabled', false);
               code = data;
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
            mailnumCheck = true; // 일치할 경우

      } else {
            $resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
            $resultMsg.css('color', 'red');
            mailnumCheck = false; // 일치하지 않을 경우
         }

      });
      // 이메일 주소 합성 및 설정 함수
      function email() {
         const userEmail = $("#user_email").val();
         if (userEmail != "") {
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
               $('#mail-Check-Btn').attr('disabled', true); // 이 부분을 추가하여 버튼을 비활성화합니다.
            } else {
               emailCheckMessage.css("display", "none");
               emailCheck = true;
               $('#mail-Check-Btn').attr('disabled', false); // 이 부분을 추가하여 버튼을 활성화합니다.
            }
         });
      });

      /*주소 API*/

      //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
      function execDaumPostcode() {
         new daum.Postcode(
               {
                  oncomplete : function(data) {
                     // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                     // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                     // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                     var roadAddr = data.roadAddress; // 도로명 주소 변수
                     var extraRoadAddr = ''; // 참고 항목 변수

                     // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                     // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                     if (data.bname !== ''
                           && /[동|로|가]$/g.test(data.bname)) {
                        extraRoadAddr += data.bname;
                     }
                     // 건물명이 있고, 공동주택일 경우 추가한다.
                     if (data.buildingName !== ''
                           && data.apartment === 'Y') {
                        extraRoadAddr += (extraRoadAddr !== '' ? ', '
                              + data.buildingName : data.buildingName);
                     }
                     // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                     if (extraRoadAddr !== '') {
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                     }

                     // 우편번호와 주소 정보를 해당 필드에 넣는다.
                     document.getElementById('postcode').value = data.zonecode;
                     document.getElementById("roadAddress").value = roadAddr;
                     document.getElementById("jibunAddress").value = data.jibunAddress;

                     document.getElementById("engAddress").value = data.addressEnglish;

                     // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                     if (roadAddr !== '') {
                        document.getElementById("extraAddress").value = extraRoadAddr;
                     } else {
                        document.getElementById("extraAddress").value = '';
                     }

                     var guideTextBox = document.getElementById("guide");
                     // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                     if (data.autoRoadAddress) {
                        var expRoadAddr = data.autoRoadAddress
                              + extraRoadAddr;
                        guideTextBox.innerHTML = '(예상 도로명 주소 : '
                              + expRoadAddr + ')';
                        guideTextBox.style.display = 'block';

                     } else if (data.autoJibunAddress) {
                        var expJibunAddr = data.autoJibunAddress;
                        guideTextBox.innerHTML = '(예상 지번 x`주소 : '
                              + expJibunAddr + ')';
                        guideTextBox.style.display = 'block';
                     } else {
                        guideTextBox.innerHTML = '';
                        guideTextBox.style.display = 'none';
                     }
                  }
               }).open();
      }
   </script>
</body>
</html> 