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

    <link href='assets/plugins/isotope/isotope.min.css' rel='stylesheet'>
    <link href='assets/plugins/fancybox/jquery.fancybox.min.css' rel='stylesheet'>
    
    <link href='assets/plugins/selectric/selectric.css' rel='stylesheet'>
    <link href='assets/plugins/daterangepicker/css/daterangepicker.css' rel='stylesheet'>
    
    <link href='assets/plugins/dzsparallaxer/dzsparallaxer.css' rel='stylesheet'>


	<!-- 패키지상품 슬라이드-->
	<link href='assets/plugins/ria/css/swiper.min.css' rel='stylesheet'>
	<!-- 베이스css-->
	<link href='assets/plugins/ria/css/base.css' rel='stylesheet'>
    
    
    
    
    
    <link href='assets/plugins/revolution/css/settings.css' rel='stylesheet'>

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
  
  <!-- Preloader -->
  <div id="preloader" class="smooth-loader-wrapper">
    <div class="smooth-loader">
      <div class="sk-circle">
        <div class="sk-circle1 sk-child"></div>
        <div class="sk-circle2 sk-child"></div>
        <div class="sk-circle3 sk-child"></div>
        <div class="sk-circle4 sk-child"></div>
        <div class="sk-circle5 sk-child"></div>
        <div class="sk-circle6 sk-child"></div>
        <div class="sk-circle7 sk-child"></div>
        <div class="sk-circle8 sk-child"></div>
        <div class="sk-circle9 sk-child"></div>
        <div class="sk-circle10 sk-child"></div>
        <div class="sk-circle11 sk-child"></div>
        <div class="sk-circle12 sk-child"></div>
      </div>
    </div>
  </div>

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
            <a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#login" class="media d-inline-flex align-items-center">
              <!-- <i class="fa fa-user me-2"></i> -->
              <div class="media-body">
                회원가입
              </div>
            </a>
          </li>

		   <li class="me-6">
            <a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#login" class="media d-inline-flex align-items-center">
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
———	BANNER SECTION
===================================== -->
<div id="rev_slider_12_1_wrapper" class="rev_slider_wrapper fullwidthbanner-container" data-alias="star-test"
  data-source="gallery"
  style="margin:0px auto;background:rgba(0,0,0,0.15);padding:0px;margin-top:0px;margin-bottom:0px;background-repeat:no-repeat;background-size:cover;background-position:center center;" dir="ltr">
  <!-- START REVOLUTION SLIDER 5.4.8.1 fullwidth mode -->
  <div id="rev_slider_12_1" class="rev_slider fullwidthabanner" style="display:none;" data-version="5.4.8.1">
    <ul>
      <!-- SLIDE  -->
      <li data-index="rs-33" data-transition="fade" data-slotamount="default" data-hideafterloop="0"
        data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="default"
        data-thumb="assets/img/home/slider/slider-01.jpg" data-delay="4000" data-rotate="0" data-saveperformance="off"
        data-title="Slide" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6=""
        data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
        <!-- MAIN IMAGE -->
        <img src="assets/img/home/slider/slider-01.jpg" alt="" data-bgposition="center center" data-bgfit="cover"
          data-bgrepeat="no-repeat" class="rev-slidebg" data-no-retina style="width: 100% !important">
        <!-- LAYERS -->

        <!-- LAYER NR. 1 -->
        <div class="tp-caption tp-shape tp-shapewrapper  tp-resizeme" id="slide-33-layer-22"
          data-x="['left','left','left','left']" data-hoffset="['0','0','0','0']" data-y="['top','top','top','top']"
          data-voffset="['0','0','0','0']" data-width="full" data-height="full" data-whitespace="wrap"
          data-type="shape" data-basealign="slide" data-responsive_offset="on"
          data-frames='[{"delay":10,"speed":300,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]'
          data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]"
          data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]"
          style="z-index: 5;background-color:rgba(0,0,0,0.15);"> </div>

     
        <!-- LAYER NR. 3 -->
        <div class="tp-caption   tp-resizeme" id="slide-33-layer-7" data-x="['left','left','left','left']"
          data-hoffset="['0','100','50','70']" data-y="['middle','middle','middle','middle']"
          data-voffset="['-40','-40','-55','-50']" data-fontsize="['65','65','40','30']" data-width="none"
          data-height="none" data-whitespace="wrap" data-type="text" data-responsive_offset="on"
          data-frames='[{"delay":650,"speed":1000,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"+4340","speed":300,"frame":"999","to":"y:-50px;opacity:0;","ease":"Power3.easeInOut"}]'
          data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]"
          data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]"
          style="z-index: 7; white-space: wrap; font-size: 65px; line-height: 70px; font-weight: 700; color: #ffffff; letter-spacing: 0px;font-family:montserrat;text-transform:uppercase;">
          Travel Template </div>


        <!-- LAYER NR. 5 -->
        <a href="https://wrapbootstrap.com/theme/star-travel-tour-booking-theme-admin-WB05T4R0J" target="_blank" class="tp-caption rev-btn " id="slide-33-layer-11" data-x="['left','left','left','left']"
          data-hoffset="['0','100','50','70']" data-y="['middle','middle','middle','middle']"
          data-voffset="['120','120','100','30']" data-width="132" data-height="none" data-whitespace="wrap"
          data-type="button" data-responsive_offset="on" data-responsive="on"
          data-frames='[{"delay":1450,"speed":1000,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"+3540","speed":300,"frame":"999","to":"y:-50px;opacity:0;","ease":"Power3.easeInOut"}]'
          data-textAlign="['center','center','center','center']" data-paddingtop="[14,14,14,14]"
          data-paddingright="[0,0,0,0]" data-paddingbottom="[14,14,14,14]" data-paddingleft="[0,0,0,0]"
          style="z-index: 9; min-width: 132px; max-width: 132px; white-space: nowrap; font-size: 14px; line-height: 17px; font-weight: 500; color: #ffffff; letter-spacing: 0;font-family:Montserrat;text-transform:uppercase;background-color:rgb(255,137,30);border-radius:3px 3px 3px 3px;outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;cursor:pointer;">
          Buy Now </a>
      </li>
      <!-- SLIDE  -->
      <li data-index="rs-54" data-transition="slideleft" data-slotamount="default" data-hideafterloop="0"
        data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="default"
        data-thumb="assets/img/home/slider/slider-02.jpg" data-delay="4000" data-rotate="0" data-saveperformance="off"
        data-title="Slide" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6=""
        data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
        <!-- MAIN IMAGE -->
        <img src="assets/img/home/slider/slider-02.jpg" alt="" data-bgposition="center center" data-bgfit="cover"
          data-bgrepeat="no-repeat" class="rev-slidebg" data-no-retina style="width: 100% !important">
        <!-- LAYERS -->

        <!-- LAYER NR. 6 -->
        <div class="tp-caption tp-shape tp-shapewrapper  tp-resizeme" id="slide-54-layer-12"
          data-x="['left','left','left','left']" data-hoffset="['0','0','0','0']" data-y="['top','top','top','top']"
          data-voffset="['0','0','0','0']" data-width="full" data-height="full" data-whitespace="wrap"
          data-type="shape" data-basealign="slide" data-responsive_offset="on"
          data-frames='[{"delay":10,"speed":300,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]'
          data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]"
          data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]"
          style="z-index: 5;background-color:rgba(0,0,0,0.15);"> </div>



        <!-- LAYER NR. 8 -->
        <div class="tp-caption   tp-resizeme" id="slide-54-layer-7" data-x="['center','center','center','center']"
          data-hoffset="['0','0','0','0']" data-y="['middle','middle','middle','middle']"
          data-voffset="['-40','-40','-55','-50']" data-fontsize="['65','65','40','30']" data-width="none"
          data-height="none" data-whitespace="wrap" data-type="text" data-responsive_offset="on"
          data-frames='[{"delay":650,"speed":1000,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"+4330","speed":300,"frame":"999","to":"y:-50px;opacity:0;","ease":"Power3.easeInOut"}]'
          data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]"
          data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]"
          style="z-index: 7; white-space: nowrap; font-size: 65px; line-height: 70px; font-weight: 700; color: #ffffff; letter-spacing: 0px;font-family:montserrat;text-transform:uppercase;">
          Travel Template </div>



        <!-- LAYER NR. 10 -->
        <a href="https://wrapbootstrap.com/theme/star-travel-tour-booking-theme-admin-WB05T4R0J" target="_blank" class="tp-caption rev-btn " id="slide-54-layer-11" data-x="['center','center','center','center']"
          data-hoffset="['0','0','0','0']" data-y="['middle','middle','middle','middle']"
          data-voffset="['120','120','100','30']" data-width="132" data-height="none" data-whitespace="wrap"
          data-type="button" data-responsive_offset="on" data-responsive="on"
          data-frames='[{"delay":1450,"speed":1000,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"+3530","speed":300,"frame":"999","to":"y:-50px;opacity:0;","ease":"Power3.easeInOut"}]'
          data-textAlign="['center','center','center','center']" data-paddingtop="[14,14,14,14]"
          data-paddingright="[0,0,0,0]" data-paddingbottom="[14,14,14,14]" data-paddingleft="[0,0,0,0]"
          style="z-index: 9; min-width: 132px; max-width: 132px; white-space: nowrap; font-size: 14px; line-height: 17px; font-weight: 500; color: #ffffff; letter-spacing: 0;font-family:Montserrat;text-transform:uppercase;background-color:rgb(255,137,30);border-radius:3px 3px 3px 3px;outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;cursor:pointer;">
          Buy Now </a>
      </li>
      <!-- SLIDE  -->
      <li data-index="rs-56" data-transition="slideleft" data-slotamount="default" data-hideafterloop="0"
        data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="default"
        data-thumb="assets/img/home/slider/slider-03.jpg" data-delay="4000" data-rotate="0" data-saveperformance="off"
        data-title="Slide" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6=""
        data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
        <!-- MAIN IMAGE -->
        <img src="assets/img/home/slider/slider-03.jpg" alt="" data-bgposition="center center" data-bgfit="cover"
          data-bgrepeat="no-repeat" class="rev-slidebg" data-no-retina style="width: 100% !important">
        <!-- LAYERS -->

        <!-- LAYER NR. 11 -->
        <div class="tp-caption tp-shape tp-shapewrapper  tp-resizeme" id="slide-56-layer-12"
          data-x="['left','left','left','left']" data-hoffset="['0','0','0','0']" data-y="['top','top','top','top']"
          data-voffset="['0','0','0','0']" data-width="full" data-height="full" data-whitespace="wrap"
          data-type="shape" data-basealign="slide" data-responsive_offset="on"
          data-frames='[{"delay":10,"speed":300,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]'
          data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]"
          data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]"
          style="z-index: 5;background-color:rgba(0,0,0,0.15);"> </div>


        <!-- LAYER NR. 13 -->
        <div class="tp-caption   tp-resizeme" id="slide-56-layer-7" data-x="['left','left','left','left']"
          data-hoffset="['0','100','50','70']" data-y="['middle','middle','middle','middle']"
          data-voffset="['-40','-40','-55','-50']" data-fontsize="['65','65','40','30']" data-width="none"
          data-height="none" data-whitespace="wrap" data-type="text" data-responsive_offset="on"
          data-frames='[{"delay":650,"speed":1000,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"y:-50px;opacity:0;","ease":"Power3.easeInOut"}]'
          data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]"
          data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]"
          style="z-index: 7; white-space: nowrap; font-size: 65px; line-height: 70px; font-weight: 700; color: #ffffff; letter-spacing: 0px;font-family:montserrat;text-transform:uppercase;">
          Bootstrap Theme </div>


        <!-- LAYER NR. 15 -->
        <a href="https://wrapbootstrap.com/theme/star-travel-tour-booking-theme-admin-WB05T4R0J" target="_blank" class="tp-caption rev-btn " id="slide-56-layer-11" data-x="['left','left','left','left']"
          data-hoffset="['0','100','50','70']" data-y="['middle','middle','middle','middle']"
          data-voffset="['120','120','100','30']" data-width="132" data-height="none" data-whitespace="wrap"
          data-type="button" data-responsive_offset="on" data-responsive="on"
          data-frames='[{"delay":1450,"speed":1000,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"y:-50px;opacity:0;","ease":"Power3.easeInOut"}]'
          data-textAlign="['center','center','center','center']" data-paddingtop="[14,14,14,14]"
          data-paddingright="[0,0,0,0]" data-paddingbottom="[14,14,14,14]" data-paddingleft="[0,0,0,0]"
          style="z-index: 9; min-width: 132px; max-width: 132px; white-space: nowrap; font-size: 14px; line-height: 17px; font-weight: 500; color: #ffffff; letter-spacing: 0;font-family:Montserrat;text-transform:uppercase;background-color:rgb(255,137,30);border-radius:3px 3px 3px 3px;outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;cursor:pointer;">
          Buy Now </a>
      </li>
      <!-- SLIDE  -->
      <li data-index="rs-57" data-transition="slideleft" data-slotamount="default" data-hideafterloop="0"
        data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="default"
        data-thumb="assets/img/home/slider/slider-04.jpg" data-delay="4000" data-rotate="0" data-saveperformance="off"
        data-title="Slide" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6=""
        data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
        <!-- MAIN IMAGE -->
        <img src="assets/img/home/slider/slider-04.jpg" alt="" data-bgposition="center center"
          data-bgfit="cover" data-bgrepeat="no-repeat" class="rev-slidebg" data-no-retina style="width: 100% !important">
        <!-- LAYERS -->

        <!-- LAYER NR. 16 -->
        <div class="tp-caption tp-shape tp-shapewrapper  tp-resizeme" id="slide-57-layer-12"
          data-x="['left','left','left','left']" data-hoffset="['0','0','0','0']" data-y="['top','top','top','top']"
          data-voffset="['0','0','0','0']" data-width="full" data-height="full" data-whitespace="wrap"
          data-type="shape" data-basealign="slide" data-responsive_offset="on"
          data-frames='[{"delay":10,"speed":300,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]'
          data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]"
          data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]"
          style="z-index: 5;background-color:rgba(0,0,0,0.15);"> </div>

 
        <!-- LAYER NR. 18 -->
        <div class="tp-caption   tp-resizeme" id="slide-57-layer-7" data-x="['center','center','center','center']"
          data-hoffset="['0','0','0','0']" data-y="['middle','middle','middle','middle']"
          data-voffset="['-40','-40','-55','-50']" data-fontsize="['65','65','40','30']" data-width="none"
          data-height="none" data-whitespace="wrap" data-type="text" data-responsive_offset="on"
          data-frames='[{"delay":650,"speed":1000,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"+4050","speed":300,"frame":"999","to":"y:-50px;opacity:0;","ease":"Power3.easeInOut"}]'
          data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]"
          data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]"
          style="z-index: 7; white-space: nowrap; font-size: 65px; line-height: 70px; font-weight: 700; color: #ffffff; letter-spacing: 0px;font-family:montserrat;text-transform:uppercase;">
          24/7 Quick Support </div>


        <!-- LAYER NR. 20 -->
        <a href="https://wrapbootstrap.com/theme/star-travel-tour-booking-theme-admin-WB05T4R0J" target="_blank" class="tp-caption rev-btn" id="slide-57-layer-11" data-x="['center','center','center','center']"
          data-hoffset="['0','0','0','0']" data-y="['middle','middle','middle','middle']"
          data-voffset="['120','120','100','30']" data-width="132" data-height="none" data-whitespace="wrap"
          data-type="button" data-responsive_offset="on" data-responsive="on"
          data-frames='[{"delay":1450,"speed":1000,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"+3250","speed":300,"frame":"999","to":"y:-50px;opacity:0;","ease":"Power3.easeInOut"}]'
          data-textAlign="['center','center','center','center']" data-paddingtop="[14,14,14,14]"
          data-paddingright="[0,0,0,0]" data-paddingbottom="[14,14,14,14]" data-paddingleft="[0,0,0,0]"
          style="z-index: 9; min-width: 132px; max-width: 132px; white-space: nowrap; font-size: 14px; line-height: 17px; font-weight: 500; color: #ffffff; letter-spacing: 0;font-family:Montserrat;text-transform:uppercase;background-color:rgb(255,137,30);border-radius:3px 3px 3px 3px;outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;cursor:pointer;">
          Buy Now </a>
      </li>
    </ul>
    <div class="tp-bannertimer tp-bottom" style="visibility: hidden !important;"></div>
  </div>
