<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="utf-8">
  
  <head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  </head>     

<body id="body" class="up-scroll">

  <!-- ====================================
  ——— HEADER
  ===================================== -->
  <div class="main-wrapper booking-step-1">


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
              <h2 class="text-uppercase text-white font-weight-bold">DIY 작성 페이지</h2>
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
<section class="py-8 py-md-10">
  <div class="container">
    <div class="mb-8"></div>
      <div class="row progress-wizard">
      
        <div class="col-4 progress-wizard-step active">
          <div class="progress">
            <div class="progress-bar"></div>
          </div>
          <a href="${pageContext.request.contextPath}/moyeo/diy/diy_add" class="progress-wizard-dot">
            <div class="progress-wizard-content">
              <i class="fa fa-user" aria-hidden="true"></i>
              <span class="d-block">1. DIY 글 작성 페이지</span>
            </div>
          </a>
        </div>
      
        <div class="col-4 progress-wizard-step incomplete">
          <div class="progress">
            <div class="progress-bar"></div>
          </div>
      
          <a href="${pageContext.request.contextPath}/moyeo/diy/diy_detail" class="progress-wizard-dot">
            <div class="progress-wizard-content">
              <i class="fas fa-dollar-sign" aria-hidden="true"></i>
              <span class="d-block">2. 리스트</span>
            </div>
          </a>
        </div>
        
       </div>
      </div>
    
    
    <div class="row">
      <div class="col-md-7 col-lg-8 order-1 order-md-0">
        <h3 class="text-capitalize mb-5">personal info</h3>


        <form action="diy_update" id="diy_update" method="get" enctype="multipart/form-data">
     	   <div class="row">
     	   
     	   
              <div class="col-lg-6">
                <label for="diyStartdate">출발일</label>
                <div class="form-group form-group-icon form-group-icon-default">
                  <i class="far fa-calendar-alt" aria-hidden="true"></i>
                </div>
                  <input type="text" class="form-control border-0 bg-smoke" id="diyStartdate" name="dateRange" value="${diyModify.diyStartdate }">
                </div>
                
  	  
    
             <div class="col-lg-6">
                <label for="diyEnddate">도착일</label>
                <div class="form-group form-group-icon form-group-icon-default">
                  <i class="far fa-calendar-alt" aria-hidden="true"></i>
                  <input type="text" class="form-control border-0 bg-smoke" id="diyEnddate" name="dateRange" value="${diyModify.diyEnddate }">
                </div>
              </div>
        

    
            <div class="col-lg-6">
              <div class="form-group">
                <label for="diyPeople">인원</label>
                <input type="text" class="form-control border-0 bg-smoke" id="diyPeople" name="diyPeople" value="${diyModify.diyPeople }">
              </div>
            </div>
    
            <div class="col-lg-6">
              <div class="form-group">
                <label for="diyLoc">지역</label>
                <input type="text" class="form-control border-0 bg-smoke" id="diyLoc" name="diyLoc" value="${diyModify.diyLoc }">
              </div>
            </div>
    
            <div class="col-lg-6">
              <div class="form-group">
                <label for="diyPrice">비용</label>
                <input type="text" class="form-control border-0 bg-smoke" id="diyPrice" name="diyPrice" value="${diyModify.diyPrice }">
              </div>
            </div>
            
          <div class="form-group mb-5">
    		<label for="diyThumbnailimage">썸네일 올리기</label>
    		<input type="file" class="btn btn-xs btn-outline-secondary text-uppercase" id="diyThumbnail" name="diyThumbnailFile" data-src="${pageContext.request.contextPath}/assets/img/upload/${diyModify.diyThumbnail}" src="${pageContext.request.contextPath}/assets/img/upload/${diyModify.diyThumbnail}" alt="image">
    		<div id="diyThumbnail"  style="height: 25px;line-height: 15px;margin-left: 200px;"></div>
		  </div>
    
          
            <div class="col-lg-6">
              <div class="form-group">
                <label for="diyTitle">제목</label>
                <input type="text" class="form-control border-0 bg-smoke" id="diyTitle" name="diyTitle" value="${diyModify.diyTitle }">
              </div>
            </div>
           
           
           <!-- 다른것도 태그바꾸기 -->
           <div class="col-lg-6">
              <div class="form-group">
                <label for="diyIntrodution">간단한 소개글</label>
                <p class="form-control border-0 bg-smoke" id="diyIntrodution">${diyModify.diyIntroduction }</p>
              </div>
            </div>
           
				<!-- day 1 사진 -->          
          <div class="form-group mb-5">
    		<label for="imgUpload">DAY 1 사진올리기</label>
    		<input type="file" class="btn btn-xs btn-outline-secondary text-uppercase" id="diyContent1Img" name="diyContent1ImgFile" data-src="${pageContext.request.contextPath}/assets/img/upload/${diyModify.diyContent1Img}" src="${pageContext.request.contextPath}/assets/img/upload/${diyModify.diyContent1Img}" alt="Day 1 img">
    		<div id="" style="height: 25px;line-height: 15px;margin-left: 200px;"></div>
		  </div>
            
		 	
          <div class="form-group mb-5" id="day1Block">
            <label for="diyContent1">DAY 1</label>
            <textarea class="form-control border-0 bg-smoke" id="diyContent1" rows="7">${diyModify.diyContent1 }</textarea>
          </div>
				
          <div class="form-group mb-5">
    		<label for="imgUpload">DAY 2 사진올리기</label>
    		<div id=""  style="height: 25px;line-height: 15px;margin-left: 200px;"></div>
    		<input type="file" class="btn btn-xs btn-outline-secondary text-uppercase" id="diyContent2Img" name="diyContent2ImgFile" data-src="${pageContext.request.contextPath}/assets/img/upload/${diyModify.diyContent2Img}" src="${pageContext.request.contextPath}/assets/img/upload/${diyModify.diyContent2Img}" alt="Day 2 img">
		  </div>
            
           <div class="form-group mb-5">
            <label for="diyContent2">DAY 2</label>
            <textarea class="form-control border-0 bg-smoke" id="diyContent2" rows="7">${diyModify.diyContent2 }</textarea>
          </div>
          
 		  <div class="form-group mb-5">
    		<label for="imgUpload">DAY 3 사진올리기</label>
    		<div id=""  style="height: 25px;line-height: 15px;margin-left: 200px;"></div>
    		<input type="file" class="btn btn-xs btn-outline-secondary text-uppercase" id="diyContent3Img" name="diyContent3ImgFile" data-src="${pageContext.request.contextPath}/assets/img/upload/${diyModify.diyContent3Img}" src="${pageContext.request.contextPath}/assets/img/upload/${diyModify.diyContent3Img}" alt="Day 3 img">
		  </div>
            
          <div class="form-group mb-5">
            <label for="diyContent3">DAY 3</label>
            <textarea class="form-control border-0 bg-smoke" id="diyContent3" rows="7">${diyModify.diyContent3 }</textarea>
          </div>
          
          <div class="form-group mb-5">
    		<label for="imgUpload">DAY 4 사진올리기</label>
    		<div id=""  style="height: 25px;line-height: 15px;margin-left: 200px;"></div>
    		<input type="file" class="btn btn-xs btn-outline-secondary text-uppercase" id="diyContent4Img" name="diyContent4ImgFile" data-src="${pageContext.request.contextPath}/assets/img/upload/${diyDetail.diyContent4Img}" src="${pageContext.request.contextPath}/assets/img/upload/${diyList.diyContent4Img}" alt="Day 4 img">
		  </div>
          
		  <div class="form-group mb-5">
            <label for="diyContent4">DAY 4</label>
            <textarea class="form-control border-0 bg-smoke" id="diyContent4" rows="7">${diyModify.diyContent4 }</textarea>
          </div>
		  
		  
		  <!--  추가 버튼 글 + 사진 스크립트 작성 -->
    
           <div class="text-center text-md-start text-lg-end">
            <button type="submit" class="btn btn-primary text-uppercase" id="enrollBtn">
              수정하기
            </button>
           </div>
          </div>
          
          
         </form>
      </div>
    </div>
