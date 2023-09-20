<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="utf-8">
  
<head><script src="https://code.jquery.com/jquery-3.6.0.min.js"></script></head>
<body id="body" class="up-scroll">

  <div class="main-wrapper packages-grid">



<div class="pack_detail_title">
   <p>${pack.packTitle} </p>
</div>

<!-- ====================================
———   PACKAGES SECTION
===================================== -->
<section class="py-10 pd">
  <div class="container">
    <div class="row">
      <div class="col-md-5 col-lg-4 order-2">
          <div class="card border">
            <h2 class="card-header text-uppercase text-center bg-smoke border-bottom">
              옵션선택
            </h2>
         
         
            <div class="card-body px-3 py-4">
              <div class="border-bottom mb-5">
                <div class="form-group mb-5">
                  <div class="row p_date">
                    <label for="inputTime" class="col-xl-3 col-form-label text-center text-xl-right px-2"><b>여행 일정</b></label>
               
               <!-- 데이트피커 부분  -->
               <!--  <div class="col-xl-7">
                      <div class="form-group form-group-icon form-group-icon-category-2 mb-0">
                        <i class="far fa-calendar-alt" aria-hidden="true"></i>
                        <input type="text" class="form-control daterange-picker-category-2" autocomplete="off" name="dateRange" value=""
                          placeholder="MM/DD/YYYY">
                      </div>
                    </div>  -->
                    
                         
                            <ul class="pack_date">
	                            <li>${pack.packStartDate}</li>
	                            <li>${pack.packEndDate}</li>
                            </ul>
                          
   
                     
                  </div>
                </div>

<form action="<c:url value='/cart/insert'/>" method="post">
               <c:set var="packIdx" value="${pack.packIdx}" />
<div class="form-group mb-5">
    <div class="row align-items-center" >
        <label class="control-label col-xl-3 text-center text-xl-right"><b>성인</b></label>
        <div class="col-xl-5">
            <div class="count-input mx-auto">
                <a class="incr-btn adult" data-action="decrease" href="javascript:void(0)">–</a>
                <input class="quantity adult" type="number" value="0" name="packAdultcount">
                <a class="incr-btn adult" data-action="increase" href="javascript:void(0)">+</a>
            </div>
        </div>
        <div class="col-xl-3">
            <p class="text-center mt-3 mt-xl-0 mb-0"><b>${pack.packAdultPrice}원</b></p>
        </div>
    </div>
</div>

<div class="form-group mb-5">
    <div class="row align-items-center">
        <label class="control-label col-xl-3 text-center text-xl-right"><b>소인</b></label>
        <div class="col-xl-5">
            <div class="count-input mx-auto">
                <a class="incr-btn child" data-action="decrease" href="javascript:void(0)">–</a>
                <input class="quantity child" type="number" value="0" name="packChildcount">
                <a class="incr-btn child" data-action="increase" href="javascript:void(0)">+</a>
            </div>
        </div>
        <div class="col-xl-3">
            <p class="text-center mt-3 mt-xl-0 mb-0"><b>${pack.packChildPrice}원</b></p>
        </div>
    </div>
