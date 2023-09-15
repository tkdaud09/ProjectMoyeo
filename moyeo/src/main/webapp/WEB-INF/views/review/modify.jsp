<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
    
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
			<div class="review_content border_con">
								
				<div class="diy_form_title">여행 후기 수정</div>

				
			<div class="write_form">
				
				
				<form class="w_f" action="<c:url value="/review/modify"/>" method="post" id="modifyForm" enctype="multipart/form-data">
			    <sec:csrfInput/>
			    <input type="hidden" name="pageNum" value="${search.pageNum }">
			    <input type="hidden" name="column" value="${search.column }">
			    <input type="hidden" name="keyword" value="${search.keyword }">
			    <input type="hidden" name="reviewIdx" value="${review.reviewIdx}">
			    <input type="hidden" name="userinfoId" value="${userinfo.id}">
				
				
				<p>작성자</p>
				<input class="text" type="text" name="userinfoId" value="${userinfo.id}" readonly>
			
				 <p>별점 선택</p>
                 <input class="text" type="number" name="reviewStar" min="1" max="5" id="reviewStar" value="${review.reviewStar}"required>

				<p>패키지 상품</p>
				<select name="packTitle" required>
				    <option value="">선택</option>
				    <c:forEach var="title" items="${packageTitles}">
				        <option value="${title}" <c:if test="${title eq review.packTitle}">selected</c:if>>${title}</option>
				    </c:forEach>
				</select>


			    
				<p>제목</p>
				<input class="text" type="text" name="reviewTitle" id="reviewTitle" value="${review.reviewTitle}"required>
			
				<p>내용</p>
				<textarea rows="5" cols="60" name="reviewContent" id="reviewContent" required>${review.reviewContent}</textarea>
				
				<p>파일</p>
                <input type="file" name="reviewImgFile" id="reviewImgFile">
                <img src="<c:url value='/assets/img/upload/${review.reviewImg}'/>" alt="">
                
				
				<div class="review_form_btn">
                     <button class="btn1" type="button" onclick="location.href='<c:url value="/review/list"/>';">취소</button>
               		<button class="btn2" type="submit">수정완료</button>
                 </div>		
                 	
				</form>
				

            </div>
				
				

				<script type="text/javascript">
				
				$("#modifyForm").submit(function() {
					if($("#reviewTitle").val()=="") {
						alert("제목을 입력해 주세요");
						return false;
					}
					
					if($("#reviewContent").val()=="") {
						alert("내용을 입력해 주세요");
						return false;
					}
				});
				</script>
				
				
				
				
			</div>
		</div>
	</div>
</section>
				
	</div>			
				
		               

</body>

</html>
