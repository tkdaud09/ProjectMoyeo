<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
            <div class="page-title-img bg-img bg-overlay-darken"
                style="background-image: url(${pageContext.request.contextPath}/assets/img/pages/page-title-bg6.jpg);">
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
		                    여행 후기 수정
		                </div>
		                <div class="write_form">
		
		                    <!-- 수정 폼 -->
							<form class="w_f" action="${pageContext.request.contextPath}/review/modify" method="post" id="modifyForm">
		                        <p>작성자</p>
		                        <input class="text" type="text" name="userinfoId" value="${review.userinfoId}" readonly>
		
		                        <p>별점선택</p>
		                        <input class="text" type="text" name="reviewStar" value="${review.reviewStar}">
		
		                        <p>패키지 상품</p>
							    <select name="">
							        <option>선택</option>
							        <option>반려견과 함께하는 1박2일 투어 1</option>
							        <option>반려견과 함께하는 1박2일 투어 2</option>
							        <option>반려견과 함께하는 1박2일 투어 3</option>
							        <option>반려견과 함께하는 1박2일 투어 4</option>
							    </select>
		
		                        <p>제목</p>
		                        <input class="text" type="text" name="reviewTitle" value="${review.reviewTitle}">
		
		                        <p>내용</p>
		                        <textarea name="reviewContent">${review.reviewContent}</textarea>
		
		
		
		                        <div class="review_form_btn">
		                            <a href="${pageContext.request.contextPath}/review/list">
		                                <button class="btn1" id="cancelBtn" type="button">취소</button>
		                            </a>
		                            <button class="btn2" id="modifyBtn" type="submit">수정완료</button>
		                        </div>
		                        
		                        <!-- 리뷰의 reviewIdx를 추가 -->
    							<input type="hidden" name="reviewIdx" value="${review.reviewIdx}">
		                    </form>
		
		                </div>
		            </div>
		        </div>
		    </div>
		</section>

    </div>



    <script>
	    // 수정 버튼 클릭 시 폼을 서버로 제출하는 함수
	    document.getElementById("modifyBtn").addEventListener("click", function () {
	        document.getElementById("modifyForm").submit();
	    });
	</script>

</body>

</html>
