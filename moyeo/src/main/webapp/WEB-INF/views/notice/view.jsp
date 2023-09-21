<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
  
<head>
</head>     

<body id="body" class="up-scroll">
   <div class="main-wrapper packages-grid">

      <!-- ====================================
    ——— PAGE TITLE
    ===================================== -->
      <section class="page-title">
         <div class="page-title-img bg-img bg-overlay-darken"
            style="background-image: url(${pageContext.request.contextPath}/assets/img/pages/page-title-bg6.jpg);">
            <div class="container">
               <div class="row align-items-center justify-content-center"
                  style="height: 200px;">
                  <div class="col-lg-6">
                     <div class="page-title-content">
                        <div class="title-border">
                           <h2 class="text-uppercase text-white font-weight-bold">공지사항</h2>
                        </div>
                        <p class="text-white mb-0"></p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>

      <!-- ====================================
    ——— DIY SECTION
    ===================================== -->
      <section class="">
         <div class="container">
            <div class="py-10">
               <div class="review_content">
                  <div class="diy_form_title">공지사항</div>


                  <div class="border_view">
                     <div class="view">
                        <h3 class="tit">${notice.noticeTitle}</h3>
                        <p class="t1">작성자: ${notice.userinfoId}</p>
                        <p class="t1">작성일: ${notice.noticeRegDate }</p>
                        <p class="t1">조회수: ${notice.noticeViewcnt }</p>
                     </div>
                     <hr>
                     <div class="view_con">${notice.noticeContent}</div>
                     <div class="view_img">
                        <img
                           src="<c:url value='/assets/img/upload/${notice.noticeImg}'/>"
                           alt="">
                     </div>

                     <div class="border_btn">
                        <div class="list_btn">
                           <a href="${pageContext.request.contextPath}/notice/">목록</a>
                        </div>
                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <div class="list_btn sp">
                           <a
                              href="${pageContext.request.contextPath}/notice/modify/${notice.noticeIdx}">수정</a>
                        </div>

                        <!-- 폼 추가 
                                <form id="deleteForm" action="${pageContext.request.contextPath}/notice/delete/${notice.noticeIdx}" method="POST">-->
                                    <!-- CSRF 토큰 등을 포함하려면 여기에 추가 -->
                                    <!-- 예: <input type="hidden" name="_csrf" value="${_csrf.token}"> -->
                                
                                <!-- 삭제 버튼 -->
                                <button type="button" class="list_btn sp" id="deleteBtn">삭제</button>
                            </sec:authorize>
                            </div>
                  </div>

               </div>
               <!-- /diy_content -->
            </div>
            <!-- /py-10 -->
         </div>
         <!-- /container -->
      </section>
   </div>





<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
           // 삭제 버튼 클릭 이벤트 핸들러
        $("#deleteBtn").on("click", function() {
            if (confirm("자료를 정말로 삭제 하시겠습니까?")) {
                // 페이지 리다이렉션
                window.location.href = "${pageContext.request.contextPath}/notice/delete/${notice.noticeIdx}";
            }
        });
    </script>
</script>



</body>
</html>