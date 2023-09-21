<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>  
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
              <h2 class="text-uppercase text-white font-weight-bold">공지사항 수정</h2>
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
               공지사항 수정
            </div>
            
            <div class="write_form">
            
            
            
            
            
            <form class="w_f" action="${pageContext.request.contextPath}/notice/modify" method="post" id="modifyForm" enctype="multipart/form-data">            
                   <p>공지사항 번호</p>
                        <input class="text" type="text" name="noticeIdx" value="${notice.noticeIdx }" readonly>
                  
                   <p>작성자</p>
                        <input class="text" type="text" name="userinfoId" value="${notice.userinfoId }" readonly>
                  <p>제목</p>
                         <input class="text" type="text" name="noticeTitle" value="${notice.noticeTitle}">
                   <p>파일</p>
                         <input type="file" name="noticeImgFile" id="noticeImgFile">
                           <img src="<c:url value='/assets/img/upload/${notice.noticeImg}'/>" alt="">
                    <p>내용</p>
                        <textarea name="noticeContent">${notice.noticeContent}</textarea>
                   <div class="btn_section">
                     <button type="button" id="listBtn" class="btn">목 록</button>
                       <button type="button" id="cancelBtn" class="btn">취 소</button>
                       <button id="modifyBtn" class="btn enroll_btn">수 정</button>
                   </div>
                   <sec:csrfInput/>
               </form>

   
               
            </div>

         </div><!-- /diy_content -->
      </div>   <!-- /py-10 -->
    </div>   <!-- /container -->
   
    
 
    
   
    
    
</section>
 </div>


  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
       let modifyForm = $("#modifyForm");
       
       //목록 버튼
       $("#listBtn").on("click", function(e) {
           location.href = "${pageContext.request.contextPath}/notice/";
       });
       
      // 취소 버튼
       $("#cancelBtn").click(function() {
           location.href = "${pageContext.request.contextPath}/notice/view/${notice.noticeIdx}" ;
           
       });
    
       // 수정 버튼
       $("#modifyBtn").click(function(e) {
           e.preventDefault();
           modifyForm.submit();
       });
   </script>
  



  </body>
</html>