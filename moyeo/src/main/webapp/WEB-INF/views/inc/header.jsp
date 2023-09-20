 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



 <!-- ====================================
  ———HEADER
  ===================================== -->
   <p>User Status: ${userinfo.status}</p>
   <p>User name: ${userinfo.name}</p>
   <p>User id: ${userinfo.id}</p>
   
   
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
                 
                    <!-- <i class="fa fa-user me-2"></i> -->
                    
                      <a href="${pageContext.request.contextPath}/admin/center">고객센터</a>
                    
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
      
             
                
                <ul class="menuzord-menu menuzord-right">
                
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

                    </ul>
                  </li>
      
                  <li class="">
                    <a href="javascript:void(0)">공지사항</a>
      
                    <ul class="dropdown drop-up">
                     
                        <li class="">
                           <a href="${pageContext.request.contextPath}/notice/">공지사항</a>
                         </li>
                     
                     
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
             
            </div>
      
            <div class="col-5">
              <ul class="list-inline d-flex justify-content-end mb-0">
      
                <li class="me-6">
                  
                      <a href="${pageContext.request.contextPath}/user/logout">로그아웃</a>
                    
                  
                </li>
      
              <li class="me-6">
                 
                    <!-- <i class="fa fa-user me-2"></i> -->
                    
                      <a href="${pageContext.request.contextPath}/admin/main">관리자페이지</a>
                    
                </li>
      
               <li class="me-6">
                 
                    <!-- <i class="fa fa-user me-2"></i> -->
                    
                      <a href="${pageContext.request.contextPath}/admin/center">고객센터</a>
                    
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
      
               
                
                <ul class="menuzord-menu menuzord-right">
                 
      
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
      
                     
      
      
      
                    </ul>
                  </li>
      
                  <li class="">
                    <a href="javascript:void(0)">공지사항</a>
      
                    <ul class="dropdown drop-up">
                     
                        <li class="">
                           <a href="${pageContext.request.contextPath}/notice/">공지사항</a>
                         </li>
                     
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
                 
                    <!-- <i class="fa fa-user me-2"></i> -->
                    
                      <a href="${pageContext.request.contextPath}/admin/center">고객센터</a>
                    
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
      
                
                <ul class="menuzord-menu menuzord-right">
                 
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
      
                    </ul>
                  </li>
      
                  <li class="">
                    <a href="javascript:void(0)">공지사항</a>
      
                    <ul class="dropdown drop-up">
                     
                        <li class="">
                           <a href="${pageContext.request.contextPath}/notice/">공지사항</a>
                         </li>
                     
                     
              </div>
            </div>
          </nav>
        </header>
    </c:otherwise>
</c:choose>