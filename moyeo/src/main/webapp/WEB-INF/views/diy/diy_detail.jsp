<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>  
<!DOCTYPE html>
<html lang="utf-8">
  
  <head>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=e3oa0wasfu"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<style>
 
  .diy_tit_t {
            text-align: center; 
            margin: 0 auto;
            max-width: 70ch; 
    		word-wrap: break-word; 
        }
</style>

  </head>     

<body id="body" class="up-scroll">

  <!-- ====================================
  ——— HEADER
  ===================================== -->


<!-- ====================================
———	PAGE TITLE
===================================== -->
<section class="page-title">
  <div class="page-title-img bg-img bg-overlay-darken" style="background-image: url(${pageContext.request.contextPath}/assets/img/pages/page-title-bg7.jpg);">
    <div class="container">
      <div class="row align-items-center justify-content-center" style="height: 200px;">
        <div class="col-lg-6">
          <div class="page-title-content">
            <div class="title-border">
              <h2 class="text-uppercase text-white font-weight-bold">DIY</h2>
            </div>
            <p class="text-white mb-0"></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>


<!-- ====================================
———	BOOKING SECTION
===================================== -->
<section class="">
  <div class="container">
    <div class="py-10">            	  
      <div class="review_content border_con">
      
        <div class="diy_form_title">${diyDetail.diyTitle }</div>
        <div class="diy_tit_t">${diyDetail.diyIntroduction }</div>
     	   <div class="write_form diyy_form">
     	   
     	   			<!-- 로그인 사용자의 좋아요 기능 -->
                    <c:if test="${!empty(userinfo.id)}">
                      <c:if test="${diyLoveStatus.loveIdx eq null}">
		              	  <button type="button" id="heartButton" class="btn btn-xs btn-outline-secondary">
		                  <i id="heartIcon" class="far fa-heart" aria-hidden="false"> ${diyDetail.loveCount}</i>
		                  </button>
                      </c:if>
                      
                      <c:if test="${diyLoveStatus.loveIdx ne null}">
		                  <button type="button" id="heartButton" class="btn btn-xs btn-outline-secondary">
		                  <i id="heartIcon" class="fas fa-heart" aria-hidden="false"><span id="like-count"> ${diyDetail.loveCount}</span></i>
		                  </button>
                      </c:if>
                    </c:if>
                    
                    <!-- 비로그인 사용자의 좋아요 기능 -->
                    <c:if test="${empty(userinfo.id)}">
			   	        <a href="javascript: Login();" class="btn btn-xs btn-outline-secondary"> 
			            <i id="heartIcon" class="far fa-heart" aria-hidden="false"> ${diyDetail.loveCount}</i>
			            </a>
                    </c:if>
                    
                    <input type="hidden" name="userinfoId" value="${userinfo.id }">
		     		<input type="hidden" name="loveIdx" value="${diyLoveStatus.loveIdx }" id="loveIdx">
     	   <sec:csrfInput/>
     	   
     	   <!-- 전체 input 태그 바꾸기 -->
     	   	  <div class="form-group row">
				    <div class="col-sm-10">
				        <span>아이디 : ${diyDetail.userinfoId}</span>
				    </div>
				</div>
				
				<div class="form-group row">
				    <div class="col-sm-10">
				        <span>등록일 : ${diyDetail.diyRegdate}</span>
				    </div>
				</div>
				
				<div style="display:none">
				    <input type="text" name="diyIdx" value="${diyDetail.diyIdx}">
				</div>
  
            
     	   
     	   <!-- 작성버튼 없애기, 아이디가같으면 수정버튼 생성 -> modify로 이동, 다 수정할 수 없게 만들기 /작성일, 수정일 보여지기 -->
              <div class="diy_con1">
                <label for="diyStartdate">출발일
                  <i class="far fa-calendar-alt" aria-hidden="true"></i>
                  <input type="text" class="form-control border-0 bg-smoke" id="diyStartdate" value="${diyDetail.diyStartdate }" readonly>
                </label>
                <label for="diyEnddate">도착일
                  <i class="far fa-calendar-alt" aria-hidden="true"></i>
                  <input type="text" class="form-control border-0 bg-smoke" id="diyEnddate" value="${diyDetail.diyEnddate }" readonly>
                  </label>
              </div>
        

    
            <div class="diy_con2">
                <label for="diyPeople">인원
                  <input type="text" class="form-control border-0 bg-smoke" id="diyPeople" name="diyPeople" value="${diyDetail.diyPeople }" readonly>
                </label>
                <label for="diyLoc">지역
                  <input type="text" class="form-control border-0 bg-smoke" id="diyLoc" name="diyLoc" value="${diyDetail.diyLoc }" readonly>
    			</label>
                <label for="diyPrice">비용
                  <input type="text" class="form-control border-0 bg-smoke" id="diyPrice" name="diyPrice" value="${diyDetail.diyPrice }" readonly>
                </label>
            </div>
    
          
           
		  <!-- day 1 사진 -->
		  <div class="diy_con4 form-group">
		    <label for="diyContent1">DAY 1</label>	          
	        <img class="card-img-top rounded lazyestload" id="diyContent1Img" data-src="${pageContext.request.contextPath}/assets/img/upload/${diyDetail.diyContent1Img}" src="${pageContext.request.contextPath}/assets/img/upload/${diyList.diyContent1Img}" alt="Day 1 img">
            <textarea class="form-control border-0 bg-smoke" id="diyContent1" rows="10" readonly>${diyDetail.diyContent1 }</textarea>
          </div>
				
          <!-- day 2 사진 -->
          <c:if test="${diyDetail.diyContent2 != null}">
          <div class="diy_con4 form-group">
            <label for="diyContent2">DAY 2</label>
	        <img class="card-img-top rounded lazyestload" id="diyContent2Img" data-src="${pageContext.request.contextPath}/assets/img/upload/${diyDetail.diyContent2Img}" src="${pageContext.request.contextPath}/assets/img/upload/${diyList.diyContent2Img}" alt="Day 2 img">
            <textarea class="form-control border-0 bg-smoke" id="diyContent2" rows="10" readonly>${diyDetail.diyContent2 }</textarea>
          </div>
          </c:if>
          
          <!-- day 3 사진 -->
          <c:if test="${diyDetail.diyContent3 != null}">
          <div class="diy_con4 form-group">
            <label for="diyContent3">DAY 3</label>
	        <img class="card-img-top rounded lazyestload" id="diyContent3Img" data-src="${pageContext.request.contextPath}/assets/img/upload/${diyDetail.diyContent3Img}" src="${pageContext.request.contextPath}/assets/img/upload/${diyList.diyContent3Img}" alt="Day 3 img">
            <textarea class="form-control border-0 bg-smoke" id="diyContent3" rows="10" readonly>${diyDetail.diyContent3 }</textarea>
          </div>
          </c:if>
          
          <!-- day 4 사진 -->
          <c:if test="${diyDetail.diyContent4 != null}">
          <div class="diy_con4 form-group">
            <label for="diyContent4">DAY 4</label>
            <img class="card-img-top rounded lazyestload" id="diyContent4Img" data-src="${pageContext.request.contextPath}/assets/img/upload/${diyDetail.diyContent4Img}" src="${pageContext.request.contextPath}/assets/img/upload/${diyList.diyContent4Img}" alt="Day 4 img">
            <textarea class="form-control border-0 bg-smoke" id="diyContent4" rows="10" readonly>${diyDetail.diyContent4 }</textarea>
          </div>
          </c:if>
          
          <!-- 추가한 내용이 있으면 출력해준다. -->
          <c:if test="${diyDetail.diyContent5 != null}">
          <div class="diy_con4 form-group">
            <label for="diyContent4">DAY 5</label>
            <img class="card-img-top rounded lazyestload" id="diyContent5Img" data-src="${pageContext.request.contextPath}/assets/img/upload/${diyDetail.diyContent5Img}" src="${pageContext.request.contextPath}/assets/img/upload/${diyList.diyContent5Img}" alt="Day 5 img">
            <textarea class="form-control border-0 bg-smoke" id="diyContent5" rows="10" readonly>${diyDetail.diyContent5 }</textarea>
          </div>
          </c:if>
          
          <c:if test="${diyDetail.diyContent6 != null}">
          <div class="diy_con4 form-group">
            <label for="diyContent4">DAY 6</label>
            <img class="card-img-top rounded lazyestload" id="diyContent6Img" data-src="${pageContext.request.contextPath}/assets/img/upload/${diyDetail.diyContent6Img}" src="${pageContext.request.contextPath}/assets/img/upload/${diyList.diyContent6Img}" alt="Day 6 img">
            <textarea class="form-control border-0 bg-smoke" id="diyContent6" rows="10" readonly>${diyDetail.diyContent6 }</textarea>
          </div>
          </c:if>
          
          <c:if test="${diyDetail.diyContent7 != null}">
          <div class="diy_con4 form-group">
            <label for="diyContent4">DAY 7</label>
            <img class="card-img-top rounded lazyestload" id="diyContent7Img" data-src="${pageContext.request.contextPath}/assets/img/upload/${diyDetail.diyContent7Img}" src="${pageContext.request.contextPath}/assets/img/upload/${diyList.diyContent7Img}" alt="Day 7 img">
            <textarea class="form-control border-0 bg-smoke" id="diyContent7" rows="10" readonly>${diyDetail.diyContent7 }</textarea>
          </div>
          </c:if>
          
          <!-- 지도 -->
          <div id="map" style="width:80%; height:500px;"></div>
          
          <!-- 로그인 정보가 일치하는 사람만 버튼 활성화 -->
          <c:if test="${userinfo.id eq diyDetail.userinfoId}">
          <div class="mb-6">
            <a href="${pageContext.request.contextPath}/diy/diy_modify/${diyDetail.diyIdx}" >
              <button type="submit" class="btn btn-outline-primary mb-2" id="editButton">
               수정하기
              </button>
            </a>
           
            <button type="submit" class="btn btn-outline-primary mb-2" id="deleteButton" onclick="deleteConfirm()">
              삭제하기
            </button>
           </div>
          </c:if>
         
           
           <div class="text-center text-md-start text-lg-end">
              <a href="${pageContext.request.contextPath}/diy/diy_list" class="btn btn-primary text-uppercase">목록으로</a>
           </div>
           
   	   </div>
      </div>
    </div>
  </div>
