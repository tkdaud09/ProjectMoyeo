<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="utf-8">
  
  <head>
<jsp:include page="/WEB-INF/views/inc/head.jsp"/>

  </head>     

<body id="body" class="up-scroll">

  <!-- ====================================
  ——— HEADER
  ===================================== -->
<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
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
              <h2 class="text-uppercase text-white font-weight-bold">DIY 작성 페이</h2>
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
    <div class="mb-8">
      <div class="row progress-wizard">
        <div class="col-4 progress-wizard-step active">
          <div class="progress">
            <div class="progress-bar"></div>
          </div>
          <a href="${pageContext.request.contextPath}/javascript:void(0)" class="progress-wizard-dot">
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
      
          <a href="diy_list" class="progress-wizard-dot">
            <div class="progress-wizard-content">
              <i class="fas fa-dollar-sign" aria-hidden="true"></i>
              <span class="d-block">2. Payment info</span>
            </div>
          </a>
        </div>
      
        <div class="col-4 progress-wizard-step incomplete">
          <div class="progress">
            <div class="progress-bar"></div>
          </div>
      
          <a href="booking-step-3.html" class="progress-wizard-dot">
            <div class="progress-wizard-content">
              <i class="fa fa-check" aria-hidden="true"></i>
              <span class="d-block">3. Confirmation</span>
            </div>
          </a>
        </div>
       </div>
        </div>
    
    <div class="row">
      <div class="col-md-7 col-lg-8 order-1 order-md-0">
        <h3 class="text-capitalize mb-5">personal info</h3>


        <form action="/moyeo/diy/diy_add" method="post" target="_blank">
     	   <div class="row">
              <div class="col-lg-6">
                <label for="exampleInputText">출발일</label>
                <div class="form-group form-group-icon form-group-icon-default">
                  <i class="far fa-calendar-alt" aria-hidden="true"></i>
                  <input type="text" class="form-control border-0 bg-smoke" name="dateRange" value="" placeholder="DD/MM/YYYY">
                </div>
                </div>
    
    
             <div class="col-lg-6">
                <label for="exampleInputText">도착일</label>
                <div class="form-group form-group-icon form-group-icon-default">
                  <i class="far fa-calendar-alt" aria-hidden="true"></i>
                  <input type="text" class="form-control border-0 bg-smoke" name="dateRange" value="" placeholder="DD/MM/YYYY">
                </div>
              </div>
        

    
            <div class="col-lg-6">
              <div class="form-group">
                <label for="inputName">인원</label>
                <input type="text" class="form-control border-0 bg-smoke" placeholder="ex) 3">
              </div>
            </div>
    
            <div class="col-lg-6">
              <div class="form-group">
                <label for="inputName">지역</label>
                <input type="text" class="form-control border-0 bg-smoke" placeholder="ex) 서울">
              </div>
            </div>
    
            <div class="col-lg-6">
              <div class="form-group">
                <label for="inputName">비용</label>
                <input type="text" class="form-control border-0 bg-smoke" placeholder="ex) 10">
              </div>
            </div>
    
            <div class="col-lg-6">
              <div class="form-group">
                <label for="inputName">등록일(위치옮기)</label>
                <input type="text" class="form-control border-0 bg-smoke" placeholder="빈칸">
              </div>
            </div>
    
            <div class="col-lg-6">
              <div class="form-group">
                <label for="inputName">제목</label>
                <input type="text" class="form-control border-0 bg-smoke" placeholder="ex) 제목">
              </div>
            </div>
           </div>
    
            <div class="form-group mb-5">
            <label for="exampleFormControlTextarea1">DIY 내용1</label>
            <textarea class="form-control border-0 bg-smoke" rows="7"></textarea>
          </div>
            
           <div class="form-group mb-5">
            <label for="exampleFormControlTextarea1">DIY 내용2</label>
            <textarea class="form-control border-0 bg-smoke" rows="7"></textarea>
          </div>
            
           <div class="form-group mb-5">
            <label for="exampleFormControlTextarea1">DIY 내용3</label>
            <textarea class="form-control border-0 bg-smoke" rows="7"></textarea>
          </div>
            
			<div class="form-group mb-5">
            <label for="exampleFormControlTextarea1">DIY 내용4</label>
            <textarea class="form-control border-0 bg-smoke" rows="7"></textarea>
          </div>
          
          <div class="form-group mb-5">
            <label for="exampleFormControlTextarea1">DIY 내용5</label>
            <textarea class="form-control border-0 bg-smoke" rows="7"></textarea>
          </div>
            

    
          
    
          <div class="form-group form-check mb-9">
            <input type="checkbox" class="form-check-input" id="exampleCheck1">
            <label class="form-check-label" for="exampleCheck1">졸리
          <a href="다"></a>
            </label>
          </div>
    
          <div class="text-center text-md-start text-lg-end">
            <button type="submit" class="btn btn-primary text-uppercase" id="enrollBtn">
              작성
            </button>
          </div>
        </form>
      </div>
    
      <div class="col-md-5 col-lg-4">
        <h3 class="mb-5">DIY.........;;</h3>
        <div class="card bg-smoke mb-6 mb-md-0">
          <img class="card-img-top lazyestload" data-src="${pageContext.request.contextPath}/assets/img/booking/booking.jpg" src="${pageContext.request.contextPath}/assets/img/booking/booking.jpg" alt="Card image cap">
          <div class="card-body">
            <h6 class="card-title text-dark">Maldives Tour</h6>

            <ul class="list-group list-group-flush">
              <li class="list-group-item bg-transparent border-top-0 px-0 py-4">
                <span><i class="far fa-calendar-alt me-1" aria-hidden="true"></i>From:</span>
                <span class="text-gray-color">25 Mar, 2019</span>
              </li>
            
              <li class="list-group-item bg-transparent px-0 py-4 border-off-white">
                <span><i class="far fa-calendar-alt me-1" aria-hidden="true"></i>To:</span>
                <span class="text-gray-color">28 Mar, 2019</span>
              </li>

              <li class="list-group-item bg-transparent px-0 py-4 border-off-white">
                <span><i class="fa fa-user me-1" aria-hidden="true"></i>Guests:</span>
                <span class="text-gray-color">2 Adults, 1Child</span>
              </li>

              <li class="list-group-item bg-transparent px-0 py-4 d-none"></li>
            </ul>
          </div>

          <div class="card-footer mt-6">
            <h2 class="mb-0">
              <span>Total:</span>
              <span class="text-primary font-weight-bold">$6,500</span>
            </h2>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>



  </div><!-- element wrapper ends -->

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
    
    
    <script>
    let enrollForm = $("#diy_form");

    /* 상품 등록 버튼 */
    $("#enrollBtn").on("click", function(e){
        e.preventDefault();
        diy_add.submit();
    });
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