</div>







<!-- ====================================
———	패키지 상품 슬라이더
===================================== -->


<!-- Swiper -->
<div id="main_pack">
	<div class="main_pack_title">
		<div class="text-center section-title">
		  <h2 class="text-uppercase font-weight-bold position-relative">
			<span class="bg-wh">
			  BEST 여행지
			</span>
		  </h2>
		  <p class="text-capitalize text-center noto">모여에서 가장 사랑받는 월간 BEST 여행지 입니다.</p>
	  </div>
	</div>

    <div class="swiper-container">

        <div class="swiper-wrapper">
            <div class="swiper-slide">Slide 1</div>
            <div class="swiper-slide">Slide 2</div>
            <div class="swiper-slide">Slide 3</div>
            <div class="swiper-slide">Slide 4</div>
			<div class="swiper-slide">Slide 5</div>
            <div class="swiper-slide">Slide 6</div>
            <div class="swiper-slide">Slide 7</div>
            <div class="swiper-slide">Slide 8</div>
        </div>
        <!-- Add Pagination -->
        <div class="swiper-pagination"></div>
        <!-- Add Pagination -->
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
    </div>



</div><!--/main_pack-->

    <!-- Swiper JS -->
    <script src="../assets/plugins/ria/js/swiper.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
    var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        slidesPerView:4,
		initialSlide: 1,
        paginationClickable: true,
        spaceBetween: 20,
        freeMode: true,
		nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
		autoplay: 2500,
        autoplayDisableOnInteraction: false,
		loop:true,
        loopedSlides: 5,

		breakpoints : { // 반응형 설정이 가능 width값으로 조정
			  768 : {
				slidesPerView : 2,
			  },
			},
		
		
    });
    </script>





