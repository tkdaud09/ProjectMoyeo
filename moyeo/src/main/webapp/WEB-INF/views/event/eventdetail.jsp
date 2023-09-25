<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html lang="utf-8">
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <style>
   .event-detail {
    display: flex;
    justify-content: center;
    align-items: center;
}
   </style>
</head>
<body id="body" class="up-scroll">
    <div class="main-wrapper packages-grid">

        <!-- ====================================
        ———    PAGE TITLE
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
        ———    event SECTION
        ===================================== -->
        <section class="">
            <div class="event-detail">
                <img class="lazyestload event-content" data-src="${pageContext.request.contextPath}/assets/img/upload/${event.eventContentimg}" src="${pageContext.request.contextPath}/assets/img/upload/${event.eventContentimg}" alt="image">
            </div>
            
            <div class="event-detail">
                <img class="lazyestload event-content" data-src="${pageContext.request.contextPath}/assets/img/upload/${event.eventContentimg2}" src="${pageContext.request.contextPath}/assets/img/upload/${event.eventContentimg2}" alt="image">
            </div>
            
            <div class="event-detail">
                <img class="lazyestload event-content" data-src="${pageContext.request.contextPath}/assets/img/upload/${event.eventContentimg3}" src="${pageContext.request.contextPath}/assets/img/upload/${event.eventContentimg3}" alt="image">
            </div>
            
            <div class="diy_form_title">
                <div class="tab-container">
                    <ul>
                        <li class="active"><a href="/moyeo/event/">진행 중인 이벤트</a></li>
                        <li><a href="/moyeo/event/close">종료된 이벤트</a></li>
                    </ul>
                </div>
            </div>
        </section>

        <script>
            // JavaScript를 사용하여 이미지 크기를 원본 크기로 설정
            $(document).ready(function () {
                var images = document.querySelectorAll(".event-content");

                images.forEach(function (image) {
                    var img = new Image();
                    img.src = image.src;
                    img.onload = function () {
                        image.width = img.width;
                        image.height = img.height;
                    };
                });
            });
        </script>
    </div>
</body>
</html>