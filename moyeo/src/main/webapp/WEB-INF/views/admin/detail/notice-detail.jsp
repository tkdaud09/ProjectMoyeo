<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html lang="en">
  
<head>
<style>
    .btn_section{
       text-align: center;
       margin-top: 70px;
   }
    
   .btn_section button{
      width: 130px;
      padding: 8px;
        border: none;
        font-size: 0.9em;
        letter-spacing: 2px;
        cursor: pointer;
   }
    
   .btn_section .btn{
      background: #eee;
      margin-right: 5px;
   }
    
   .btn_section .enroll_btn{
      background:#000;
      color:#fff;
   }

</style>
</head>     

<body id="body" class="up-scroll">
  <div class="main-wrapper packages-grid">


<!-- ====================================
———   PAGE TITLE
===================================== -->
<section class="page-title">
  <div class="page-title-img bg-img bg-overlay-darken" style="background-image: url(${pageContext.request.contextPath}/assets/img/pages/page-title-bg6.jpg);">
    <div class="container">
      <div class="row align-items-center justify-content-center" style="height: 200px;">
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
———   DIY SECTION
===================================== -->


<section class="">
  <div class="container">
         <div class="py-10">
         <div class="review_content">
         
            <div class="diy_form_title">
               공지사항 작성
            </div>
            
            <div class="write_form">
            
            
            
            
            
            <form class="w_f" action="addNotice" method="post" id="enrollForm" enctype="multipart/form-data">            
                   <p>작성자</p>
                        <input class="text" type="text" name="userinfoId"
                           value="${userinfo.id }" readonly>

                        <p>제목</p>
                   <input class="text" type="text" name="noticeTitle" placeholder="제목">
                   
                   <p>파일</p>
                   <input type="file" name="noticeImgFile" id="noticeImgFile">
                  
                   <p>내용</p>
                   <textarea name="noticeContent" placeholder="내용"></textarea>
                   
                   <div class="btn_section">
                       <button type="button" id="cancelBtn" class="btn">취 소</button>
                       <button id="enrollBtn" class="btn enroll_btn">등 록</button>
                   </div>
               </form>

   
               
            </div>

         </div><!-- /diy_content -->
      </div>   <!-- /py-10 -->
    </div>   <!-- /container -->
   
    
 
    
   
    
    
</section>
 </div>


 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 
    <script>
       let enrollForm = $("#enrollForm");
       
       $(document).ready(function() {
           // 취소 버튼 클릭 시
           $("#cancelBtn").click(function() {
               // 페이지 이동
               location.href = "${pageContext.request.contextPath}/notice/";
           });
       });

       //등록 버튼
       $("#enrollBtn").click(function(e) {
           e.preventDefault();
           enrollForm.submit();
       });
   </script>
  



  </body>
</html>