<!-- ====================================
———	TOP DEALS SECTION  마감임박 상품
===================================== -->
<section class="bg-smoke py-8 py-lg-9">
  <div class="container">
    <div class="text-center section-title">
      <h2 class="text-uppercase font-weight-bold position-relative">
        <span class="bg-smoke">
          마감임박 상품
        </span>
      </h2>
      <p class="text-capitalize text-center noto">모여에서 추천드리는 마감임박 상품입니다.</p>
    </div>

    <div class="row justify-content-center">
      <div class="col-md-6 col-lg-4">
        <div class="card card-hover mb-5 mb-lg-0">
          <a href="mo_package_animal.html" class="position-relative">
            <img class="card-img-top lazyestload" data-src="assets/img/home/deal/deal-01.jpg" src="assets/img/home/deal/deal-01.jpg" alt="Card image cap">
            
            <div class="card-img-overlay card-hover-overlay rounded-top d-flex flex-column">
              <div class="badge bg-primary badge-rounded-circle">  
                <span class="d-block">
                  50%<br>off
                </span>
              </div>

              <ul class="list-unstyled d-flex mt-auto text-warning">
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

              <ul class="list-unstyled d-flex text-white font-weight-bold mb-0">
                <li class="border-right border-white pe-2">7 days</li>
                <li class="border-right border-white px-2">15 hrs</li>
                <li class="ps-2">15 min</li>
              </ul>
            </div>
          </a>

          <div class="card-body">
            <h5>
              <a href="mo_package_animal.html" class="card-title text-uppercase">Suspendisse Blandit</a>
            </h5>		    
            <p class="mb-5">Integer purus ex, dictum nec elementum eu, tristique vel lectus. Donec rutrum lectus et pharetra egestas.</p>
            <div class="d-flex justify-content-between align-items-center">
              <div>
                <p class="mb-0 text-capitalize">Start from</p>
                <h3 class="text-primary">$299</h3>
              </div>

              <div>
                <a href="booking-step-1.html" class="btn btn-sm btn-outline-secondary text-uppercase">Book Now</a>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="col-md-6 col-lg-4">
        <div class="card card-hover mb-5 mb-lg-0">
          <a href="mo_package_animal.html" class="position-relative">
            <img class="card-img-top lazyestload" data-src="assets/img/home/deal/deal-02.jpg" src="assets/img/home/deal/deal-02.jpg" alt="Card image cap">

            <div class="card-img-overlay card-hover-overlay rounded-top d-flex flex-column">
              <div class="badge bg-primary badge-rounded-circle">
                <span class="d-block">
                  Free<br>gift
                </span>
              </div>

              <ul class="list-unstyled d-flex mt-auto text-warning">
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

              <ul class="list-unstyled d-flex text-white font-weight-bold mb-0">
                <li class="border-right border-white pe-2">7 days</li>
                <li class="border-right border-white px-2">15 hrs</li>
                <li class="ps-2">15 min</li>
              </ul>
            </div>
          </a>

          <div class="card-body">
            <h5 class="">
              <a href="mo_package_animal.html" class="card-title text-uppercase">Suspendisse Eros Erat</a>
            </h5>
            <p class="mb-5">Proin convallis magna vel libero accumsan sollicitudin. Quisque dapibus vitae turpis eu magna sagittis.</p>
            <div class="d-flex justify-content-between align-items-center">
              <div>
                <p class="mb-0 text-capitalize">Start from</p>
                <h3 class="text-primary">$499</h3>
              </div>

              <div>
                <a href="jascript:void(0)"  data-bs-toggle="modal" data-bs-target="#inquiry" class="btn btn-sm btn-outline-secondary text-uppercase">Inquiry</a>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="col-md-6 col-lg-4">
        <div class="card card-hover">
          <a href="mo_package_animal.html" class="position-relative">
            <img class="card-img-top lazyestload" data-src="assets/img/home/deal/deal-03.jpg" src="assets/img/home/deal/deal-03.jpg" alt="Card image cap">

            <div class="card-img-overlay card-hover-overlay rounded-top d-flex flex-column">
              <div class="badge bg-primary badge-rounded-circle">
                <span class="d-block">
                  25%<br>off
                </span>
              </div>

              <ul class="list-unstyled d-flex mt-auto text-warning">
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

              <ul class="list-unstyled d-flex text-white font-weight-bold mb-0">
                <li class="border-right border-white pe-2">7 days</li>
                <li class="border-right border-white px-2">15 hrs</li>
                <li class="ps-2">15 min</li>
              </ul>
            </div>
          </a>

          <div class="card-body">
            <h5>
              <a href="mo_package_animal.html" class="card-title text-uppercase">Quisque Placerat Nunc</a>
            </h5>
            <p class="mb-5">Vivamus eu mattis nibh. Quisque eget ipsum at odio fringilla consequat vel id erat. Suspendisse non feugiat mi.</p>
            <div class="d-flex justify-content-between align-items-center">
              <div>
                <p class="mb-0 text-capitalize">Start from</p>
                <h3 class="text-primary">$299</h3>
              </div>

              <div>
                <a href="booking-step-1.html" class="btn btn-sm btn-outline-secondary text-uppercase">Book Now</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="text-center mt-7">
      <a href="mo_package.html" class="btn btn-sm btn-outline-secondary text-uppercase noto">더 많은 상품 보기</a>
    </div>		
  </div>
