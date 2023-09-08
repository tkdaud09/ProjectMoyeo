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
              <h2 class="text-uppercase text-white font-weight-bold">1:1 문의</h2>
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
					1:1 문의 작성
				</div>
				
				<div class="write_form">
				
				<form class="w_f" action="addQa" method="post" id="enrollForm" enctype="multipart/form-data">		   	
					    <p>작성자</p>
					    <input class="text" type="text" name="userinfoId" value="${userinfo.id }" readonly>
					   
					   <p>문의 유형</p>
					    <select name="qaOption">
					        <option>선택</option>
					        <option>유형 1</option>
					        <option>유형 2</option>
					        <option>유형 3</option>
					        <option>유형 4</option>					       
					    </select>
					   
					    <p>제목</p>
					    <input class="text" type="text" name="qaTitle" placeholder="제목">
					   
					    <p>내용</p>
					    <textarea name="qaContent" placeholder="내용"></textarea>
					    
					    <p>첨부파일 1</p>
					    <input type="file" id ="qaImgFile1" name="qaImgFile1">
					    
					    <p>첨부파일 2</p>
					    <input type="file" id ="qaImgFile2" name="qaImgFile2">
					    
					    <p>첨부파일 3</p>
					    <input type="file" id ="qaImgFile3" name="qaImgFile3">
					    
					    <div class="review_form_btn">
					        <a href="${pageContext.request.contextPath}/qa/list"><button class="btn1" id="cancelBtn" type="button">취소</button></a>
					        <button class="btn2" id="enrollBtn" type="submit">등록 </button>
					    </div>
					</form>
				</div>

			</div><!-- /diy_content -->
		</div>	<!-- /py-10 -->
    </div>	<!-- /container -->
   
    
 
    
   
    
    
</section>
 </div>


 
    <script>
	    let enrollForm = $("#enrollForm");
	    
	    // Cancel button
	    $("#cancelBtn").click(function() {
	        console.log("Cancel button clicked");
	        location.href = "${pageContext.request.contextPath}/qa/qa_list";
	    });
	
	    // Enroll button
	    $("#enrollBtn").click(function(e) {
	        e.preventDefault();
	        console.log("Enroll button clicked");
	        enrollForm.submit();
   	 });
	</script>
  



  </body>
</html>