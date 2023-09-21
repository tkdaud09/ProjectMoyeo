<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>    

<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html lang="en">

<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
			<div class="review_content border_con">
				
				<div class="diy_form_title">
					1:1 문의
				</div>
				
				<div class="bord_search">
					<div class="search-area">	
						<div class="sel-search">
							<select class="sel-base" id="schKeyword" name="searchType">
								<%-- <option value="both" >제목+내용</option> --%>
								<option value="title">제목</option>
								<option value="content">내용</option>
								<option value="writer">작성자</option>
							</select>
						</div>
							<div class="inp-search">
							    <input type="text" class="inp-base" id="schValue" placeholder="검색어를 입력하세요">
							    <button class="btn-type-s search" id="btnSearch" name="searchKeyword">검색</button>
							</div>
						
						<div style="float: right;">
						    <form action="${pageContext.request.contextPath}/qa/list" method="get">
						        <select id="pageSize" name="pageSize">
						            <option value="5" <c:if test="${pager.pageSize == 5}">selected</c:if>>5줄 보기</option>
						            <option value="10" <c:if test="${pager.pageSize == 10}">selected</c:if>>10줄 보기</option>
						            <option value="15" <c:if test="${pager.pageSize == 15}">selected</c:if>>15줄 보기</option>
						            <option value="20" <c:if test="${pager.pageSize == 20}">selected</c:if>>20줄 보기</option>
						        </select>
						        <%-- <button type="submit">변경</button> --%>
						    </form>
						</div>
						
					</div><!-- search-area -->
				</div>
				<div class="qa_list border_list">
					
					<table>
					    <colgroup>
					        <col width="10%">
					        <col width="60%">
					        <col width="10%">
					        <col width="10%">
					        <col width="10%">
					    </colgroup>
					    <tr>
					        <td class="t1">번호</td>
					        <td class="t1">제목</td>
					        <td class="t1">작성자</td>
					        <td class="t1">작성일</td>
					        <td class="t1">답변상태</td>
					    </tr>
					    <c:forEach var="qa" items="${qaList}">
					        <tr>
					            <td class="t2">${qa.qaIdx}</td>
					            <td class="t2">
					                <a href="${pageContext.request.contextPath}/qa/detail/${qa.qaIdx}">
					                    ${qa.qaTitle}
					                </a>
					            </td>
					            <td class="t2">${qa.userinfoId}</td>
					            <td class="t2">${qa.qaRegdate}</td>
					            <td class="t2">
								    <c:choose>
								        <c:when test="${qa.qaReplyStatus == 1}">
								        <span style="color: blue;">답변완료</span>
								        </c:when>
								        <c:otherwise>
								            답변대기
								        </c:otherwise>
								    </c:choose>	
								</td>
					        </tr>
					    </c:forEach>
					</table>
				<div class="page_t">	
					<%-- 페이지 번호 출력 --%>
					<c:choose >
						<c:when test="${pager.startPage > pager.blockSize }">
							<a href="<c:url value="/qa/list"/>?pageNum=${pager.prevPage}"><span class="p_prev">[이전]</span></a>
						</c:when>
						<c:otherwise>
							<!-- [이전] -->
						</c:otherwise>
					</c:choose>	
					
					<c:forEach var="i" begin="${pager.startPage }" end="${pager.endPage }" step="1">
						<c:choose>
							<c:when test="${pager.pageNum != i  }">
								<a href="<c:url value="/qa/list"/>?pageNum=${i}"><span class="p_num">${i }</span></a>
							</c:when>
							<c:otherwise>
								<span class="p_num">${i }</span>
							</c:otherwise>
						</c:choose>	
					</c:forEach>
					
				
					<c:choose >
						<c:when test="${pager.endPage != pager.totalPage }">
							<a href="<c:url value="/qa/list"/>?pageNum=${pager.nextPage}"><span class="p_next">[다음]</span></a>
						</c:when>
						<c:otherwise>
							[다음]
						</c:otherwise>
					</c:choose>		
				</div>
				<sec:authorize access="isAuthenticated()">
					<a href="${pageContext.request.contextPath}/qa/write" class="btn_right">
						<button class="btn">글쓰기</button>
					</a>
				</sec:authorize>
				</div>
			</div><!-- /review_content -->
		</div>	<!-- /py-10 -->
    </div>	<!-- /container -->
</section>


 </div>

 
    <script>
	 	// 페이지 로드 시 초기화 함수 호출
	    window.onload = initializePageSize;
	    var selectedValue = document.getElementById("pageSize").value
	    
	    /*페이징*/
	    function initializePageSize() {
	        var currentPageNum = ${pager.pageNum}; // 현재 페이지 번호
	
	        // 드롭다운 메뉴 변경 시 호출되는 함수
	        document.getElementById("pageSize").addEventListener("change", function () {
	            var selectedValue = this.value;
	
	            // 페이지 크기를 서버로 전달
	            window.location.href = "${pageContext.request.contextPath}/qa/list?pageNum=" + currentPageNum + "&pageSize=" + selectedValue;
	        });
	        
	        /*검색기능*/
	        document.getElementById("btnSearch").addEventListener("click", function () {
	            var searchKeyword = document.getElementById("schValue").value; // 검색어 추출
	            var searchType = document.getElementById("schKeyword").value; // 검색 유형 추출
	            
	            // 검색 결과 페이지로 이동 (서버로 검색어와 유형 전달)
	            window.location.href = "${pageContext.request.contextPath}/qa/list?pageNum=" + currentPageNum + "&pageSize=" + selectedValue + "&searchKeyword=" + searchKeyword + "&searchType=" + searchType;
	        });
	    }
    
	    let enrollForm = $("#enrollForm");
	    
	    // 취소 버튼
	    $("#cancelBtn").click(function() {
	        console.log("Cancel button clicked");
	        location.href = "/moyeo/qa/review_list";
	    });
	
	    // 등록 버튼
	    $("#enrollBtn").click(function(e) {
	        e.preventDefault();
	        console.log("Enroll button clicked");
	        enrollForm.submit();
   		 });
	    
   
	</script>
  

  </body>
</html>
