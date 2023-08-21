<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="utf-8">
  
  <head>

    <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>모두의여행, 모여!</title>

    <!-- Plugins css Style -->
    <link href='assets/plugins/fontawesome-5.15.2/css/all.min.css' rel='stylesheet'>
    <link href='assets/plugins/fontawesome-5.15.2/css/fontawesome.min.css' rel='stylesheet'>
    <link href="assets/plugins/animate/animate.css" rel="stylesheet">
    <link href="assets/plugins/menuzord/css/menuzord.css" rel="stylesheet">
    <link href="assets/plugins/menuzord/css/menuzord-animations.css" rel="stylesheet">

    
    <link href='assets/plugins/fancybox/jquery.fancybox.min.css' rel='stylesheet'>

	<!-- 베이스css-->
	<link href='assets/plugins/ria/css/base.css' rel='stylesheet'>
    

    
    

    <!-- GOOGLE FONT -->
    <link href='https://fonts.googleapis.com/css?family=Montserrat:400,500,600,700' rel='stylesheet'>

    <!-- CUSTOM CSS -->
    <link href="assets/css/star.css" id="option_style" rel="stylesheet">


    <!-- FAVICON -->
    <link rel="shortcut icon" type="image/png" href="assets/img/favicon.png"/>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

  </head>     

<body id="body" class="up-scroll">

  <!-- ====================================
  ——— HEADER
  ===================================== -->
  <header class="header" id="pageTop">
	
	   <!-- Top Bar -->
<div class="top-bar d-none d-md-block">
  <div class="container">
    <div class="row justify-content-between">
      <div class="col-7">
        <!-- <ul class="list-inline d-flex mb-0">
          <li class="me-6">
            <a href="tel:88 123 4561 5523" class="media d-inline-flex align-items-center">
              <i class="fas fa-phone-alt me-2"></i>
              <div class="media-body">
                Call: 123 4561 5523
              </div>
            </a>
          </li>

          <li>
            <a href="mailTo:info@startravel.com" class="media d-inline-flex align-items-center">
              <i class="fa fa-envelope me-2"></i>
              <div class="media-body">
                Email: info@startravel.com
              </div>
            </a>
          </li>
        </ul> -->
      </div>

      <div class="col-5">
        <ul class="list-inline d-flex justify-content-end mb-0">

          <li class="me-6">
            <a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#login" class="media d-inline-flex align-items-center">
              <!-- <i class="fa fa-user me-2"></i> -->
              <div class="media-body">
                로그인
              </div>
            </a>
          </li>

		  <li class="me-6">
            <a href="javascript:void(0)" data-bs-toggle="" data-bs-target="" class="media d-inline-flex align-items-center">
              <!-- <i class="fa fa-user me-2"></i> -->
              <div class="media-body">
                회원가입
              </div>
            </a>
          </li>

		   <li class="me-6">
            <a href="javascript:void(0)" data-bs-toggle="" data-bs-target="" class="media d-inline-flex align-items-center">
              <div class="media-body">
                고객센터
              </div>
            </a>
          </li>

          <li class="">
            <div class="search-item">
              <a href="javascript:void(0)" class="btn-search">
                <div class="search-icon">
                  <i class="fa fa-search"></i>
                </div>

                <div class="close-icon d-none">
                  <i class="fas fa-times"></i>
                </div>
              </a>

              <div class="search-box">
                <form class="mb-0" action="index.html" method="post">
                  <div class="input-group input-group-sm">
                    <input type="text" class="form-control form-control-sm rounded-0" required="" placeholder="검색어를 입력하세요" aria-label="검색어를 입력하세요">
                    <button class="btn bg-primary border-0 rounded-0" type="submit">
                      <span class="text-white text-uppercase font-weight-bold">검색</span>
                    </button>
                  </div>
                </form>
              </div>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </div>