</section>





<!-- ====================================
———	여행 후기
===================================== -->
<div id="main_review">
	<div class="main_pack_title">
		<div class="text-center section-title">
		  <h2 class="text-uppercase font-weight-bold position-relative">
			<span class="bg-wh">
			  여행 후기
			</span>
		  </h2>
		  <p class="text-capitalize text-center noto">모여에서 가장 사랑받는 월간 BEST 여행지 입니다.</p>
	  </div>
	</div>
	

	<div class="review_content af">
		<div class="con1 sp">
			<div class="review_img"></div>
			<ul>
				<li class="t1">[제주도] 제주도 후기 제목이 들어갈 공간입니다.</li>
				<li class="t2">제주도 여행 후기가 들어갈 텍스트 공간입니다. 여행 후기 텍스트가 들어갈 공간입니다.여행 후기 텍스트가 들어갈 공간입니다. 여행 후기 텍스트가 들어갈 공간입니다.</li>
				<li class="t3">김*아 <span>2023-08-15</span></li>
			</ul>
		</div><!-- /con1 -->

		<div class="con1 sp">
			<div class="review_img"></div>
			<ul>
				<li class="t1">[제주도] 제주도 후기 제목이 들어갈 공간입니다.</li>
				<li class="t2">제주도 여행 후기가 들어갈 텍스트 공간입니다. 여행 후기 텍스트가 들어갈 공간입니다.여행 후기 텍스트가 들어갈 공간입니다. 여행 후기 텍스트가 들어갈 공간입니다.</li>
				<li class="t3">김*아 <span>2023-08-15</span></li>
			</ul>
		</div><!-- /con1 -->

		<div class="con1">
			<div class="review_img"></div>
			<ul>
				<li class="t1">[제주도] 제주도 후기 제목이 들어갈 공간입니다.</li>
				<li class="t2">제주도 여행 후기가 들어갈 텍스트 공간입니다. 여행 후기 텍스트가 들어갈 공간입니다.여행 후기 텍스트가 들어갈 공간입니다. 여행 후기 텍스트가 들어갈 공간입니다.</li>
				<li class="t3">김*아 <span>2023-08-15</span></li>
			</ul>
		</div><!-- /con1 -->

		<div class="text-center mt-7">
			<a href="mo_review.html" class="btn btn-sm btn-outline-secondary text-uppercase noto">더 많은 후기 보기</a>
		</div>

	</div><!-- /review_content -->
	
		