</div>
              </div>

              <div class="d-flex justify-content-between border-bottom mb-5 pb-5">
                <span class="text-uppercase h4 mb-0">Total cost</span>
                 <span class="font-weight-bold text-primary h3 mb-0" id="total-cost">0원</span>
              
             
              </div>






              <div class="pack_option_btn">
  
                <button type="button" onclick="location.href='booking-step-1.html';"
                  class="btn btn-hover btn-lg btn-block btn-outline-secondary text-uppercase bsize po_btn01">
                  예약하기
                </button>
           		<input type="hidden" name="packIdx" value="${packIdx}" />



				<button type="submit" class="btn btn-hover btn-lg btn-block btn-outline-secondary text-uppercase bsize po_btn01" value="장바구니"onclick="showAlert()">
					장바구니
				</button>
						
						
								
				<%--<button type="button" onclick="location.href='booking-step-1.html';"
                  class="btn btn-hover btn-lg btn-block btn-outline-secondary text-uppercase bsize">
                  하트수정<span class="ms-4"><i class="fa fa-angle-right" aria-hidden="true"></i></span>
                </button> --%>
				

				
				<!-- 찜 기능 -->
				<button type="button" class="btn btn-hover btn-lg btn-block btn-outline-secondary text-uppercase bsize po_btn02" id="packageHeartBtn">
				    <img id="heartImage" src="${pageContext.request.contextPath}/assets/img/package_heart.png" alt="하트 이미지" >
				</button>
				<input type="hidden" name="userinfoId" value="${userinfo.id}">
				<input type="hidden" name="packHeartIdx" value="${packHeartList.packHeartIdx}" id="packHeartIdx">

           </div><!-- //pack_option_btn -->

              
            </div>
          </div>
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>          
        </form>
      </div>
    
 
      
     <!-- 이미지 출력 -->
      <div class="col-md-7 col-lg-8">
        <div id="package-slider" class="owl-carousel owl-theme package-slider">
          <div class="item">
            <img class="lazyestload" data-src="${pageContext.request.contextPath}/assets/img/upload/${pack.packSlideImg1}" src="${pageContext.request.contextPath}/assets/img/upload/${pack.packSlideImg1}" alt="image">
          </div>

          <div class="item">
            <img class="lazyestload" data-src="${pageContext.request.contextPath}/assets/img/upload/${pack.packSlideImg2}" src="${pageContext.request.contextPath}/assets/img/upload/${pack.packSlideImg2}" alt="image">
          </div>

          <div class="item">
            <img class="lazyestload" data-src="${pageContext.request.contextPath}/assets/img/upload/${pack.packSlideImg3}" src="${pageContext.request.contextPath}/assets/img/upload/${pack.packSlideImg3}" alt="image">
          </div>
        </div>

      

      <div class="package_con">
         <div class="pack_img1">

         
         <img src="<c:url value='/assets/img/upload/${pack.packCalendarImg}'/>" alt="">   
         <img src="<c:url value='/assets/img/upload/${pack.packContentImg1}'/>" alt=""> 
         </div>
          
      </div>
      
      
      
	<!-- -----------------------------------후기----------------------- -->
        <div class="mb-7">

          <div class="d-flex align-items-center mb-6">
            <h3 class="text-uppercase mb-0">
              <span class="me-2"  style="font-weight:600; font-size:25px;">Review</span>

              <span class="text-warning">
                <i class="fa fa-star" aria-hidden="true"></i>
                <i class="fa fa-star" aria-hidden="true"></i>
                <i class="fa fa-star" aria-hidden="true"></i>
                <i class="fa fa-star" aria-hidden="true"></i>
                <i class="fas fa-star-half-alt" aria-hidden="true"></i>
              </span>
            </h3>
          </div>

	<c:forEach var="review" items="${latestReviews}">
          <div class="media mb-6">
            <a class="me-6 pack_review" href="<c:url value='/review/view?reviewIdx=${review.reviewIdx}'/>"> <!-- 사진 -->
              <img class="rounded" src="<c:url value='/assets/img/upload/${review.reviewImg}'/>" alt="">
            </a>

            <div class="media-body pack_reviewList"> <!-- 제목, 내용, 이름날짜 -->
              <h5 style="font-weight:600;"><a href="<c:url value='/review/view?reviewIdx=${review.reviewIdx}'/>">${review.reviewTitle}</a></h5>
              <p class="mb-0" style="color:#000;">${review.reviewContent}</p>
              <p class="mb-0">${review.userinfoId} / <span><fmt:formatDate value="${review.reviewRegdate}" pattern="yyyy-MM-dd" /></span></p>
            </div>
          </div>
	</c:forEach>


        </div>

       <button type="button" id="removeBtn">삭제</button>
       
      </div>
    </div>
  </div>
