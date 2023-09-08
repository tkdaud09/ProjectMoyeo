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
        ——— DIY SECTION
        ===================================== -->

        <section>
            <div class="container">
                <div class="py-10">
                    <div class="review_content">
                        <div class="diy_form_title">
                            여행 후기 작성
                        </div>
                        <div class="write_form">
                            <form class="w_f" action="${pageContext.request.contextPath}/review/add" method="post" id="enrollForm">
                                <p>작성자</p>
                                <input class="text" type="text" name="userinfoId" value="${userinfo.id}" readonly>

                                <p>별점 선택</p>
                                <input class="text" type="number" name="reviewStar" min="1" max="5" placeholder="1~5까지 별점을 입력해 주세요" required>
	
								<p>패키지 상품</p>
							    <select name="">
							        <option>선택</option>
							        <option>반려견과 함께하는 1박2일 투어 1</option>
							        <option>반려견과 함께하는 1박2일 투어 2</option>
							        <option>반려견과 함께하는 1박2일 투어 3</option>
							        <option>반려견과 함께하는 1박2일 투어 4</option>
							    </select>
	
                                <p>제목</p>
                                <input class="text" type="text" name="reviewTitle" placeholder="제목" required>

                                <p>내용</p>
                                <textarea name="reviewContent" placeholder="내용" required></textarea>

                                <div class="review_form_btn">
                                    <a href="${pageContext.request.contextPath}/review/list">
                                        <button class="btn1" id="cancelBtn" type="button">취소</button>
                                    </a>
                                    <button class="btn2" id="enrollBtn" type="submit">등록</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    
    <script>
        let enrollForm = $("#enrollForm");

        // 취소 버튼
        $("#cancelBtn").click(function() {
            console.log("취소 버튼 클릭됨");
            location.href = "${pageContext.request.contextPath}/review/list";
        });

        // 등록 버튼
        $("#enrollBtn").click(function(e) {
            e.preventDefault();
            console.log("등록 버튼 클릭됨");
            enrollForm.submit();
        });
    </script>
</body>
</html>
