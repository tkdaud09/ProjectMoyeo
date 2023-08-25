<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="utf-8">
  

<body id="body" class="up-scroll">




  <div class="main-wrapper packages-grid">
<!-- ====================================
———	PAGE TITLE
===================================== -->
<section class="page-title">
  <div class="page-title-img bg-img bg-overlay-darken" style="background-image: url(${pageContext.request.contextPath}/assets/img/pages/page-title-bg6.jpg);">
    <div class="container">
      <div class="row align-items-center justify-content-center" style="height: 200px;">
        <div class="col-lg-6">
          <div class="page-title-content">
            <div class="title-border">
              <h2 class="text-uppercase text-white font-weight-bold">패키지 여행</h2>
            </div>
            <p class="text-white mb-0"></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>


<!-- ====================================
———	TOUR PACKAGES SECTION
===================================== -->


<section class="bg-smoke py-10">
  <div class="container">
   

    <div id="filters" class="button-group">
      <button class="button is-checked" data-filter="*">전체상품</button>
      <button class="button" data-filter=".alone">나홀로</button>
      <button class="button" data-filter=".child">아이와 함께</button>
      <button class="button" data-filter=".consideration">배려와 함께</button>
	  <button class="button" data-filter=".animal">동물과 함께</button>
	  <button class="button" data-filter=".couple">연인과 함께</button>
	  <button class="button" data-filter=".friend">친구과 함께</button>
    </div>


	<div class="row grid">
      <div class="col-md-6 col-lg-4 mb-5 element-item  animal">
        <div class="card card-hover">
          <a href="${pageContext.request.contextPath}/package/detail" class="position-relative">
            <img class="card-img-top lazyestload" data-src="${pageContext.request.contextPath}/assets/img/home/deal/deal-01.jpg" src="${pageContext.request.contextPath}/assets/img/home/deal/deal-01.jpg" alt="Card image cap">
            <div class="card-img-overlay card-hover-overlay rounded-top d-flex flex-column">
              <div class="badge bg-primary badge-rounded-circle">
                <span class="d-block">
                  50%<br>off
                </span>
              </div>
        
              <ul class="list-unstyled d-flex mt-auto text-warning mb-0">
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star" aria-hidden="true"></i>
                </li>
              </ul>
        
              <small>
                <ul class="list-unstyled d-flex text-white font-weight-bold mb-0">
                  <li class="border-right border-white pe-2">7 days</li>
                  <li class="border-right border-white px-2">15 hrs</li>
                  <li class="ps-2">15 min</li>
                </ul>
              </small>
            </div>
          </a>
        
          <div class="card-body px-4">
            <h5>
              <a href="single-package-right-sidebar.html" class="card-title text-uppercase">동물과 함께 투어 제목 공간</a>
            </h5>
            <p class="mb-5">Integer purus ex, dictum nec elementum eu, tristique vel lectus. Donec rutrum lectus et pharetra
              egestas.</p>
            <div class="d-flex justify-content-between align-items-center">
              <div>
                <p class="mb-0 text-capitalize">Start from</p>
                <h3 class="text-primary">$299</h3>
              </div>
              <div>
                <a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#inquiry" class="btn btn-xs btn-outline-secondary text-uppercase">Inquiry</a>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="col-md-6 col-lg-4 mb-5 element-item child">
        <div class="card card-hover">
          <a href="single-package-right-sidebar.html" class="position-relative">
            <img class="card-img-top lazyestload" data-src="${pageContext.request.contextPath}/assets/img/home/deal/deal-02.jpg" src="${pageContext.request.contextPath}/assets/img/home/deal/deal-02.jpg" alt="Card image cap">
            <div class="card-img-overlay card-hover-overlay rounded-top d-flex flex-column">
              <ul class="list-unstyled d-flex mt-auto text-warning mb-0">
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star" aria-hidden="true"></i>
                </li>
              </ul>
        
              <small>
                <ul class="list-unstyled d-flex text-white font-weight-bold mb-0">
                  <li class="border-right border-white pe-2">12 days</li>
                  <li class="border-right border-white px-2">3 hrs</li>
                  <li class="ps-2">12 min</li>
                </ul>
              </small>
            </div>
          </a>
        
          <div class="card-body px-4">
            <h5 class="">
              <a href="single-package-right-sidebar.html" class="card-title text-uppercase">Eros Erat Tour</a>
            </h5>
            <p class="mb-5">Proin convallis magna vel libero accumsan sollicitudin. Quisque dapibus vitae turpis eu magna
              sagittis.</p>
            <div class="d-flex justify-content-between align-items-center">
              <div>
                <p class="mb-0 text-capitalize">Start from</p>
                <h3 class="text-primary">$499</h3>
              </div>
              <div>
                <a href="booking-step-1.html" class="btn btn-xs btn-outline-secondary text-uppercase">Book now</a>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="col-md-6 col-lg-4 mb-5 element-item alone animal">
        <div class="card card-hover">
          <a href="single-package-right-sidebar.html" class="position-relative">
            <img class="card-img-top lazyestload" data-src="${pageContext.request.contextPath}/assets/img/home/deal/deal-03.jpg" src="${pageContext.request.contextPath}/assets/img/home/deal/deal-03.jpg" alt="Card image cap">
            <div class="card-img-overlay card-hover-overlay rounded-top d-flex flex-column">
              <ul class="list-unstyled d-flex mt-auto text-warning mb-0">
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star" aria-hidden="true"></i>
                </li>
              </ul>
        
              <small>
                <ul class="list-unstyled d-flex text-white font-weight-bold mb-0">
                  <li class="border-right border-white pe-2">17 days</li>
                  <li class="border-right border-white px-2">14 hrs</li>
                  <li class="ps-2">10 min</li>
                </ul>
              </small>
            </div>
          </a>
        
          <div class="card-body px-4">
            <h5>
              <a href="single-package-right-sidebar.html" class="card-title text-uppercase">Quisque Tour</a>
            </h5>
            <p class="mb-5">Vivamus eu mattis nibh. Quisque eget ipsum at odio fringilla consequat vel id erat. Suspendisse non
              feugiat mi.</p>
            <div class="d-flex justify-content-between align-items-center">
              <div>
                <p class="mb-0 text-capitalize">Start from</p>
                <h3 class="text-primary">$349</h3>
              </div>
              <div>
                <a href="single-package-fullwidth.html" class="btn btn-xs btn-outline-secondary text-uppercase">Details</a>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="col-md-6 col-lg-4 mb-5 element-item couple">
        <div class="card card-hover">
          <a href="single-package-right-sidebar.html" class="position-relative">
            <img class="card-img-top lazyestload" data-src="${pageContext.request.contextPath}/assets/img/packages/package-01.jpg" src="${pageContext.request.contextPath}/assets/img/packages/package-01.jpg" alt="Card image cap">
            <div class="card-img-overlay card-hover-overlay rounded-top d-flex flex-column">
              <ul class="list-unstyled d-flex mt-auto text-warning mb-0">
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star" aria-hidden="true"></i>
                </li>
              </ul>
        
              <small>
                <ul class="list-unstyled d-flex text-white font-weight-bold mb-0">
                  <li class="border-right border-white pe-2">25 days</li>
                  <li class="border-right border-white px-2">01 hrs</li>
                  <li class="ps-2">03 min</li>
                </ul>
              </small>
            </div>
          </a>
        
          <div class="card-body px-4">
            <h5 class="">
              <a href="single-package-right-sidebar.html" class="card-title text-uppercase">Blandit Tour</a>
            </h5>
        
            <p class="mb-5">Sagittis proin convallis magna vel libero accumsan sollicitudin. Quisque dapibus vitae turpis eu
              magna.</p>
        
            <div class="d-flex justify-content-between align-items-center">
              <div>
                <p class="mb-0 text-capitalize">Start from</p>
                <h3 class="text-primary">$199</h3>
              </div>
              <div>
                <a href="single-package-fullwidth.html" class="btn btn-xs btn-outline-secondary text-uppercase">Details</a>
                <a href="" class="btn btn-xs btn-outline-secondary px-3">
                  <i class="fas fa-map-marker-alt" aria-hidden="true"></i>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="col-md-6 col-lg-4 mb-5 element-item alone consideration">
        <div class="card card-hover">
          <a href="single-package-right-sidebar.html" class="position-relative">
            <img class="card-img-top lazyestload" data-src="${pageContext.request.contextPath}/assets/img/packages/package-02.jpg" src="${pageContext.request.contextPath}/assets/img/packages/package-02.jpg" alt="Card image cap">
            <div class="card-img-overlay card-hover-overlay rounded-top d-flex flex-column">
              <ul class="list-unstyled d-flex mt-auto text-warning mb-0">
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star" aria-hidden="true"></i>
                </li>
              </ul>
        
              <small>
                <ul class="list-unstyled d-flex text-white font-weight-bold mb-0">
                  <li class="border-right border-white pe-2">27 days</li>
                  <li class="border-right border-white px-2">05 hrs</li>
                  <li class="ps-2">33 min</li>
                </ul>
              </small>
            </div>
          </a>
        
          <div class="card-body px-4">
            <h5 class="">
              <a href="single-package-right-sidebar.html" class="card-title text-uppercase">Turpis Eu Tour</a>
            </h5>
        
            <p class="mb-5">Suspendisse non feugiat mi. Vivamus eu mattis nibh. Quisque eget ipsum at odio fringilla consequat
              vel id erat.</p>
        
            <div class="d-flex justify-content-between align-items-center">
              <div>
                <p class="mb-0 text-capitalize">Start from</p>
                <h3 class="text-primary">$249</h3>
              </div>
              <div>
                <a href="booking-step-1.html" class="btn btn-xs btn-outline-secondary text-uppercase">Book</a>
                <a href="" class="btn btn-xs btn-outline-secondary px-3">
                  <i class="fas fa-map-marker-alt" aria-hidden="true"></i>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="col-md-6 col-lg-4 mb-5 element-item couple">
        <div class="card card-hover">
          <a href="single-package-right-sidebar.html" class="position-relative">
            <img class="card-img-top lazyestload" data-src="${pageContext.request.contextPath}/assets/img/packages/package-03.jpg" src="${pageContext.request.contextPath}/assets/img/packages/package-03.jpg" alt="Card image cap">
            <div class="card-img-overlay card-hover-overlay rounded-top d-flex flex-column">
              <div class="badge bg-primary badge-rounded-circle">
                <span class="d-block">
                  50%<br>off
                </span>
              </div>
        
              <ul class="list-unstyled d-flex mt-auto text-warning mb-0">
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star" aria-hidden="true"></i>
                </li>
              </ul>
        
              <small>
                <ul class="list-unstyled d-flex text-white font-weight-bold mb-0">
                  <li class="border-right border-white pe-2">35 days</li>
                  <li class="border-right border-white px-2">11 hrs</li>
                  <li class="ps-2">03 min</li>
                </ul>
              </small>
            </div>
          </a>
        
          <div class="card-body px-4">
            <h5>
              <a href="single-package-right-sidebar.html" class="card-title text-uppercase">Pharetra Tour</a>
            </h5>
            <p class="mb-5">Donec rutrum lectus et pharetra egestas. Integer purus ex, dictum nec elementum eu, tristique vel
              lectus.</p>
        
            <div class="d-flex justify-content-between align-items-center">
              <div>
                <p class="mb-0 text-capitalize">Start from</p>
                <h3 class="text-primary">$149</h3>
              </div>
              <div>
                <a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#inquiry" class="btn btn-xs btn-outline-secondary text-uppercase">Inquiry</a>
                <a href="" class="btn btn-xs btn-outline-secondary px-3">
                  <i class="fas fa-map-marker-alt" aria-hidden="true"></i>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="col-md-6 col-lg-4 mb-5 mb-lg-0 element-item alone friend">
        <div class="card card-hover">
          <a href="single-package-right-sidebar.html" class="position-relative">
            <img class="card-img-top lazyestload" data-src="${pageContext.request.contextPath}/assets/img/packages/package-04.jpg" src="${pageContext.request.contextPath}/assets/img/packages/package-04.jpg" alt="Card image cap">
            <div class="card-img-overlay card-hover-overlay rounded-top d-flex flex-column">
              <ul class="list-unstyled d-flex mt-auto text-warning mb-0">
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star" aria-hidden="true"></i>
                </li>
              </ul>
        
              <small>
                <ul class="list-unstyled d-flex text-white font-weight-bold mb-0">
                  <li class="border-right border-white pe-2">07 days</li>
                  <li class="border-right border-white px-2">15 hrs</li>
                  <li class="ps-2">20 min</li>
                </ul>
              </small>
            </div>
          </a>
        
          <div class="card-body px-4">
            <h5 class="">
              <a href="single-package-right-sidebar.html" class="card-title text-uppercase">France / Europe</a>
            </h5>
        
            <p class="mb-5">Suspendisse non feugiat mi. Vivamus eu mattis nibh. Quisque eget ipsum at odio fringilla consequat vel id erat.</p>
        
            <div class="d-flex justify-content-between align-items-center">
              <div>
                <p class="mb-0 text-capitalize">Start from</p>
                <h3 class="text-primary">$150</h3>
              </div>
              <div>
                <a href="single-package-fullwidth.html" class="btn btn-xs btn-outline-secondary text-uppercase">Details</a>
                <a href="" class="btn btn-xs btn-outline-secondary px-3">
                  <i class="fas fa-map-marker-alt" aria-hidden="true"></i>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="col-md-6 col-lg-4 mb-5 mb-lg-0 element-item animal">
        <div class="card card-hover">
          <a href="single-package-right-sidebar.html" class="position-relative">
            <img class="card-img-top lazyestload" data-src="${pageContext.request.contextPath}/assets/img/packages/package-05.jpg" src="${pageContext.request.contextPath}/assets/img/packages/package-05.jpg" alt="Card image cap">
            <div class="card-img-overlay card-hover-overlay rounded-top d-flex flex-column">
              <div class="badge bg-primary badge-rounded-circle">
                <span class="d-block">
                  50%<br>off
                </span>
              </div>
        
              <ul class="list-unstyled d-flex mt-auto text-warning mb-0">
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star" aria-hidden="true"></i>
                </li>
              </ul>
        
              <small>
                <ul class="list-unstyled d-flex text-white font-weight-bold mb-0">
                  <li class="border-right border-white pe-2">07 days</li>
                  <li class="border-right border-white px-2">15 hrs</li>
                  <li class="ps-2">20 min</li>
                </ul>
              </small>
            </div>
          </a>
        
          <div class="card-body px-4">
            <h5 class="">
              <a href="single-package-right-sidebar.html" class="card-title text-uppercase"> Europe / France</a>
            </h5>
        
            <p class="mb-5">Suspendisse non feugiat mi. Vivamus eu mattis nibh. Quisque eget ipsum at odio fringilla consequat vel id erat.</p>
        
            <div class="d-flex justify-content-between align-items-center">
              <div>
                <p class="mb-0 text-capitalize">Start from</p>
                <h3 class="text-primary">$150</h3>
              </div>
              <div>
                <a href="single-package-fullwidth.html" class="btn btn-xs btn-outline-secondary text-uppercase">Details</a>
                <a href="" class="btn btn-xs btn-outline-secondary px-3">
                  <i class="fas fa-map-marker-alt" aria-hidden="true"></i>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="col-md-6 col-lg-4 element-item child friend">
        <div class="card card-hover">
          <a href="single-package-right-sidebar.html" class="position-relative">
            <img class="card-img-top lazyestload" data-src="${pageContext.request.contextPath}/assets/img/packages/package-06.jpg" src="${pageContext.request.contextPath}/assets/img/packages/package-06.jpg" alt="Card image cap">
            <div class="card-img-overlay card-hover-overlay rounded-top d-flex flex-column">
              <ul class="list-unstyled d-flex mt-auto text-warning mb-0">
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star" aria-hidden="true"></i>
                </li>
              </ul>
        
              <small>
                <ul class="list-unstyled d-flex text-white font-weight-bold mb-0">
                  <li class="border-right border-white pe-2">07 days</li>
                  <li class="border-right border-white px-2">15 hrs</li>
                  <li class="ps-2">20 min</li>
                </ul>
              </small>
            </div>
          </a>
        
          <div class="card-body px-4">
            <h5 class="">
              <a href="single-package-right-sidebar.html" class="card-title text-uppercase"> Europe / France</a>
            </h5>
        
            <p class="mb-5">Suspendisse non feugiat mi. Vivamus eu mattis nibh. Quisque eget ipsum at odio fringilla consequat vel id erat.</p>
        
            <div class="d-flex justify-content-between align-items-center">
              <div>
                <p class="mb-0 text-capitalize">Start from</p>
                <h3 class="text-primary">$150</h3>
              </div>
              <div>
                <a href="single-package-fullwidth.html" class="btn btn-xs btn-outline-secondary text-uppercase">Details</a>
                <a href="" class="btn btn-xs btn-outline-secondary px-3">
                  <i class="fas fa-map-marker-alt" aria-hidden="true"></i>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>	





