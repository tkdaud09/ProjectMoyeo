<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="utf-8">
  
  <head>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=e3oa0wasfu"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

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
<section class="py-10">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <h3 class="text-capitalize mb-5">personal info</h3>
     	   <div class="row">
     	   
     	   <!-- 전체 input 태그 바꾸기 -->
     	   	  <div class="form-group row">
	            <label for="userinfoId" class="col-sm-2 col-form-label">아이디</label>
	            <div class="col-sm-10">
	              <input type="text" readonly class="form-control-plaintext" id="userinfoId" value="${diyDetail.userinfoId }" readonly>
	            </div>
	            <div style="display:none">
         		  <input type="text" name="diyIdx" value="${diyDetail.diyIdx}">
	            </div>
	          </div>
  
            <div class="col-lg-6">
              <div class="form-group">
                <label for="diyTitle">제목</label>
                <input type="text" class="form-control border-0 bg-smoke" id="diyTitle" name="diyTitle" value="${diyDetail.diyTitle }" readonly>
              </div>
            </div>
     	   
     	   <!-- 작성버튼 없애기, 아이디가같으면 수정버튼 생성 -> modify로 이동, 다 수정할 수 없게 만들기 /작성일, 수정일 보여지기 -->
              <div class="col-lg-6">
                <label for="diyStartdate">출발일</label>
                <div class="form-group form-group-icon form-group-icon-default">
                  <i class="far fa-calendar-alt" aria-hidden="true"></i>
                </div>
                  <input type="text" class="form-control border-0 bg-smoke" id="diyStartdate" value="${diyDetail.diyStartdate }" readonly>
                </div>
                
  	  
    
             <div class="col-lg-6">
                <label for="diyEnddate">도착일</label>
                <div class="form-group form-group-icon form-group-icon-default">
                  <i class="far fa-calendar-alt" aria-hidden="true"></i>
                  <input type="text" class="form-control border-0 bg-smoke" id="diyEnddate" value="${diyDetail.diyEnddate }" readonly>
                </div>
              </div>
        

    
            <div class="col-lg-6">
              <div class="form-group">
                <label for="diyPeople">인원</label>
                <input type="text" class="form-control border-0 bg-smoke" id="diyPeople" name="diyPeople" value="${diyDetail.diyPeople }" readonly>
              </div>
            </div>
    
            <div class="col-lg-6">
              <div class="form-group">
                <label for="diyLoc">지역</label>
                <input type="text" class="form-control border-0 bg-smoke" id="diyLoc" name="diyLoc" value="${diyDetail.diyLoc }" readonly>
              </div>
            </div>
    
            <div class="col-lg-6">
              <div class="form-group">
                <label for="diyPrice">비용</label>
                <input type="text" class="form-control border-0 bg-smoke" id="diyPrice" name="diyPrice" value="${diyDetail.diyPrice }" readonly>
              </div>
            </div>
    
          
           
           
             <!-- 다른것도 태그바꾸기 -->
          <div class="col-lg-6">
            <div class="form-group">
              <label for="diyIntrodution">간단한 소개글</label>
              <textarea class="form-control border-0 bg-smoke" id="diyIntrodution" rows="5" readonly>${diyDetail.diyIntroduction }</textarea>
            </div>
          </div>
           
           <!-- 지도 -->
           <div id="map" style="width:80%; height:500px;"></div>
           
				<!-- day 1 사진 -->
		  <div class="position-relative">	          
	        <img class="card-img-top rounded lazyestload" id="diyContent1Img" data-src="${pageContext.request.contextPath}/assets/img/upload/${diyDetail.diyContent1Img}" src="${pageContext.request.contextPath}/assets/img/upload/${diyList.diyContent1Img}" alt="Day 1 img">
	        <div class="card-img-overlay card-hover-overlay rounded"></div>
          </div>
		 	
          <div class="form-group mb-5">
            <label for="diyContent1">DAY 1</label>
            <textarea class="form-control border-0 bg-smoke" id="diyContent1" rows="10" readonly>${diyDetail.diyContent1 }</textarea>
          </div>
				
          		<!-- day 2 사진 -->
          <div class="position-relative">
	        <img class="card-img-top rounded lazyestload" id="diyContent2Img" data-src="${pageContext.request.contextPath}/assets/img/upload/${diyDetail.diyContent2Img}" src="${pageContext.request.contextPath}/assets/img/upload/${diyList.diyContent2Img}" alt="Day 2 img">
	        <div class="card-img-overlay card-hover-overlay rounded"></div>
	      </div>
            
          <div class="form-group mb-5">
            <label for="diyContent2">DAY 2</label>
            <textarea class="form-control border-0 bg-smoke" id="diyContent2" rows="10" readonly>${diyDetail.diyContent2 }</textarea>
          </div>
          
         	 	<!-- day 3 사진 -->
          <div class="position-relative">
	        <img class="card-img-top rounded lazyestload" id="diyContent3Img" data-src="${pageContext.request.contextPath}/assets/img/upload/${diyDetail.diyContent3Img}" src="${pageContext.request.contextPath}/assets/img/upload/${diyList.diyContent3Img}" alt="Day 3 img">
	        <div class="card-img-overlay card-hover-overlay rounded"></div>
	      </div>
            
          <div class="form-group mb-5">
            <label for="diyContent3">DAY 3</label>
            <textarea class="form-control border-0 bg-smoke" id="diyContent3" rows="10" readonly>${diyDetail.diyContent3 }</textarea>
          </div>
          
             	<!-- day 4 사진 -->
          <div class="position-relative">
            <img class="card-img-top rounded lazyestload" id="diyContent4Img" data-src="${pageContext.request.contextPath}/assets/img/upload/${diyDetail.diyContent4Img}" src="${pageContext.request.contextPath}/assets/img/upload/${diyList.diyContent4Img}" alt="Day 4 img">
            <div class="card-img-overlay card-hover-overlay rounded"></div>
          </div>
           
		  <div class="form-group mb-5">
            <label for="diyContent4">DAY 4</label>
            <textarea class="form-control border-0 bg-smoke" id="diyContent4" rows="10" readonly>${diyDetail.diyContent4 }</textarea>
          </div>
          
          <!-- 추가한 내용이 있으면 출력해준다. -->
          <%-- <c:if test="${diyDetail.diyContent5Img ne null}">
          <div class="position-relative">
            <img class="card-img-top rounded lazyestload" id="diyContent5Img" data-src="${pageContext.request.contextPath}/assets/img/upload/${diyDetail.diyContent5Img}" src="${pageContext.request.contextPath}/assets/img/upload/${diyList.diyContent5Img}" alt="Day 5 img">
            <div class="card-img-overlay card-hover-overlay rounded"></div>
          </div>
          </c:if>
          
          <c:if test="${diyDetail.diyContent5 ne null}">
          <div class="form-group mb-5">
            <label for="diyContent4">DAY 5</label>
            <textarea class="form-control border-0 bg-smoke" id="diyContent5" rows="10" readonly>${diyDetail.diyContent5 }</textarea>
          </div>
          </c:if> --%>
          
          <!-- 로그인 정보가 일치하는 사람만 버튼 활성화 -->
          <c:if test="${userinfo.id eq diyDetail.userinfoId }">
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