</div>






    <!-- Menu Zord -->
    <nav class="nav-menuzord navbar-sticky">
      <div class="container clearfix">
        <div id="menuzord" class="menuzord">
          <a href="index.html" class="menuzord-brand">
            <img class="lazyestload" data-src="assets/img/logo-color-big.png" src="assets/img/logo-color-big.png" alt="logo-img">
          </a>

          <!-- <div class="nav-item dropdown nav-item-left me-0">
            <button class="btn btn-xs btn-primary d-none d-lg-inline-block notify-toggler">
              <i class="fa fa-search text-white me-0" aria-hidden="true"></i>
            </button>
          
            <div class="dropdown-menu dropdown-menu-end dropdown-notify rounded-0">
              <form class="mb-0" action="index.html" method="post">
                <div class="input-group input-group-sm">
                  <input type="text" class="form-control form-control-sm rounded-0" required="" placeholder="Search...." aria-label="Search....">
                  <button class="btn bg-primary border-0 rounded-0" type="submit">
                    <span class="text-white text-uppercase font-weight-bold">Search</span>
                  </button>
                </div>
              </form>
            </div>
          </div> -->
          
          <ul class="menuzord-menu menuzord-right">
            <!-- <li class=" active ">
              <a class="" href="javascript:void(0)">Home</a>
              <ul class="dropdown drop-up">
                <li class=" active ">
                  <a href="index.html">Home Main</a>
                </li>

                <li class="">
                  <a href="index-2.html">Home City</a>
                </li>

                <li class="">
                  <a href="index-3.html">Home Destination</a>
                </li>
              </ul>
            </li> -->


            <li class="">
              <a class="" href="javascript:void(0)">패키지여행</a>
              <ul class="dropdown drop-up">
                <li class=" ">
                  <a href="mo_package.html">패키지여행</a>
                </li>
              </ul>
            </li>

            <li class="active">
				<a class="" href="javascript:void(0)">DIY</a>
              <ul class="dropdown drop-up">
                <li class=" ">
                  <a href="mo_diy.html">DIY</a>
                </li>
				<li class=" ">
                  <a href="mo_diy_form.html">DIY 참여하기</a>
                </li>
				<li class=" ">
                  <a href="mo_diy_list.html">DIY 전체보기</a>
                </li>
              </ul>
            </li>
              <!-- <a href="javascript:void(0)">Hotels</a>
              <div class="megamenu drop-up">
                <div class="megamenu-row">
                  <div class="col3">
                    <ul class="list-unstyled">
                      <li>Hotels Grid View</li>

                      <li class="">
                        <a href="hotels-grid-left-sidebar.html">Hotels Sidebar Left</a>
                      </li>

                      <li class="">
                        <a href="hotels-grid-right-sidebar.html">Hotels Sidebar Right</a>
                      </li>

                      <li class="">
                        <a href="hotels-grid.html">Hotels 3 Columns</a>
                      </li>
                    </ul>
                  </div>
            
                  <div class="col3">
                    <ul class="list-unstyled">
                      <li>Hotels List View</li>
                      <li class="">
                        <a href="hotels-list-left-sidebar.html">Hotels Sidebar Left</a>
                      </li>

                      <li class="">
                        <a href="hotels-list-right-sidebar.html">Hotels Sidebar Right</a>
                      </li>

                      <li class="">
                        <a href="hotels-list.html">Hotels List</a>
                      </li>
                    </ul>
                  </div>
            
                  <div class="col3">
                    <ul class="list-unstyled">
                      <li>Single Hotel</li>
                      <li class="">
                        <a href="single-hotel-left-sidebar.html">Hotels Sidebar Left</a>
                      </li>

                      <li class="">
                        <a href="single-hotel-right-sidebar.html">Hotels Sidebar Right</a>
                      </li>

                      <li class="">
                        <a href="single-hotel-fullwidth.html">Hotels Fullwidth</a>
                      </li>
                    </ul>
                  </div>

                  <div class="col3">
                    <ul class="list-unstyled">
                      <li>Booking Steps</li>
                      <li class="">
                        <a href="booking-step-1.html">Step 1 - Personal Info</a>
                      </li>

                      <li class="">
                        <a href="booking-step-2.html">Step 2 - Payment Info</a>
                      </li>

                      <li class="">
                        <a href="booking-step-3.html">Step 3 - Confirmation</a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </li> -->

           
              <li class="">
				<a class="" href="javascript:void(0)">이벤트</a>
              <ul class="dropdown drop-up">
                <li class=" ">
                  <a href="mo_event.html">이벤트</a>
                </li>
              </ul>
            </li>

            <li class="">
              <a href="javascript:void(0)">후기</a>
              <ul class="dropdown drop-up">
                <li class="">
                  <a href="mo_review.html">후기</a>
                </li>

                <!-- <li class="">
                  <a href="contact.html">Contact Us</a>
                </li> -->

                <!-- <li class=" ||
                     ||
                    ">

                  <a href="javascript:void(0)">Gallery</a>
                  <ul class="dropdown drop-sub-menu-left drop-up">
                    <li class="">
                      <a href="gallery-grid.html">Gallery Grid</a>
                    </li>

                    <li class="">
                      <a href="gallery-masonry.html">Gallery Masonry</a>
                    </li>

                    <li class="">
                      <a href="gallery-photo-slider.html">Photo Slider</a>
                    </li>
                  </ul>
                </li> -->

                <!-- <li class=" ||
                    "> 

                  <a href="javascript:void(0)">Destinations</a>
                  <ul class="dropdown drop-sub-menu-left drop-up">
                    <li class="">
                      <a href="destination-cities.html">Destination Cities</a>
                    </li>

                    <li class="">
                      <a href="destination-single-city.html">Single Destination</a>
                    </li>
                  </ul>
                </li>-->

                <li class=""> 
                    
                  <a href="javascript:void(0)">Components</a>

                  <ul class="dropdown drop-sub-menu-left drop-up navComponents">
                    <li class="scrollNav">
                      <a class="removeNav" href="components.html#accordion">Accordion</a>
                    </li>

                    <li class="scrollNav">
                      <a class="removeNav" href="components.html#alerts">Alerts</a>
                    </li>

                    <li class="scrollNav">
                      <a class="removeNav" href="components.html#badge">Badge</a>
                    </li>

                    <li class="scrollNav">
                      <a class="removeNav" href="components.html#breadcrumb">Breadcrumb</a>
                    </li>

                    <li class="scrollNav">
                      <a class="removeNav" href="components.html#buttons">Buttons</a>
                    </li>

                    <li class="scrollNav">
                      <a class="removeNav" href="components.html#collapse">Collapse</a>
                    </li>

                    <li class="scrollNav">
                      <a class="removeNav" href="components.html#card">Card</a>
                    </li>

                    <li class="scrollNav">
                      <a class="removeNav" href="components.html#forms">Forms</a>
                    </li>

                    <li class="scrolling">
                      <a class="removeNav" href="components.html#dropdowns">Dropdowns</a>
                    </li>

                    <li class="scrollNav">
                      <a class="removeNav" href="components.html#list-group">List Group</a>
                    </li>

                    <li class="scrollNav">
                      <a class="removeNav" href="components.html#modal">Modal</a>
                    </li>

                    <li class="scrollNav">
                      <a class="removeNav" href="components.html#navs">Navs</a>
                    </li>

                    <li class="scrollNav">
                      <a class="removeNav" href="components.html#offcanvas">Offcanvas</a>
                    </li>

                    <li class="scrollNav">
                      <a class="removeNav" href="components.html#pagination">Pagination</a>
                    </li>

                    <li class="scrollNav">
                      <a class="removeNav" href="components.html#tooltips">Tooltips</a>
                    </li>

                    <li class="scrollNav">
                      <a class="removeNav" href="components.html#spinners">Spinners</a>
                    </li>

                    <li class="scrollNav">
                      <a class="removeNav" href="components.html#progress">Progress</a>
                    </li>
                  </ul>
                </li>

                <!-- <li><a href="404.html">404 Not Found</a></li>

                <li><a href="coming-soon.html">Coming Soon</a></li> -->
              </ul>
            </li>

            <li class="">
              <a href="javascript:void(0)">공지사항</a>

              <ul class="dropdown drop-up">
                <li class=" ||
                  ">

                  <a href="javascript:void(0)">Blog Grid View</a>

                  <ul class="dropdown drop-sub-menu-left drop-up">
                    <li class="">
                      <a href="blog-grid-three-col.html">Blog Grid 3 Col</a>
                    </li>

                    <li class="">
                      <a href="blog-grid-two-col.html">Blog Grid 2 Col</a>
                    </li>
                  </ul>
                </li>

                <li class=" ||
                   ||
                  ">

                  <a href="javascript:void(0)">Blog List View</a>

                  <ul class="dropdown drop-sub-menu-left drop-up">
                    <li class="">
                      <a href="blog-list-right-sidebar.html">Blog List Right Sidebar</a>
                    </li>

                    <li class="">
                      <a href="blog-list-left-sidebar.html">Blog List Left Sidebar</a>
                    </li>

                    <li class="">
                      <a href="blog-list-fullwidth.html">Blog List Fullwidth</a>
                    </li>
                  </ul>
                </li>

                <li class=" ||
                    ">

                  <a href="javascript:void(0)">Blog Single Post</a>

                  <ul class="dropdown drop-sub-menu-left drop-up">
                    <li class="">
                      <a href="blog-single-right-sidebar.html">Blog Right Sidebar</a>
                    </li>

                    <li class="">
                      <a href="blog-single-left-sidebar.html">Blog Left Sidebar</a>
                    </li>
                  </ul>
                </li>
              </ul>
            </li>

            <li class="">
              <a href="javascript:void(0)">Admin</a>
              <ul id="admin" class="dropdown drop-up">
                <li class="">
                  <a href="dashboard.html">Dashboard</a>
                </li>

                <li class="">
                  <a href="booking.html">Booking</a>
                </li>

                <li class="">
                  <a href="profile.html">Profile</a>
                </li>

                <li class="">
                  <a href="setting.html">Settings</a>
                </li>

                <li class="">
                  <a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#signup">Signup</a>
                </li>

                <li class="">
                  <a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#login">Login</a>
                </li>
              </ul>
            </li>

            <li class="py-4">
              <form class="d-lg-none" action="index.html" method="post">
                <div class="input-group input-group-sm">
                  <input type="text" class="form-control form-control-sm rounded-0" required="" placeholder="Search...." aria-label="Search....">
                  <button class="btn bg-primary border-0 rounded-0" type="submit">
                    <span class="text-white text-uppercase font-weight-bold">Search</span>
                  </button>
                </div>
              </form>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </header>
  <div class="main-wrapper packages-grid">


