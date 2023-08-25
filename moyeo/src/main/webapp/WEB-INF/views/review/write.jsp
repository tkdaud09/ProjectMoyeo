<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="en">
  
<head>
</head>     

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
              <h2 class="text-uppercase text-white font-weight-bold">여행후기</h2>
            </div>
            <p class="text-white mb-0"></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>


<!-- ====================================
———	DIY SECTION
===================================== -->


<section class="">
  <div class="container">
			<div class="py-10">
			<div class="review_content">
			
				<div class="diy_form_title">
					여행 후기 작성
				</div>
				
				<div class="write_form">
				
				
				
				
				
				<form class="w_f" action="add" method="post" id="enrollForm">		   	
					    <p>별점선택</p>
					    <p class="star">★★★☆☆</p>
					   
					   <!-- <p>패키지</p>
					    <select name="">
					        <option>선택</option>
					        <option>반려견과 함께하는 1박2일 투어 1</option>
					        <option>반려견과 함께하는 1박2일 투어 2</option>
					        <option>반려견과 함께하는 1박2일 투어 3</option>
					        <option>반려견과 함께하는 1박2일 투어 4</option>
					    </select> -->
					   
					    <p>제목</p>
					    <input class="text" type="text" name="reviewTitle" placeholder="제목">
					   
					    <p>내용</p>
					    <textarea name="reviewContent" placeholder="내용"></textarea>
					    
					    <div class="review_form_btn">
					        <button class="btn1" id="cancelBtn" type="button">취소</button>
					        <button class="btn2" id="enrollBtn" type="submit">등록 </button>
					    </div>
					</form>

					
					
					
					
				</div>

			</div><!-- /diy_content -->
		</div>	<!-- /py-10 -->
    </div>	<!-- /container -->
    
    
 
    
   
    
    
</section>



 
    <script>
	    let enrollForm = $("#enrollForm");
	    
	    // Cancel button
	    $("#cancelBtn").click(function() {
	        console.log("Cancel button clicked");
	        location.href = "/moyeo/review/review_list";
	    });
	
	    // Enroll button
	    $("#enrollBtn").click(function(e) {
	        e.preventDefault();
	        console.log("Enroll button clicked");
	        enrollForm.submit();
   	 });
	</script>
  








		




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

