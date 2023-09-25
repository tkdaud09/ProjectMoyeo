<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="utf-8">
<style>
.btn-type-s.total {
    background-color: #ff891e;
    color: #fff;
    border: none;
    border-radius: 5px;
    margin-right: 10px;
}

  /* 검색된 게시글이 없을 때의 스타일 */
  .no-result-message {
    text-align: center; 
    margin-top: 1px; 
    font-size: 18px;
  }

</style>

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

              <h2 class="text-uppercase text-white font-weight-bold">패키지 여행</h2>

            </div>

            <p class="text-white mb-0"></p>

          </div>

        </div>

      </div>

    </div>

  </div>

</section>

<!-- ====================================

———   TOUR PACKAGES SECTION

===================================== -->

<section class="bg-smoke py-10">

  <div class="container">

   
<div class="bord_search">
   <form action="<c:url value="/package/"/>" method="post" class="search-area">   
      <!-- 
         <div class="sel-search">
            <select class="sel-base" id="schKeyword" name="type">
               <option value="TC">제목+내용</option>
               <option value="T">제목</option>
               <option value="C">내용</option>
            </select>
         </div>
      -->
     <!-- <div class="total-list">
         
      </div>
      <div class="inp-search">
         <button class="btn-type-s total" id="total">
            전체보기
         </button>
         <input type="text" class="inp-base" id="schValue" name="keyword" placeholder="패키지 이름을 입력하세요">
         <button class="btn-type-s search" id="btnSearch">검색</button>
      </div>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> -->
   </form>

   <div id="filters" class="button-group">
      <button class="button is-checked" data-filter="*">전체상품</button>
      <button class="button" data-filter=".A" value="pack_kind">나홀로</button>
      <button class="button" data-filter=".I" value="pack_kind">아이와 함께</button>
      <button class="button" data-filter=".H" value="pack_kind">배려와 함께</button>
      <button class="button" data-filter=".P" value="pack_kind">동물과 함께</button>
      <button class="button" data-filter=".C" value="pack_kind">연인과 함께</button>
      <button class="button" data-filter=".F" value="pack_kind">친구과 함께</button>
   </div>
</div>

   <div class="row grid">
		<c:choose>
			<c:when test="${empty result.packList}">
				<p class="no-result-message" colspan="5">검색된 게시글이 없습니다.</p>	
			</c:when>
		</c:choose>   

   <c:forEach items="${result.packList}" var="pack">

      <div class="col-md-6 col-lg-4 mb-5 element-item  ${pack.packKind}">

        <div class="card card-hover">

          <a href="${pageContext.request.contextPath}/package/detail/${pack.packIdx}" class="position-relative" style="width:100%; height:auto;">

            <img class="card-img-top lazyestload" data-src="${pageContext.request.contextPath}/assets/img/upload/${pack.packPreviewImg}" 
            	src="${pageContext.request.contextPath}/assets/img/upload/${pack.packPreviewImg}" alt="Card image cap" style="height:230px;">

            <div class="card-img-overlay card-hover-overlay rounded-top d-flex flex-column">

              <ul class="list-unstyled d-flex mt-auto text-warning mb-0">
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star" aria-hidden="true"></i>
                </li>
              </ul>
              <small>

                <ul class="list-unstyled d-flex text-white font-weight-bold mb-0">

                  <li class="border-right border-white pe-2">7 days</li>

                  <li class="border-right border-white px-2">15 hrs</li>

                  <li class="ps-2">15 min</li>

                </ul>

              </small>

            </div>

          </a>

          <div class="card-body px-4">

            <h5>

              <a href="${pageContext.request.contextPath}/package/detail/${pack.packIdx}" class="card-title text-uppercase">${pack.packTitle}</a>

            </h5>

            <p class="mb-5">${pack.packStartDate} ~ ${pack.packEndDate}</p>

            <div class="d-flex justify-content-between align-items-center">

              <div>

                <p class="mb-0 text-capitalize" id=price_id>성인 가격 : ${pack.packAdultPrice}원</p>

                <p class="mb-0 text-capitalize" id=price_id>소인 가격 : ${pack.packChildPrice}원</p>
              </div>
            </div>
          </div>
        </div>

      </div>

      </c:forEach>
      

    </div>   
    
    
    
    <div class="bord_search">
	     <form action="<c:url value="/package/"/>" method="post" class="search-area">
	     <div class="total-list">
	         
	      </div>
	      <div class="inp-search">
	         <button class="btn-type-s total" id="total">
	            전체보기
	         </button>
	         <input type="text" class="inp-base" id="schValue" name="keyword" placeholder="패키지 이름을 입력하세요">
	         <button class="btn-type-s search" id="btnSearch">검색</button>
	      </div>
	      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	   </form>
    </div>
    
    
    
         <div class="page_t">
            <%-- 페이지 번호 출력 --%>
            <c:choose>
               <c:when test="${result.pager.startPage > result.pager.blockSize }">
                  <a
                     href="<c:url value="/package/"/>?pageNum=${result.pager.prevPage}&keyword=${search.keyword}">
                     [이전]
                  </a>
               </c:when>
               <c:otherwise>
                   [이전]
               </c:otherwise>
            </c:choose>

            <c:forEach var="i" begin="${result.pager.startPage }"
               end="${result.pager.endPage }" step="1">
               <c:choose>
                  <c:when test="${result.pager.pageNum != i  }">
                     <a href="<c:url value="/package/"/>?pageNum=${i}&keyword=${search.keyword}"><span
                        class="p_num">${i }</span></a>
                  </c:when>
                  <c:otherwise>
                     <span class="p_num">${i }</span>
                  </c:otherwise>
               </c:choose>
            </c:forEach>

            <c:choose>
               <c:when test="${result.pager.endPage != result.pager.totalPage }">
                  <a
                     href="<c:url value="/package/"/>?pageNum=${result.pager.nextPage}&keyword=${search.keyword}"><span
                     class="p_next">
                        [다음]
                  </span></a>
               </c:when>
               <c:otherwise>
                   [다음] 
               </c:otherwise>
            </c:choose>
         </div>

</section>


<!-- element wrapper ends -->


<script>
/*
    var currentPageNum = ${pager.pageNum};

    document.getElementById("btnSearch").addEventListener("click", function () {
        var searchKeyword = document.getElementById("schValue").value; // 검색어 추출
      
        alert("currentPageNum = " + currentPageNum);
        // 검색 결과 페이지로 이동 (서버로 검색어와 유형 전달)
        window.location.href = "${pageContext.request.contextPath}/package/?pageNum=" + currentPageNum + "&keyword=" + searchKeyword;
    });
   
*/
    
   //필터 안에 버튼 클릭 시 
   /*
    const buttons = document.querySelectorAll("#filters button");
    buttons.forEach(button => {
    	button.addEventListener("click", function(){
    		document.querySelector(".search-area").submit();
    	});
    });
    */
    
    
    document.getElementById("total").addEventListener("click", function () {
        window.location.href = "${pageContext.request.contextPath}/package/";
    });
</script>

  </body>

</html>