<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html >
  

<head>
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login.css" >
	 
	<style>
	.login_warn {
		color : red;
	}
	</style>
	
	<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	  crossorigin="anonymous"></script>
  
</head>
<body>


<section class="">
  <div class="container">
		<div class="py-10">
		
		
		<form id="login_form" method="post">
			<div class="logo_wrap title_f">
				<span>회원정보 변경 확인 페이지</span>
			</div>
			<div class="login_wrap"> 
				<div class="id_wrap">
						<div class="id_input_box">
						<input class="input_f" type="text" name="id" value="${userinfo.id }" readonly>
					</div>
				</div>
				<div class="pw_wrap">
					<div class="pw_input_box">
						<input type="password" class="pw_iput input_f" name="pw" placeholder="비밀번호를 입력하세요.">
					</div>
				</div>
				
				<c:if test = "${result == 0 }">
					<div class = "login_warn">사용자 비밀번호를 잘못 입력하셨습니다.</div>
				</c:if>
				
				<div class="login_button_wrap ">
					<input type="button" class="confirm_button btn2" value="확인">
					<button class="btn1" onclick="goBack()">취소</button>
				</div>			
			</div>
			
		</form>
		
		
		
	</div>

</div>
</section>

<script>


	/* 확인 버튼 클릭 메서드 */
	$(".confirm_button").click(function(){	
		//alert("확인 버튼 작동");
		
		/* 로그인 메서드 서버 요청 */
		$("#login_form").attr("action", "pwCheck");
		$("#login_form").submit();
	});
	
	function goBack() {
        // 이전 페이지로 돌아가기
        window.history.back();
    }
	

</script>

</body>
</html>