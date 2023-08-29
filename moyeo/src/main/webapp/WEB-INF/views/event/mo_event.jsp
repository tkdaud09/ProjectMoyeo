<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
  <div class="page-title-img bg-img bg-overlay-darken" style="background-image: url(assets/img/pages/page-title-bg6.jpg);">
    <div class="container">
      <div class="row align-items-center justify-content-center" style="height: 200px;">
        <div class="col-lg-6">
          <div class="page-title-content">
            <div class="title-border">
              <h2 class="text-uppercase text-white font-weight-bold">이벤트</h2>
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
			<div class="diy_content">
				
				<div class="diy_form_title">
					이벤트
				</div>
				
				
				<div class="event_con">
					<ul>
						<li class="li_1"></li>
						<li class="li_2">제목이 들어갈 공간입니다.</li>
						<li class="li_3">2023-08-29</li>
					</ul>
					<ul>
						<li class="li_1"></li>
						<li class="li_2">제목이 들어갈 공간입니다.</li>
						<li class="li_3">2023-08-29</li>
					</ul>
					<ul>
						<li class="li_1"></li>
						<li class="li_2">제목이 들어갈 공간입니다.</li>
						<li class="li_3">2023-08-29</li>
					</ul>
					
				</div>
					
					
					
					
					
					
				<div class="page_t">	
					<%-- 페이지 번호 출력 --%>
					<c:choose >
						<c:when test="${pager.startPage > pager.blockSize }">
							<a href="<c:url value="/review/list"/>?pageNum=${pager.prevPage}"><!-- [이전] --></a>
						</c:when>
						<c:otherwise>
							<!-- [이전] -->
						</c:otherwise>
					</c:choose>	
					
					<c:forEach var="i" begin="${pager.startPage }" end="${pager.endPage }" step="1">
						<c:choose>
							<c:when test="${pager.pageNum != i  }">
								<a href="<c:url value="/review/list"/>?pageNum=${i}"><span class="p_num">${i }</span></a>
							</c:when>
							<c:otherwise>
								<span class="p_num">${i }</span>
							</c:otherwise>
						</c:choose>	
					</c:forEach>
				
					<c:choose >
						<c:when test="${pager.endPage != pager.totalPage }">
							<a href="<c:url value="/review/list"/>?pageNum=${pager.nextPage}"><span class="p_next"><!--[다음]  --></span></a>
						</c:when>
						<c:otherwise>
							<!--[다음]  -->
						</c:otherwise>
					</c:choose>	
				</div>	
					
					
			</div><!-- /diy_content -->
		</div>	<!-- /py-10 -->
    </div>	<!-- /container -->
</section>



  </body>
</html>