</section>




<!-- element wrapper ends -->

  

    <!-- Javascript
    <script src="assets/plugins/jquery/jquery-3.4.1.min.js"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/plugins/menuzord/js/menuzord.js"></script>

    <script src='assets/plugins/fancybox/jquery.fancybox.min.js'></script>

    <script src="assets/plugins/lazyestload/lazyestload.js"></script>
   
    <script src="assets/plugins/smoothscroll/SmoothScroll.js"></script>
    
    <script src="assets/js/star.js"></script>
 -->


	<!--메인 자바스크립트-->
	 <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/plugins/jquery/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/menuzord/js/menuzord.js"></script>
    
    <script src='${pageContext.request.contextPath}/assets/plugins/isotope/isotope.min.js'></script>
    <script src='${pageContext.request.contextPath}/assets/plugins/images-loaded/js/imagesloaded.pkgd.min.js'></script>
    <script src='${pageContext.request.contextPath}/assets/plugins/fancybox/jquery.fancybox.min.js'></script>
    
    <script src='${pageContext.request.contextPath}/assets/plugins/selectric/jquery.selectric.min.js'></script>
    <script src='${pageContext.request.contextPath}/assets/plugins/daterangepicker/js/moment.min.js'></script>
    <script src='${pageContext.request.contextPath}/assets/plugins/daterangepicker/js/daterangepicker.min.js'></script>
    
    <script src="${pageContext.request.contextPath}/assets/plugins/lazyestload/lazyestload.js"></script>
    <script src='${pageContext.request.contextPath}/assets/plugins/dzsparallaxer/dzsparallaxer.js'></script>
    
    
    
    
    
    <script src='${pageContext.request.contextPath}/assets/plugins/revolution/js/jquery.themepunch.tools.min.js'></script>
    <script src='${pageContext.request.contextPath}/assets/plugins/revolution/js/jquery.themepunch.revolution.min.js'></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/smoothscroll/SmoothScroll.js"></script>
    
    <script src="${pageContext.request.contextPath}/assets/js/star.js"></script>
  </body>
</html>

