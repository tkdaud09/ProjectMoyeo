<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    ——— DIY SECTION
    ===================================== -->
    <section class="">
    <div class="container">
        <div class="py-10">
            <div class="review_content">
                <div class="diy_form_title">
                    공지사항
                </div>


				<div class="border_view">
				    <div class="view">
				        <h3 class="tit">${review.reviewTitle}</h3>
				        <p class="t1">작성자: ${userinfo.id}</p>
				        <p class="t1">작성일: ${review.reviewRegdate}</p>
				        <p class="t1">별점: ${review.reviewStar}</p>  
				    </div><hr>
					<div class="view_con">${review.reviewContent}</div>
					
					
					<div class="border_btn">
						<div class="list_btn"><a href="${pageContext.request.contextPath}/review/list">목록</a></div>
						<div class="list_btn sp"><a href="${pageContext.request.contextPath}/review/modify/{reviewIdx}">수정</a></div>
						
						<button type="button" class="list_btn sp"  id="deleteBtn" onclick="deleteReview(${review.reviewIdx});">삭제</button>
					</div>
				</div>
				

            </div><!-- /diy_content -->
        </div> <!-- /py-10 -->
    </div> <!-- /container -->
</section>
  </div>







	<script type="text/javascript">
	
	/*
	function deleteReview(reviewIdx) {
		if(confirm("자료를 정말로 삭제 하시겠습니까?")) {
			location.href="<c:url value="/review/delete"/>?reviewIdx="+reviewIdx;
		} 
	}

	*/
	
	
	
    function deleteReview(reviewIdx) {
        if (confirm("자료를 정말로 삭제 하시겠습니까?")) {
            fetch("${pageContext.request.contextPath}/review/delete/" + reviewIdx, {
                method: "DELETE"
            })
            .then(response => {
                if (response.ok) {
                    window.location.href = "${pageContext.request.contextPath}/review/list";
                } else {
                    alert("삭제 실패");
                }
            })
            .catch(error => {
                console.error("Error:", error);
                alert("삭제 중 에러가 발생했습니다.");
            });
        }
    }

	
	
	
	
	</script>






  
</body>
</html>