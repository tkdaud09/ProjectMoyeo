<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
  
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</head>     

<body id="body" class="up-scroll">
	<div class="main-wrapper packages-grid">
<!-- ====================================
——— PAGE TITLE
===================================== -->
<section class="page-title">
  <div class="page-title-img bg-img bg-overlay-darken" style="background-image: url(${pageContext.request.contextPath}/assets/img/pages/page-title-bg6.jpg);">
    <div class="container">
      <div class="row align-items-center justify-content-center" style="height: 200px;">
        <div class="col-lg-6">
          <div class="page-title-content">
            <div class="title-border">
              <h2 class="text-uppercase text-white font-weight-bold">결제</h2>
            </div>
            <p class="text-white mb-0"></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- ====================================
——— DIY SECTION
===================================== -->
<section class="">
	<div class="container">
		<div class="py-10">
			<div class="review_content border_con">
				<div class="diy_form_title">결제</div>
						<div class="pay_form">
							<div class="pay_left">
							
								<div class="pay_con1_box pbox">
									<sec:authentication property="principal" var="pinfo"/>
									<p>주문 상품 정보</p>
									<div class="pay_con1_img">
										상품 이미지
									</div>
									<c:forEach var="cart" items="${cartList}" varStatus="i">
										<p>패키지 번호: <input type="hidden" name="packIdx" value="${cart.packIdx}">${cart.packIdx}</p>
										<p>성인 수: <input type="hidden" name="packAdultcount" value="${cart.packAdultcount}">${cart.packAdultcount}</p>
										<p>소인 수: <input type="hidden" name="packChildcount" value="${cart.packChildcount}">${cart.packChildcount}</p>
									</c:forEach>
								</div><!-- //pay_con1_box -->
								
								
								<div class="pay_con2_box pbox" >
									<p>주문자 정보</p>
									<ul>
										<li><input type="hidden" name="userinfoId" value="${userinfo.id}">${userinfo.id}</li>
										<li><input type="hidden" name="userinfoName" value="${userinfo.name}">${userinfo.name}</li>
										<li><input type="hidden" name="userinfoPhone" value="${userinfo.phone}">${userinfo.phone}</li>
										<li><input type="hidden" name="userinfoEmail" value="${userinfo.email}">${userinfo.email}</li>
									</ul>
								</div><!-- //pay_con2_box -->
						
								
								<div class="pay_right">
									<div class="pay_con3_box pbox">
										<p>최종 결제금액</p>
										<ul>
											<li>총 결제금액 <span><input type="hidden" name="paymentAmount" value="${sumTotal}">${sumTotal}</span></li>
										</ul>
									</div><!-- //pay_con3_box -->
								</div>
								
								<div class="pay_con4_box pbox">
									<p>결제 방법</p>
									<button type="button" id="html5_inicis" class="pay">일반결제(KG이니시스)</button>
								</div><!-- //pay_con4_box -->
							</div>	
						</div><!-- pay_form -->
				</div>
			</div>
		</div>
</section>
</div>
</body>

<script type="text/javascript">
	 
	var name = "${sumTitle}";
	//var paymentIdx = ${payment.paymentIdx};
	
	var packIdx = []; // JavaScript 배열 생성

    <c:forEach items="${packIdxArray}" var="packIdxValue">
        packIdx.push(${packIdxValue}); // 배열에 값 추가
    </c:forEach>

	var userinfoId = "${userinfo.id}";
	//var packIdx = ${cart.packIdx};
	
	var buyerEmail="${userinfo.email}";
	var buyerName="${userinfo.name}";
	var buyerTel="${userinfo.phone}";
	var buyerAddress="${userinfo.address}";
	
	var postalCodeMatch = buyerAddress.match(/우편번호 (\d{5})/);
	var restOfAddressMatch = buyerAddress.match(/주소 (\S.+)/);
	
	var postalCode = postalCodeMatch[1];
	var restOfAddress = restOfAddressMatch[1];
	
	$(document).ready(function() {
		var csrfHeaderName="${_csrf.headerName}"
	    var csrfTokenValue="${_csrf.token}";
		$(document).ajaxSend(function(e, xhr) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		});
			
		$(".pay").click(function() {

		var pg=$(this).attr("id");
		//alert(pg);
		
		var IMP=window.IMP;
		//IMP 객체 초기화 - 가맹점 식별코드
		IMP.init("imp20874165");
		
		//주문번호 - 주문테이블에서 제공된 값 사용
		var merchantUid="merchant_"+new Date().getTime();
		//결제금액 - 주문테이블에서 제공된 값 사용
		var paymentAmount=${sumTotal};
		
		//결제 전 주문번호와 결제금액을 세션에 저장하기 위한 페이지 요청
		// => 결제 후 결제정보와 비교하여 검증하기 위해 세션에 저장 
		$.ajax({
			type: "post",
			url: "<c:url value="/payment/pay"/>",
			contentType: "application/json",
			data: JSON.stringify({"merchantUid":merchantUid, "paymentAmount":paymentAmount}),
			dataType: "text",
			success: function(result) {
				if(result=="ok") {
					//결제를 요청하는 메소드 호출
					IMP.request_pay({
						// 결제 대행사 : kakaopay, html5_inicis, nice, jtnet, uplus, danal, payco 등
						pg : pg,
						// 결제 방식 : card(카드), samsung(삼성페이), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
						pay_method : "card",
						//주문번호
						merchant_uid : merchantUid,
						//결제금액
						amount : paymentAmount,
						//결제창에 보여질 제품명
						name: name,
						//결제 사용자의 이메일 주소 
						buyer_email: buyerEmail,
	                    buyer_name: buyerName,//결제 사용자 이름
	                    buyer_tel: buyerTel,//결제 사용자 전화번호
	                    buyer_postcode: postalCode,//결제 사용자 우편번호
	                    buyer_address: restOfAddress,//결제 사용자 주소
	               }, function(response) {//결제 관련 응답 결과를 제공받아 처리하는 함수
						//response : 응답결과를 저장한 Object 객체
						if (response.success) {//결제한 경우
							//결제금액을 검증하기 위한 페이지를 요청
							$.ajax({
								type: "post",
								url: "<c:url value="/payment/complete"/>",
								contentType: "application/json",
								data: JSON.stringify({
									"impUid": response.imp_uid, 
									"merchantUid": response.merchant_uid,
									"packIdx": packIdx
								}),
								dataType: "text",
								success: function(result) {
									
									if(result == "success") {
										//결제 성공 페이지로 이동
										alert("결제 성공");
										$("#paymentForm").submit(); 
									} else {
										//결제 실패 페이지로 이동
										alert("결제 취소");
									}
								}, 
								error: function(xhr) {
									alert("에러 = "+xhr.status);
								}
							});
						}
					});
				}
			}, 
			error: function(xhr) {
				alert("에러 = "+xhr.status);
			}
		});
		
	});
});
</script>
</body>
</html>

