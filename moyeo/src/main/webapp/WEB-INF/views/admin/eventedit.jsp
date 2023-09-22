<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>  
<!DOCTYPE html>
<html lang="utf-8">

<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
    .admin_content_wrap {
        max-width: 1200px;
        margin: 0 auto;
        height: 800px;
    }

    .admin_content_subject {
        text-align: center;
        font-size: 1.9em;
        padding: 40px;
        margin-top: -50px;
    }

    .admin_content_main {
        width: 500px;
        margin: 0 auto;
    }

    .form_section {
        margin: 35px;
        position: relative
    }

    .form_section_title {
        font-size: 1em;
        width: 170px;
        height: 20px;
        line-height: 31px;
        text-align: center;
    }

    .form_section_content {
        position: absolute;
        right: 0;
        top: 0;
    }

    .form_section_content input {
        width: 190px;
        height: 25px;
        border: 1px solid #8d8d8d;
        font-size: 0.6em;
        padding: 1px 5px;
    }

    .aihocf {
        font-size: 0.3px;
        display: block;
        position: absolute;
        left: 245px;
        top: 30px;
        width: 300px;
        color: #7d7d7d;
    }

    .cate_wrap {
        margin-left: -185px;
    }

    .cate_wrap span {
        font-size: 0.8em;
        margin-right: 30px;
    }

    .cate1 {
        font-size: 0.7em;
        width: 60px;
        height: 25px;
        padding: 0px 5px;
        border-radius: 4px;
    }

    .btn_section {
        text-align: center;
        margin-top: 70px;
    }

    .btn_section button {
        width: 130px;
        padding: 8px;
        border: none;
        font-size: 0.9em;
        letter-spacing: 2px;
        cursor: pointer;
    }

    .btn_section .btn {
        background: #eee;
        margin-right: 5px;
    }

    .btn_section .enroll_btn {
        background: #000;
        color: #fff;
    }
</style>

<body id="body" class="up-scroll">

    <div class="main-wrapper packages-grid">

        <!-- ====================================
    ———   PAGE TITLE
    ===================================== -->
        <section class="page-title">
         <div class="page-title-img bg-img bg-overlay-darken"
            style="background-image: url(${pageContext.request.contextPath}/assets/img/pages/page-title-bg13.jpg);">
            <div class="container">
               <div class="row align-items-center justify-content-center"
                  style="height: 200px;">
                  <div class="col-lg-6">
                     <div class="page-title-content">
                        <div class="">
                           <h2 class="text-uppercase text-white font-weight-bold">이벤트</h2>
                        </div>
                        <p class="text-white mb-0"></p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>

      <div class="pack_detail_title">
         <p></p>
      </div>
        <!-- ====================================
    ———   EVENT SECTION
    ===================================== -->
       <!-- 이벤트 수정 폼 -->
<div class="admin_content_wrap">
    <div class="admin_content_subject"><span>이벤트 수정</span></div>
    <div class="admin_content_main">
        <form action="${pageContext.request.contextPath}/admin/edit/${event.eventIdx}" method="post" id="editForm" enctype="multipart/form-data">
           <!-- 기존 이벤트 정보 표시 -->
           <div class="form_section">
               <div class="form_section_title">
                   <label>제목</label>
               </div>
               <div class="form_section_content">
                   <input name="eventTitle" placeholder="ex) 이벤트 제목을 입력하세요" value="${event.eventTitle}">
               </div>
           </div>

           <div class="form_section">
               <div class="form_section_title">
                   <label>이벤트 시작일자</label>
               </div>
               <div class="form_section_content">
                   <input type="date" name="eventStartdate" class="form-control festival-form-control" value="${event.eventStartdate}">
               </div>
           </div>

           <div class="form_section">
               <div class="form_section_title">
                   <label>이벤트 종료일자</label>
               </div>
               <div class="form_section_content">
                   <input type="date" name="eventEnddate" class="form-control festival-form-control" value="${event.eventEnddate}">
               </div>
           </div>

           <div class="form_section">
               <div class="form_section_title">
                   <label>미리보기 이미지</label>
               </div>
               <div class="form_section_content">
                   <input type="file" name="eventPreviewImgFile">
               </div>
           </div>

           <div class="form_section">
               <div class="form_section_title">
                   <label>이벤트 설명 이미지</label>
               </div>
               <div class="form_section_content">
                   <input type="file" name="eventContentImgFile">
               </div>
           </div>

           <div class="form_section">
               <div class="form_section_title">
                   <label>이벤트 내용</label>
               </div>
               <div class="form_section_content">
                   <textarea name="eventContent" rows="4" placeholder="ex) 이벤트 내용을 입력하세요">${event.eventContent}</textarea>
               </div>
           </div>

           <div class="btn_section">
               <a href="${pageContext.request.contextPath}/admin/event/" class="btn">취소</a>
                <button id="editBtn" class="btn enroll_btn">수정</button>
            </div>
            <sec:csrfInput/>
        </form>
    </div>
</div>
	<script
	      src="${pageContext.request.contextPath}/assets/plugins/jquery/jquery-3.4.1.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/assets/plugins/menuzord/js/menuzord.js"></script>

   <script
      src='${pageContext.request.contextPath}/assets/plugins/fancybox/jquery.fancybox.min.js'></script>

   <script
      src='${pageContext.request.contextPath}/assets/plugins/selectric/jquery.selectric.min.js'></script>
      
      
   <script
      src='${pageContext.request.contextPath}/assets/plugins/daterangepicker/js/moment.min.js'></script>
   <script
      src='${pageContext.request.contextPath}/assets/plugins/daterangepicker/js/daterangepicker.min.js'></script>
   <script
      src='${pageContext.request.contextPath}/assets/plugins/rateyo/jquery.rateyo.min.js'></script>
   <script
      src="${pageContext.request.contextPath}/assets/plugins/lazyestload/lazyestload.js"></script>

   <script
      src='${pageContext.request.contextPath}/assets/plugins/owl-carousel/owl.carousel.min.js'></script>


   <script
      src="${pageContext.request.contextPath}/assets/plugins/smoothscroll/SmoothScroll.js"></script>
   <script
      src='https://maps.googleapis.com/maps/api/js?key=AIzaSyDU79W1lu5f6PIiuMqNfT1C6M0e_lq1ECY'></script>
   <script src="${pageContext.request.contextPath}/assets/js/star.js"></script>

        <script>

            
           
        </script>

</body>

</html>