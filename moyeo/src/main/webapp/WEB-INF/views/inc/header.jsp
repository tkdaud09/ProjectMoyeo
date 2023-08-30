 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



 <!-- ====================================
  ———HEADER
  ===================================== -->
   
   
<c:choose>
    <c:when test="${userinfo.status == 0}">
        <!-- 일반회원일 때의 헤더 -->
        <header class="header" id="pageTop">
        <!-- 일반회원용 헤더 내용 추가 -->
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
                  
                      <a href="${pageContext.request.contextPath}/user/logout">로그아웃</a>
                    
                  
                </li>
      
              <li class="me-6">
                 
                    
                      <a href="${pageContext.request.contextPath}/user/mypage">마이페이지</a>
                    
                </li>
                
                <li class="me-6">
                 
                    
                      <a href="${pageContext.request.contextPath}/cart/list">장바구니</a>
                    
                </li>
      
               <li class="me-6">
                  <a href="#" data-bs-toggle="modal" data-bs-target="#login" class="media d-inline-flex align-items-center">
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
                <a href="${pageContext.request.contextPath}/" class="menuzord-brand">
                  <img class="lazyestload" data-src="${pageContext.request.contextPath}/assets/img/logo-color-big.png" src="${pageContext.request.contextPath}/assets/img/logo-color-big.png" alt="logo-img">
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
                        <a href="${pageContext.request.contextPath}/package/">패키지여행</a>
                      </li>
                    </ul>
                  </li>
      
                  <li class="">
                  <a class="" href="javascript:void(0)">DIY</a>
                    <ul class="dropdown drop-up">
                      <li class=" ">
                        <a href="${pageContext.request.contextPath}/diy/diy">DIY</a>
                      </li>
                  <li class=" ">
                        <a href="${pageContext.request.contextPath}/diy/diy_add">DIY 참여하기</a>
                      </li>
                  <li class=" ">
                        <a href="${pageContext.request.contextPath}/diy/diy_list">DIY 전체보기</a>
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
                        <a href="${pageContext.request.contextPath}/event">이벤트</a>
                      </li>
                    </ul>
                  </li>
      
                  <li class="">
                    <a href="javascript:void(0)">후기</a>
                    <ul class="dropdown drop-up">
                      <li class="">
                        <a href="${pageContext.request.contextPath}/review/list">후기</a>
                      </li>
      
                      <!-- <li class="">
                        <a href="contact.jsp">Contact Us</a>
                      </li> -->
      
                      <!-- <li class=" ||
                           ||
                          ">
      
                        <a href="javascript:void(0)">Gallery</a>
                        <ul class="dropdown drop-sub-menu-left drop-up">
                          <li class="">
                            <a href="gallery-grid.jsp">Gallery Grid</a>
                          </li>
      
                          <li class="">
                            <a href="gallery-masonry.jsp">Gallery Masonry</a>
                          </li>
      
                          <li class="">
                            <a href="gallery-photo-slider.jsp">Photo Slider</a>
                          </li>
                        </ul>
                      </li> -->
      
                      <!-- <li class=" ||
                          "> 
      
                        <a href="javascript:void(0)">Destinations</a>
                        <ul class="dropdown drop-sub-menu-left drop-up">
                          <li class="">
                            <a href="destination-cities.jsp">Destination Cities</a>
                          </li>
      
                          <li class="">
                            <a href="destination-single-city.jsp">Single Destination</a>
                          </li>
                        </ul>
                      </li>-->
      
      
      
      
         <!---------------- 필요한거 여기서 가져가기 -------------------->
      
                      <!-- <li class=""> 
                          
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
                      </li>------------------------------------------------------------------------->
      
                      <!-- <li><a href="404.html">404 Not Found</a></li>
      
                      <li><a href="coming-soon.html">Coming Soon</a></li> -->
                    </ul>
                  </li>
      
                  <li class="">
                    <a href="javascript:void(0)">공지사항</a>
      
                    <ul class="dropdown drop-up">
                     
                        <li class="">
                           <a href="${pageContext.request.contextPath}/notice">공지사항</a>
                         </li>
                     
                      <!--  <li class=" ||
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
                  </li>-->
      
                 <!--  <li class="">
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
                </ul> -->
              </div>
            </div>
          </nav>
        </header>
    </c:when>
    <c:when test="${userinfo.status == 9}">
        <!-- 관리자일 때의 헤더 -->
        <header class="header" id="pageTop">
        <!-- 관리자용 헤더 내용 추가 -->
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
                  
                      <a href="${pageContext.request.contextPath}/user/logout">로그아웃</a>
                    
                  
                </li>
      
              <li class="me-6">
                 
                    <!-- <i class="fa fa-user me-2"></i> -->
                    
                      <a href="${pageContext.request.contextPath}/admin/">관리자페이지</a>
                    
                </li>
      
               <li class="me-6">
                  <a href="#" data-bs-toggle="modal" data-bs-target="#login" class="media d-inline-flex align-items-center">
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
                <a href="${pageContext.request.contextPath}/" class="menuzord-brand">
                  <img class="lazyestload" data-src="${pageContext.request.contextPath}/assets/img/logo-color-big.png" src="${pageContext.request.contextPath}/assets/img/logo-color-big.png" alt="logo-img">
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
                        <a href="${pageContext.request.contextPath}/package/">패키지여행</a>
                      </li>
                    </ul>
                  </li>
      
                  <li class="">
                  <a class="" href="javascript:void(0)">DIY</a>
                    <ul class="dropdown drop-up">
                      <li class=" ">
                        <a href="${pageContext.request.contextPath}/diy/diy">DIY</a>
                      </li>
                  <li class=" ">
                        <a href="${pageContext.request.contextPath}/diy/diy_add">DIY 참여하기</a>
                      </li>
                  <li class=" ">
                        <a href="${pageContext.request.contextPath}/diy/diy_list">DIY 전체보기</a>
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
                        <a href="${pageContext.request.contextPath}/event">이벤트</a>
                      </li>
                    </ul>
                  </li>
      
                  <li class="">
                    <a href="javascript:void(0)">후기</a>
                    <ul class="dropdown drop-up">
                      <li class="">
                        <a href="${pageContext.request.contextPath}/review/list">후기</a>
                      </li>
      
                      <!-- <li class="">
                        <a href="contact.jsp">Contact Us</a>
                      </li> -->
      
                      <!-- <li class=" ||
                           ||
                          ">
      
                        <a href="javascript:void(0)">Gallery</a>
                        <ul class="dropdown drop-sub-menu-left drop-up">
                          <li class="">
                            <a href="gallery-grid.jsp">Gallery Grid</a>
                          </li>
      
                          <li class="">
                            <a href="gallery-masonry.jsp">Gallery Masonry</a>
                          </li>
      
                          <li class="">
                            <a href="gallery-photo-slider.jsp">Photo Slider</a>
                          </li>
                        </ul>
                      </li> -->
      
                      <!-- <li class=" ||
                          "> 
      
                        <a href="javascript:void(0)">Destinations</a>
                        <ul class="dropdown drop-sub-menu-left drop-up">
                          <li class="">
                            <a href="destination-cities.jsp">Destination Cities</a>
                          </li>
      
                          <li class="">
                            <a href="destination-single-city.jsp">Single Destination</a>
                          </li>
                        </ul>
                      </li>-->
      
      
      
      
         <!---------------- 필요한거 여기서 가져가기 -------------------->
      
                      <!-- <li class=""> 
                          
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
                      </li>------------------------------------------------------------------------->
      
                      <!-- <li><a href="404.html">404 Not Found</a></li>
      
                      <li><a href="coming-soon.html">Coming Soon</a></li> -->
                    </ul>
                  </li>
      
                  <li class="">
                    <a href="javascript:void(0)">공지사항</a>
      
                    <ul class="dropdown drop-up">
                     
                        <li class="">
                           <a href="${pageContext.request.contextPath}/notice">공지사항</a>
                         </li>
                     
                      <!--  <li class=" ||
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
                  </li>-->
      
                 <!--  <li class="">
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
                </ul> -->
              </div>
            </div>
          </nav>
        </header>
    </c:when>
    <c:otherwise>
        <!-- 로그인하지 않은 사용자일 때의 헤더 -->
        <header class="header" id="pageTop">
        <!-- 로그인하지 않은 사용자용 헤더 내용 추가 -->
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
                  
                      <a href="${pageContext.request.contextPath}/user/login">로그인</a>
                    
                  
                </li>
      
              <li class="me-6">
                 
                    <!-- <i class="fa fa-user me-2"></i> -->
                    
                      <a href="${pageContext.request.contextPath}/user/join">회원가입</a>
                    
                </li>
      
               <li class="me-6">
                  <a href="#" data-bs-toggle="modal" data-bs-target="#login" class="media d-inline-flex align-items-center">
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
                <a href="${pageContext.request.contextPath}/" class="menuzord-brand">
                  <img class="lazyestload" data-src="${pageContext.request.contextPath}/assets/img/logo-color-big.png" src="${pageContext.request.contextPath}/assets/img/logo-color-big.png" alt="logo-img">
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
                        <a href="${pageContext.request.contextPath}/package/">패키지여행</a>
                      </li>
                    </ul>
                  </li>
      
                  <li class="">
                  <a class="" href="javascript:void(0)">DIY</a>
                    <ul class="dropdown drop-up">
                      <li class=" ">
                        <a href="${pageContext.request.contextPath}/diy/diy">DIY</a>
                      </li>
                  <li class=" ">
                        <a href="${pageContext.request.contextPath}/diy/diy_add">DIY 참여하기</a>
                      </li>
                  <li class=" ">
                        <a href="${pageContext.request.contextPath}/diy/diy_list">DIY 전체보기</a>
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
                        <a href="${pageContext.request.contextPath}/event">이벤트</a>
                      </li>
                    </ul>
                  </li>
      
                  <li class="">
                    <a href="javascript:void(0)">후기</a>
                    <ul class="dropdown drop-up">
                      <li class="">
                        <a href="${pageContext.request.contextPath}/review/list">후기</a>
                      </li>
      
                      <!-- <li class="">
                        <a href="contact.jsp">Contact Us</a>
                      </li> -->
      
                      <!-- <li class=" ||
                           ||
                          ">
      
                        <a href="javascript:void(0)">Gallery</a>
                        <ul class="dropdown drop-sub-menu-left drop-up">
                          <li class="">
                            <a href="gallery-grid.jsp">Gallery Grid</a>
                          </li>
      
                          <li class="">
                            <a href="gallery-masonry.jsp">Gallery Masonry</a>
                          </li>
      
                          <li class="">
                            <a href="gallery-photo-slider.jsp">Photo Slider</a>
                          </li>
                        </ul>
                      </li> -->
      
                      <!-- <li class=" ||
                          "> 
      
                        <a href="javascript:void(0)">Destinations</a>
                        <ul class="dropdown drop-sub-menu-left drop-up">
                          <li class="">
                            <a href="destination-cities.jsp">Destination Cities</a>
                          </li>
      
                          <li class="">
                            <a href="destination-single-city.jsp">Single Destination</a>
                          </li>
                        </ul>
                      </li>-->
      
      
      
      
         <!---------------- 필요한거 여기서 가져가기 -------------------->
      
                      <!-- <li class=""> 
                          
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
                      </li>------------------------------------------------------------------------->
      
                      <!-- <li><a href="404.html">404 Not Found</a></li>
      
                      <li><a href="coming-soon.html">Coming Soon</a></li> -->
                    </ul>
                  </li>
      
                  <li class="">
                    <a href="javascript:void(0)">공지사항</a>
      
                    <ul class="dropdown drop-up">
                     
                        <li class="">
                           <a href="${pageContext.request.contextPath}/notice">공지사항</a>
                         </li>
                     
                      <!--  <li class=" ||
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
                  </li>-->
      
                 <!--  <li class="">
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
                </ul> -->
              </div>
            </div>
          </nav>
        </header>
    </c:otherwise>
</c:choose>