</section>
    <!-- ====================================
    ——— FOOTER SECTION
    ===================================== -->
  
    <!-- ====================================
    ——— MODAL SECTION
    ===================================== -->
    <!-- Signup Modal -->
    <script>
	var isLoveAdded = ${isLoveAdded};
	var isButtonEnabled = true;
	
    document.getElementById('heartButton').addEventListener('click',function (){
    
    	var csrfHeaderName="${_csrf.headerName}";
        var csrfTokenValue="${_csrf.token}";
        
        $(document).ajaxSend(function(e, xhr) {
            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
         });
    
        isLoveAdded = !isLoveAdded;
	    
	    var heartIcon = document.getElementById('heartIcon');
	    
	    if (isLoveAdded) {
	 	   heartIcon.classList.remove('far', 'fa-heart');
	 	   heartIcon.classList.add('fas', 'fa-heart');
	 	   loveCheck_func();
	 	  
	    } else {
	 	   heartIcon.classList.remove('fas', 'fa-heart');
	 	   heartIcon.classList.add('far', 'fa-heart');
	 	   loveCancle_func();
	    }
	    
	    setTimeout(function () {
            isButtonEnabled = true;
        }, 6000);
	    
    });
	   
	   function loveCheck_func() {
	       var diyIdx = ${diyDetail.diyIdx};
	       var userinfoId = "${userinfo.id}";
	       
	        // 상태 토글

	       $.ajax({
	           url: "${pageContext.request.contextPath}/diy/loveCheck",
	           method: "POST",
	           data: {
	               'diyIdx': diyIdx
	               ,'userinfoId': userinfoId
	           },
	           success: function (response) {
	              isLoveAdded = true; // 찜이 추가되었으므로 상태를 true로 변경
	              // alert("좋아요 체크 성공!");
	              console.log("좋아요 체크 성공!");
	              updateHeartImage();
	              
	           },
	           error: function () {
	               console.error("좋아요 체크 실패");
	           }
	       });
	   }

	   // 좋아요 취소
	   function loveCancle_func() {
	       var loveIdx = document.getElementById("loveIdx").value
	       var userinfoId = "${userinfo.id}";
	       var diyIdx = ${diyDetail.diyIdx};
	       
	       $.ajax({
	           url: "${pageContext.request.contextPath}/diy/loveCancel", 
	           method: "POST",
	           data: {
	        	   'diyIdx': diyIdx
	        	   ,'loveIdx': loveIdx
	               ,'userinfoId': userinfoId
	           },
	           success: function (response) {
	        	   // alert("좋아요 취소 성공!");
	               console.log("좋아요 취소 성공!");
	               isLoveAdded = false; // 찜이 삭제되었으므로 상태를 false로 변경
	               updateHeartImage(); // 하트 이미지 업데이트
	           },
	           error: function () {
	               console.error("좋아요 취소 실패");
	           }
	       });
	   }
	   
	   // 하트 이미지 업데이트 함수
	   
	   
	   function updateHeartImage() {
		   
	       var heartIcon = document.getElementById('heartIcon');
	       
	       var loveCount = parseInt(heartIcon.textContent);
	       
	       if (isLoveAdded) {
	    	   isLoveAdded = true;
	    	   loveCount += 1;
	    	   heartIcon.classList.remove('far', 'fa-heart');
	    	   heartIcon.classList.add('fas', 'fa-heart');
	       } else {
	    	   isLoveAdded = false;
	    	   loveCount -= 1;
	    	   heartIcon.classList.remove('fas', 'fa-heart');
	    	   heartIcon.classList.add('far', 'fa-heart');
	       }
	       heartIcon.textContent = ' ' +loveCount;
	   }
	   </script>
		
	   <script>
	   // 비로그인 시 하트 클릭했을때 
		function Login() {
			 if (confirm("로그인 후 이용 가능합니다. 로그인하시겠습니까?")) {
			    	
			        window.location.href = "${pageContext.request.contextPath}/user/login"; 
			    } else {
			        
			    }
		}
		
		function deleteConfirm() {
		    if (confirm("정말로 삭제하시겠습니까?")) {
		    	
		        window.location.href = "${pageContext.request.contextPath}/diy/diy_delete/${diyDetail.diyIdx}"; 
		    } else {
		        
		    }
		}
	</script>

	<script>
    var HOME_PATH = window.HOME_PATH || '.';

    var cityhall = new naver.maps.LatLng(37.5666805, 126.9784147),
        map = new naver.maps.Map('map', {
            center: cityhall.destinationPoint(0, 500),
            zoom: 15
        }),
        marker = new naver.maps.Marker({
            map: map,
            position: cityhall
        });

    var contentString = [
            '<div class="iw_inner">',
            '   <h3>서울특별시청</h3>',
            '   <p>서울특별시 중구 태평로1가 31<br />',
            '       <a href="http://www.seoul.go.kr" target="_blank">www.seoul.go.kr/</a>',
            '   </p>',
            '</div>'
        ].join('');

    var infowindow = new naver.maps.InfoWindow({
        content: contentString,
        maxWidth: 200,
        maxHeight: 200,
        
    });

    naver.maps.Event.addListener(marker, "click", function(e) {
        if (infowindow.getMap()) {
            infowindow.close();
        } else {
            infowindow.open(map, marker);
        }
    });

    infowindow.open(map, marker);
	</script>
	
	
    
    <!-- Javascript -->
    
    <script src="${pageContext.request.contextPath}/assets/plugins/jquery/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/menuzord/js/menuzord.js"></script>
    
    <script src='${pageContext.request.contextPath}/assets/plugins/fancybox/jquery.fancybox.min.js'></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/lazyestload/lazyestload.js"></script>
    
    <script src='${pageContext.request.contextPath}/assets/plugins/selectric/jquery.selectric.min.js'></script>
    <script src='${pageContext.request.contextPath}/assets/plugins/daterangepicker/js/moment.min.js'></script>
    <script src='${pageContext.request.contextPath}/assets/plugins/daterangepicker/js/daterangepicker.min.js'></script>
    
    <script src="${pageContext.request.contextPath}/assets/plugins/smoothscroll/SmoothScroll.js"></script>
    
    <script src="${pageContext.request.contextPath}/assets/js/star.js"></script>
    
    <script src="${pageContext.request.contextPath}/assets/plugins/smoothscroll/SmoothScroll.js"></script>
    
    <script src="${pageContext.request.contextPath}/assets/js/star.js"></script>
  </body>
</html>