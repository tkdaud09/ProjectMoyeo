<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login.css" >
</head>

<body>
	<section class="">
		<div class="container">
			<div class="py-10">
				<div class="join_form_section">
					<h2 class="title_f">회원가입</h2>
						<form:form id="join_form" name="login" action="/join" method="post" modelAttribute="Userinfo">
            				
            				<!-- 아이디 -->
				            <label for="id" class="sp">
					            <p class="s_tit">아이디</p>
					            <form:input path="id" type="text" class="id_input input_f" name="id" id="id" placeholder="아이디를 입력하세요."/>
					            <form:errors path="id" />
					            <span class="id_input_re_1">사용 가능한 아이디입니다.</span>
								<span class="id_input_re_2">사용 불가(중복, 조건미달) 아이디입니다.</span>
				        	</label>
            				
            				<!-- 비밀번호 -->
				            <label for="pw" class="sp" >
					            <p class="s_tit">비밀번호</p>
					            <form:password path="pw" class="pw_input input_f" name="pw" id="pw" placeholder="비밀번호를 입력하세요."/>
					            <form:errors path="pw" />
				            </label>
				            
            				<!-- 비밀번호 확인 -->
							<label for="pw2"  class="sp">
								<p class="s_tit">비밀번호 확인</p>
								<input type="password" class="pwck_input input_f"  name="pw2" id="pw2" placeholder="비밀번호를 재입력하세요." ><span id="check"></span>
								<span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span> 
								<span class="pwck_input_re_1">비밀번호가 일치합니다.</span> 
								<span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span> 
							</label>
							
			        	    <!-- 이름 -->         
							<label for="name" class="sp">
								<p class="s_tit">이름</p>
								<form:input path="name" type="text" class="name_input input_f" name="name" id="name" value=""  placeholder="이름을 입력하세요."/>
								<form:errors path="name" />
							</label>
            
            				<!-- 생년월일 -->
				         	<label for="birth"  class="sp">
					         	<p class="s_tit">생년월일</p>
					            <form:input path="birth" type="text" class="year_input input_f" name="birth" id="birth" placeholder="ex) 2000-01-01"/>
					            <form:errors path="birth" />
				            </label>
            
            				<!-- 주소 -->
							<div class="sp">
								<label for="roadAddress"><p class="s_tit">주소</p></label>
				                <input type="text" class="address_input input_f" id="postcode" placeholder="우편번호" readonly="readonly" >
				                <input type="button" class="input_f" onclick="execDaumPostcode()" value="우편번호 찾기">
				                <input type="text" class="input_f" id="roadAddress" placeholder="도로명주소" size="60" readonly="readonly" >
				                <input type="hidden" class="input_f" id="jibunAddress" placeholder="지번주소" size="60">
				                <span id="guide" style="color:#999;display:none"></span>
				                <input type="text" class="input_f" id="detailAddress" placeholder="상세주소" size="60">
				                <input type="hidden" class="input_f" id="extraAddress" placeholder="참고항목" size="60">
				                <input type="hidden" class="input_f" id="engAddress" placeholder="영문주소" size="60">
				                <form:input path="address" type="hidden" class="input_f" id="totaladdress" name="address" value=""/>
				                <form:errors path="address" />
			                </div>
            
            				<!-- 성별 -->
							<div class="sp">
							    <p class="s_tit">성별</p>
							    <label for="man"><form:radiobutton path="gender" class="radio" name="gender" value="m" id="man"/><span class="gen_m"> 남성</span></label>
							    <label for="woman"><form:radiobutton path="gender" class="radio gen_w" name="gender" value="f" id="woman"/><span class="gen_m"> 여성</span></label>
							    <form:errors path="gender" />
							</div>
            
            				<!-- 이메일 -->
          					<div class="sp">  
	         				<label for="user_email"><p class="s_tit">이메일</p></label>
	         				
	           				<div class="join_tt">
		           			<div class="join_right">
		           	 		<input type="text" class="email_input input_f" id="user_email"  placeholder="이메일을 입력해주세요" >
		              		<form:input path="email" type="hidden" id="totalemail" name="email" value=""/>
		              		<form:errors path="email" />
		            		</div>  
		              
		           			<div class="input-group-addon join_left">
		              		<button type="button" class="btn btn-primary me_btn" id="mail-Check-Btn">본인인증</button>
		             		</div>
	           				</div>  
	             			
	           				<div class="mail-check-box">
	              			<input class="mail-check-input input_f" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
	           				</div>
	             			<div>
	              			<span id="mail-check-warn" class="sp"></span>
	           				</div>
            				</div>
           
           					<!-- 휴대폰 번호 -->
				            <div class="sp">  
						        <label for="phone"><p class="s_tit">휴대폰 번호</p>
						        	<form:input path="phone" type="text" class="phone_input input_f" name="phone" id="phone" placeholder="010-****-****"/>
						        	<form:errors path="phone" />
						        </label>
				            </div>
            				<br>
			  	 				<input type="button" class="join_button" value="가입하기">
					</form:form>
				</div>
			</div>
		</div> 
	</section>
