<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> 
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
								
				<div class="diy_form_title">여행 후기</div>
				
				
				
					<div class="border_view">
					    <div class="view">
					        <h3 class="tit">${review.reviewTitle}</h3>
					        
					        <p class="t1">상품명: ${review.packTitle}</p>
					       
					        <p class="t1 review_view_star">별점:
							    <c:forEach var="i" begin="1" end="${review.reviewStar}">
							        <img src="${pageContext.request.contextPath}/assets/img/star-filled.png" alt="별">
							    </c:forEach>
							    <c:forEach var="i" begin="${review.reviewStar + 1}" end="5">
							        <img src="${pageContext.request.contextPath}/assets/img/star-empty.png" alt="별">
							    </c:forEach>
							</p>

					        <p class="t1">작성자: ${review.userinfoId}</p>
					        <p class="t1">작성일: <fmt:formatDate var="formattedDate" value="${review.reviewRegdate}" pattern="yyyy-MM-dd" />${formattedDate}</p>
					        <p class="t1">조회수: ${review.reviewViewcnt}</p>
					    </div>
		                <hr>
						<div class="view_con">${review.reviewContent}</div>
						<div class="view_img"> <img src="<c:url value='/assets/img/upload/${review.reviewImg}'/>"alt=""> </div>
						
						
						<div class="border_btn">
							<form method="get" id="linkForm">	
								<button class="list_btn" type="button" id="listBtn">목록</button>
								<sec:authorize access="isAuthenticated()">
								<sec:authorize access="hasRole('ROLE_ADMIN')" var="adminRole"/>
								<sec:authentication property="principal" var="pinfo"/>	
								<c:if test="${adminRole || pinfo.id eq review.userinfoId}">
								<button class="list_btn sp" type="button" id="modifyBtn">수정</button>
								<button class="list_btn sp" type="button" id="removeBtn">삭제</button>	
								</c:if>					
							<sec:csrfInput/>
							</sec:authorize>
							</form>
						</div>
					</div>
						
			
			
						
					<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
					
					<script type="text/javascript">
					    $("#listBtn").click(function() {
					        location.href = '<c:url value="/review/list"/>';
					    });
					
					    $("#modifyBtn").click(function() {
					        var reviewIdx = '${review.reviewIdx}'; // review.reviewIdx 값을 가져옴
					        location.href = '<c:url value="/review/modify"/>' + '?reviewIdx=' + reviewIdx; // 수정 페이지로 이동
					    });
			
					    
					    $("#removeBtn").click(function() {
					        if (confirm("게시글을 삭제 하시겠습니까?")) {
					            location.href = '<c:url value="/review/remove"/>?idx=${review.reviewIdx}&writer=${review.userinfoId}';
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