</section>

    <!-- ====================================
    ——— FOOTER SECTION
    ===================================== -->
    <jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
  
    <!-- ====================================
    ——— MODAL SECTION
    ===================================== -->
    <!-- Signup Modal -->
    <div class="modal fade" id="signup" tabindex="-1" role="dialog" aria-label="signupModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header rounded">
            <h3 class="modal-title text-uppercase font-weight-bold">Create your account</h3>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>

          <div class="modal-body">
            <form class="" action="index.html" method="get">
              <div class="mb-3">
                <input type="text" class="form-control bg-smoke" required="" placeholder="Full Name">
              </div>

              <div class="mb-3">
                <input type="email" class="form-control bg-smoke" required="" placeholder="Email">
              </div>
    
              <div class="mb-3">
                <input type="password" class="form-control bg-smoke" required="" placeholder="Password">
              </div>
    
              <div class="mb-3 form-check mb-0">
                <input type="checkbox" class="form-check-input" id="exampleCheck4">
                <label class="form-check-label text-gray-color mb-3" for="exampleCheck4">
                  I agree to the terms of use and privacy.
                </label>
              </div>

              <div class="d-grid">
                <button type="submit" class="btn btn-primary btn-block text-uppercase">Login</button>
              </div>

              <div class="text-uppercase text-center py-3">Or</div>

              <div class="d-grid">
                <button type="submit" class="btn btn-facebook btn-block text-uppercase text-white">Login with facebook</button>
              </div>
            </form>
          </div>
    
          <div class="modal-footer justify-content-center">
            <p class="mb-1">Don’t have an Account? <a href="javascript:void(0)">Sign up</a></p>
          </div>
        </div>
      </div>
    </div>

    <!-- Login Modal -->
    <div class="modal fade" id="login" tabindex="-1" role="dialog" aria-label="loginModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header rounded">
            <h3 class="modal-title text-uppercase font-weight-bold">Log in to your account</h3>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>

          <div class="modal-body">
            <form class="" action="index.html" method="get">
              <div class="mb-3">
                <input type="email" class="form-control bg-smoke" required="" placeholder="Email">
              </div>

              <div class="mb-3">
                <input type="password" class="form-control bg-smoke" required="" placeholder="Password">
              </div>

              <div class="mb-3 form-check mb-0">
                <input type="checkbox" class="form-check-input" id="exampleCheck5">
                <label class="form-check-label text-gray-color mb-3" for="exampleCheck5">
                  Remember me
                </label>
                <a class="pull-right" href="javascript:void(0)">Fogot Password?</a>
             </div>

             <div class="d-grid">
              <button type="submit" class="btn btn-primary text-uppercase">Login</button>
             </div>

              <div class="text-uppercase text-center py-3">Or</div>

              <div class="d-grid">
                <button type="submit" class="btn btn-facebook text-uppercase text-white">Login with facebook</button>
               </div>
            </form>
          </div>

          <div class="modal-footer justify-content-center">
            <p class="mb-1">Don’t have an Account? <a href="javascript:void(0)">Sign up</a></p>
          </div>
        </div>
      </div>
    </div>

    <!-- INQUIRY IN MODAL -->
    <div class="modal fade" id="inquiry" tabindex="-1" role="dialog" aria-label="inquiryModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header rounded">
            <h3 class="modal-title text-uppercase font-weight-bold">Inquiry about tour</h3>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>

          <div class="modal-body pb-3">
            <form class="" action="index.html" method="get">
              <div class="mb-3">
                <input type="text" class="form-control bg-smoke" required="" placeholder="Your Name">
              </div>

              <div class="mb-3">
                <input type="email" class="form-control bg-smoke" required="" placeholder="Your Email">
              </div>
    
              <div class="mb-3">
                <input type="number" class="form-control bg-smoke" required="" placeholder="Phone Number">
              </div>

              <div class="mb-3">
                <textarea class="form-control bg-smoke" rows="6" placeholder="Message"></textarea>
              </div>
    
              <button type="submit" class="btn btn-primary text-uppercase">Submit</button>
            </form>
          </div>
        </div>
      </div>
    </div>
    

    
    
	<script type="text/javascript">
	
	function submitCheck() {
		if(dateRange.value=="") {
			alert("날짜를 입력해주세요.");
			return;
		}
		
		var noReg=/\d{2}/g;
		if(!noReg.test(diyPeople.value)) {
			alert("인원은 숫자로만 입력해주세요.");
			diyPeople.focus();
			return;
		}
		
		if(diyLoc.value=="") {
			alert("지역을 입력해 주세요.");
			diyLoc.focus();
			return;
		}
		
		var noReg=/\d{9}/g;
		if(diyPrice.value=="") {
			alert("비용은 숫자로만 입력해주세요.");
			diyPrice.focus();
			return;
		}
		
		if(diyTitle.value=="") {
			alert("제목을 입력해 주세요.");
			diyTitle.focus();
			return;
		}

		if(diyIntroduction.value=="") {
			alert("소개글을 입력해 주세요.");
			diyIntroduction.focus();
			return;
		}
		
		if(diyContent1.value=="") {
			alert("내용을 입력해 주세요.");
			diyContent1.focus();
			return;
		}

		studentForm.submit();
	} 
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