<script>
	/* 아이디 중복검사 */
	//아이디 중복검사 길이
	$('.id_input').on("propertychange change keyup paste input", function() {
			var id = $(this).val(); // .id_input에 입력되는 값
			var data = { id: id }; // '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
	
		$.ajax({
				type: "post",
				url: "${pageContext.request.contextPath}/user/memberIdChk",
				data: data,
				
			success: function(result) {
				var idCheckMessage = $('.id_input_re_1');
				var idLengthCheckMessage = $('.id_input_re_2');
				           
				if (result != 'fail') {
					idCheckMessage.css("display", "block");
					idCheck = true;
					idckCheck = true;
				} else {
					idCheckMessage.css("display", "none");
					idCheck = false;
					idckCheck = false;
	           }
	       } // success 종료
	   }); // ajax 종료
	}); // function 종료

      
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
      
	/*주소 API*/
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete: function(data) {
	            // 도로명 주소 변수와 참고 항목 변수 초기화
	            var roadAddr = data.roadAddress;
	            var extraRoadAddr = '';
	            
	            // 법정동명 추가
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            
	            // 건물명 추가
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            
	            // 참고항목 문자열 만들기
	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	
	            // 우편번호와 도로명주소, 지번주소를 해당 필드에 저장
	            var postcode = data.zonecode;
	            document.getElementById('postcode').value = postcode;
	            document.getElementById("roadAddress").value = roadAddr;
	            document.getElementById("jibunAddress").value = data.jibunAddress;
	
	            // 영문주소 (옵션)
	            document.getElementById("engAddress").value = data.addressEnglish;
	            
	            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	            if(roadAddr !== ''){
	                document.getElementById("extraAddress").value = extraRoadAddr;
	            } else {
	                document.getElementById("extraAddress").value = '';
	            }
	
	            // 상세주소를 가져온다.
	            var detailAddr = document.getElementById("detailAddress").value;
	
	            // 우편번호, 도로명주소, 상세주소를 하나의 문자열로 합친다.
	            var totalAddr = postcode + ", " + roadAddr;
	            if (detailAddr !== "") {
	                totalAddr += ", " + detailAddr;
	            }
	
	            // 합쳐진 주소를 hidden input에 저장
	            document.getElementById("totaladdress").value = totalAddr;
	            
	            // 기타 로직 (주소 선택 안했을 경우 등)
	            var guideTextBox = document.getElementById("guide");
	            if(data.autoRoadAddress) {
	                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                guideTextBox.style.display = 'block';
	            } else if(data.autoJibunAddress) {
	                var expJibunAddr = data.autoJibunAddress;
	                guideTextBox.innerHTML = '(예상 지번주소 : ' + expJibunAddr + ')';
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