<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="en">
  
<head>
</head>     
  
<body id="body" class="up-scroll">

  <div class="main-wrapper packages-grid"></div>


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
					여행 후기
				</div>
				
				<div class="bord_search">
					<div class="search-area">
						<div class="sel-search">
							<select class="sel-base" id="schKeyword">
								<option value="both">제목+내용</option>
								<option value="sub">제목</option>
								<option value="cont">내용</option>
							</select>
						</div>
						<div class="inp-search">
							<input  type="text" class="inp-base" id="schValue" placeholder="검색어를 입력하세요">
							<button class="btn-type-s search" id="btnSearch">검색</button>
						</div>
					</div><!-- search-area -->
					
					
					
				</div>
				
				
				
				
				<div class="review_list">
					
					<table>
					<colgroup>
						<col width="10%">
						<col width="65%">
						<col width="10%">
						<col width="15%">
					</colgroup>
						<tr>
							<td class="t1">번호</td>
							<td class="t1">제목</td>
							<td class="t1">작성자</td>
							<td class="t1">작성일</td>
						</tr>
						
						<c:forEach var="review" items="${reviewList }">
							<tr>
								<td class="t2">${review.reviewIdx }</td>
								<td class="t2">
									<a href="<c:url value="/review/view"/>">
										${review.reviewTitle }
									</a>
								</td>

								<td class="t2">${review.userinfoId }</td>
								<td class="t2">${review.reviewRegdate }</td>
							</tr>
							<tr>
								<td class="t2">1</td>
								<td class="t2">제목이 들어갈 공간입니다.</td>
								<td class="t2">홍길동</td>
								<td class="t2">2023-08-24</td>
							</tr>
						</c:forEach>
					</table>
					

					<a href="${pageContext.request.contextPath}/review/write"><button class="btn">글쓰기</button></a>
				</div>


			</div><!-- /review_content -->
		</div>	<!-- /py-10 -->
    </div>	<!-- /container -->
</section>


  
  
  

  </body>
</html>