</section>


  </div><!-- element wrapper ends -->
   

      <!-- 가격 계산 -->
      <script>
      
     
      
      
      // 성인 가격 소인 가격 설정 
       const adultPrice = ${pack.packAdultPrice};
       const childPrice = ${pack.packChildPrice};
   
       // 요소 선택
       const adultInput = document.querySelector('.quantity.adult');
       const childInput = document.querySelector('.quantity.child');
       const totalCostSpan = document.getElementById('total-cost');
    
    
       $(document).ready(function () {
           $(".incr-btn.adult").click(function () {
             const adultTotalCost = adultInput.value * adultPrice;
             const childTotalCost = childInput.value * childPrice;
             const totalCost = adultTotalCost + childTotalCost;
             totalCostSpan.textContent = totalCost +"원" ;
           });

           $(".incr-btn.child").click(function () {
             const adultTotalCost = adultInput.value * adultPrice;
             const childTotalCost = childInput.value * childPrice;
             const totalCost = adultTotalCost + childTotalCost;
             totalCostSpan.textContent = totalCost +"원";
           });
         });
     function showAlert() {
       var successMessage = "${successMessage}";
       var errorMessage = "${errorMessage}";

       if (successMessage) {
           alert(successMessage);
       } else if (errorMessage) {
           alert(errorMessage);
       }
    }
     
     
   /*패키지삭제*/
   $("#removeBtn").click(function() {
		if(confirm("게시글을 삭제 하시겠습니까?")) {
			$("#linkForm").attr("action", "<c:url value="/admin/removePackage"/>").submit();
		}
	});
   
   
    /* 찜 기능 구현 */
	
	// 클릭한 하트의 상태를 나타내는 변수
	var isHeartAdded = ${isHeartAdded}; 	
	
	// 하트 이미지 클릭 시
	document.getElementById('packageHeartBtn').addEventListener('click',function (){
		
		 var csrfHeaderName="${_csrf.headerName}";
	      var csrfTokenValue="${_csrf.token}";
	         
	      //ajaxSend() 메소드를 호출하여 페이지에서 Ajax 기능으로 요청하는 모든 웹프로그램에게 CSRF 토큰 전달
	      // => Ajax 요청시 beforeSend 속성을 설정 불필요
	      $(document).ajaxSend(function(e, xhr) {
	         xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	      });
	      
	    isHeartAdded = !isHeartAdded; // 상태 토글

	    // 이미지 변경
	    var heartImage = document.getElementById('heartImage');
	    if (isHeartAdded) {
	        heartImage.src = "${pageContext.request.contextPath}/assets/img/package_heart_red.png";
	        addToWishlist(); // 찜 목록에 추가
	    } else {
	        heartImage.src = "${pageContext.request.contextPath}/assets/img/package_heart.png";
	        removeFromWishlist(); // 찜 목록에서 삭제
	    }
	});

	// 찜 목록에 추가하는 함수
	function addToWishlist() {
	    var packIdx = ${pack.packIdx};
	    var userinfoId = "${userinfo.id}";

	    $.ajax({
	        url: "${pageContext.request.contextPath}/package/addToPackageHeartList",
	        method: "POST",
	        data: {
	            packIdx: packIdx,
	            userinfoId: userinfoId
	        },
	        success: function (response) {
	        	isHeartAdded = true; // 찜이 추가되었으므로 상태를 true로 변경
	            console.log("찜 목록에 추가되었습니다.");
	        },
	        error: function () {
	            console.error("찜 목록 추가에 실패했습니다.");
	        }
	    });
	}

	// 찜 목록에서 삭제하는 함수
	function removeFromWishlist() {
	    //var packHeartIdx = ${packHeartList.packHeartIdx};
	    var packHeartIdx = document.getElementById("packHeartIdx").value
	    var userinfoId = "${userinfo.id}";

	    $.ajax({
	        url: "${pageContext.request.contextPath}/package/removeFromPackageHeartList", 
	        method: "POST",
	        data: {
	        	packHeartIdx: packHeartIdx,
	            userinfoId: userinfoId
	        },
	        success: function (response) {
	            console.log("찜 목록에서 삭제되었습니다.");
	            isHeartAdded = false; // 찜이 삭제되었으므로 상태를 false로 변경
	            updateHeartImage(); // 하트 이미지 업데이트
	        },
	        error: function () {
	            console.error("찜 삭제에 실패했습니다.");
	        }
	    });
	}
	
	// 하트 이미지 업데이트 함수
	function updateHeartImage() {
	    var heartImage = document.getElementById('heartImage');
	    if (isHeartAdded) {
	        heartImage.src = "${pageContext.request.contextPath}/assets/img/package_heart_red.png";
	    } else {
	        heartImage.src = "${pageContext.request.contextPath}/assets/img/package_heart.png";
	    }
	}

	// 페이지 로드 시 초기 하트 이미지 설정
	$(document).ready(function () {
	    updateHeartImage();
	});
   
   </script>
   
  </body>
</html>