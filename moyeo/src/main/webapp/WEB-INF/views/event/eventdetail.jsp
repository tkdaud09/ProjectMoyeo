<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html lang="utf-8">
<head><script src="https://code.jquery.com/jquery-3.6.0.min.js"></script></head>
  <style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }

    .event-detail {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh; /* 화면 높이를 100%로 채움 */
        overflow: hidden; /* 이미지가 넘칠 경우 숨김 처리 */
    }

    .event-content {
        width: 100%; /* 이미지의 너비를 100%로 설정하여 화면에 꽉 차도록 합니다. */
        max-height: 100%; /* 최대 높이를 화면 크기에 맞게 조절 */
        object-fit: cover; /* 이미지를 꽉 채우도록 설정 */
    }
</style>
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
              <h2 class="text-uppercase text-white font-weight-bold">이벤트</h2>
            </div>
            <p class="text-white mb-0"></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>


<!-- ====================================
———	event SECTION
===================================== -->


	<section class="">
            <div class="event-detail">
        <img  class="lazyestload" data-src="${pageContext.request.contextPath}/assets/img/upload/${event.eventContentimg}" src="${pageContext.request.contextPath}/assets/img/upload/${event.eventContentimg}" alt="image">
    </div>
        </section>

 <script>
       
    </script>




  </body>
</html>