<!-- ====================================
———	PAGE TITLE
===================================== -->
<section class="page-title">
  <div class="page-title-img bg-img bg-overlay-darken" style="background-image: url(assets/img/pages/page-title-bg6.jpg);">
    <div class="container">
      <div class="row align-items-center justify-content-center" style="height: 200px;">
        <div class="col-lg-6">
          <div class="page-title-content">
            <div class="title-border">
              <h2 class="text-uppercase text-white font-weight-bold">나만의 DIY 여행</h2>
            </div>
            <p class="text-white mb-0"></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>


<!-- ====================================
———	DIY 작성 폼
===================================== -->


<section class="">
  <div class="container">
		<div class="py-10">
			<div class="diy_content">
				
				<div class="diy_form_title">
					DIY 
				</div>

				
				
				

		</div><!-- py-10 -->
    </div>	<!-- /container -->
</section>




     <!-- ====================================
    ——— FOOTER SECTION
    ===================================== -->
	<div id="footer">
	<div class="footer_In">
		<div class="logo"><img data-src="assets/img/logo-color-sm.png" src="assets/img/logo-color-sm.png" alt="img"></div>

		<div class="f_in">
			<div class="info">
				<ul>
					<a href="#"><li>국내여행 표준약관</li></a>
					<a href="#"><li>이용약관</li></a>
					<a href="#"><li>개인정보 처리방침</li></a>
				</ul>
			</div><!--info-->
			
			
			<p class="p1">
				<span>상호명</span> : 모두의 여행 &nbsp;｜&nbsp;  
				<span>주소</span> : 서울 강남구 테헤란로 124 4층  &nbsp;｜&nbsp;  
				<span>대표번호</span> : 000-000-0000  &nbsp;｜&nbsp;  
				<span>이메일</span> : moyeo@moyeo.com<br>
				ⓒ 2023. MOYEO lnc. ALL RIGHT RESERVED</p>

			

		</div><!--f_in-->
	</div><!--footer_In-->