</div><!-- /main_review -->



<!-- ====================================
———	VACETION SECTION
===================================== -->
<!-- <section class="dzsparallaxer auto-init use-loading promotion-paralax">
  <div class="divimage dzsparallaxer--target" style="height: 700px;" data-src="assets/img/home/promotion/promotion-1.jpg">
  </div>

  <div class="container paralax-container">
    <div class="row align-items-center justify-content-center text-center">
      <div class="col-12">
        <div class="content mb-7">
          <h4 class="text-uppercase text-white mb-2">Winter Promotion</h4>
          <h2 class="text-uppercase text-white font-weight-bold">Greek Island Vacation Tour</h2>
        </div>
        <ul class="list-unstyled icon-rating d-flex justify-content-center text-warning mb-1">
          <li class="me-1">
            <i class="fa fa-star" aria-hidden="true"></i>
          </li>
          <li class="me-1">
            <i class="fa fa-star" aria-hidden="true"></i>
          </li>
          <li class="me-1">
            <i class="fa fa-star" aria-hidden="true"></i>
          </li>
          <li class="me-1">
            <i class="fa fa-star" aria-hidden="true"></i>
          </li>
          <li>
            <i class="fa fa-star" aria-hidden="true"></i>
          </li>
        </ul>		
        <h4 class="text-white mb-4">$599 per person - 5 nights</h4>
        <a href="mo_package_animal.html" class="btn btn-primary text-uppercase">View Details</a>
      </div>
    </div>			
  </div>
