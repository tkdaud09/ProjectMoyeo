<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Security 태그 라이브러리를 JSP 문서에 포함 - Spring Security 관련 태그 사용 가능 --%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

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
                       <sec:authorize access="isAuthenticated()">
                       <form action="<c:url value="/logout"/>" method="post">
							<sec:csrfInput/>
							<button type="submit">로그아웃</button>
					   </form>
                       </sec:authorize>      
                    </li>
                  <li class="me-6">
                     <sec:authorize access="hasRole('ROLE_USER')">
                     <a href="${pageContext.request.contextPath}/user/mypage">마이페이지</a>
                     </sec:authorize>
                  </li>
                  <li class="me-6">
                     <sec:authorize access="hasRole('ROLE_USER')">
                     <a href="${pageContext.request.contextPath}/cart/list">장바구니</a>
                     </sec:authorize>
                  </li>
                  <li class="me-6">
                     <sec:authorize access="isAnonymous()">
                            <a href="${pageContext.request.contextPath}/user/login">로그인</a>
                         </sec:authorize>
                      </li>
                      <li class="me-6">
                     <sec:authorize access="isAnonymous()">
                            <a href="${pageContext.request.contextPath}/user/join">회원가입</a>
                         </sec:authorize>
                      </li>
                      <li class="me-6">
                         <sec:authorize access="hasRole('ROLE_ADMIN')">
                            <a href="${pageContext.request.contextPath}/admin/main">관리자페이지</a>
                         </sec:authorize>   
                      </li>
                  <li class="me-6">
                     <a href="${pageContext.request.contextPath}/user/center">고객센터</a>
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
                        <a href="${pageContext.request.contextPath}/event/">이벤트</a>
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
   </body>
</html>
   