</footer>

  
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
            <form class="" action="index.html" method="post">
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
            <form class="" action="index.html" method="post">
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
            <form class="" action="index.html" method="post">
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
    <script src="assets/plugins/jquery/jquery-3.4.1.min.js"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/plugins/menuzord/js/menuzord.js"></script>
    
    <script src='assets/plugins/isotope/isotope.min.js'></script>
    <script src='assets/plugins/images-loaded/js/imagesloaded.pkgd.min.js'></script>
    <script src='assets/plugins/fancybox/jquery.fancybox.min.js'></script>
    
    <script src='assets/plugins/selectric/jquery.selectric.min.js'></script>
    <script src='assets/plugins/daterangepicker/js/moment.min.js'></script>
    <script src='assets/plugins/daterangepicker/js/daterangepicker.min.js'></script>
    
    <script src="assets/plugins/lazyestload/lazyestload.js"></script>
    <script src='assets/plugins/dzsparallaxer/dzsparallaxer.js'></script>
    
    
    
    
    
    <script src='assets/plugins/revolution/js/jquery.themepunch.tools.min.js'></script>
    <script src='assets/plugins/revolution/js/jquery.themepunch.revolution.min.js'></script>
    <script src="assets/plugins/smoothscroll/SmoothScroll.js"></script>
    
    <script src="assets/js/star.js"></script>
  </body>
</html>