</section> -->




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




    <!-- <footer class="footer">
      <div class="footer-bg-color py-9">
        <div class="container">
          <div class="row">
            <div class="col-md-6 col-lg-3 mb-7 mb-lg-0">
              <a class="d-inline-block" href="index.html">
                <img class="w-100 mb-6 lazyestload" data-src="assets/img/logo-color-sm.png" src="assets/img/logo-color-sm.png" alt="img">
              </a>
              <p class="mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et </p>
            </div>
    
            <div class="col-md-6 col-lg-3 mt-md-4 mb-7 mb-lg-0">
              <div class="title-tag">
                <h6>Contact us</h6>
              </div>

              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit sed do eiusmod.</p>
              <ul class="list-unstyled mb-0">
                <li class="media mb-2">
                  <div class="me-3">
                    <i class="fa fa-home" aria-hidden="true"></i>
                  </div>
                  <div class="media-body">
                     <a href="contact.html">61 Park Street, Fifth Avenue, NY</a>
                  </div>
                </li>

                <li class="media mb-2">
                  <div class="me-3">
                    <i class="fas fa-phone-alt" aria-hidden="true"></i>
                  </div>
                  <div class="media-body">
                    <a href="tel:88657524332">[88] 657 524 332</a>
                  </div>
                </li>
                
                <li class="media">
                  <div class="me-3">
                    <i class="far fa-envelope" aria-hidden="true"></i>
                  </div>
                  <div class="media-body">
                    <a href="mailTo:info@star-travel.com">info@star-travel.com</a>
                  </div>
                </li>
              </ul>
            </div>
    
          </div>
        </div>
      </div>
    

      <div class="copyright py-6">
        <div class="container">
          <div class="row align-items-center">
            <div class="col-md-6 order-1 order-md-0">
              <p class="mb-0 mb-md-0 text-md-start">Copyright &copy; <span id="copy-year"></span> All Rights Reserved by
                <a href="http://www.iamabdus.com/" target="_blank">Abdus</a>
              </p>
            </div>
            
            <div class="col-md-6">
              <ul class="list-inline text-capitalize d-flex align-items-center justify-content-md-end justify-content-center mb-md-0">
                <li class="me-3">
                  <a href="setting.html">국내여행 표준약관</a>
                </li>
    
                <li class="me-3">
                  <a href="about-us.html">이용약관</a>
                </li>
    
                <li class="me-3">
                  <a href="contact.html">개인정보 처리방침</a>
                </li>
    
                <li class="">
                  <a href="blog-single-right-sidebar.html">Blog</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>

      <script>
        var d = new Date();
        var year = d.getFullYear();
        document.getElementById("copy-year").innerHTML = year;
      </script>
    </footer>
 -->
  










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

