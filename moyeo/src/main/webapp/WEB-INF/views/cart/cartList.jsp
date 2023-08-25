<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="en">
  
<head>
	<jsp:include page="/WEB-INF/views/inc/head.jsp"/>
</head>     
  
<body id="body" class="up-scroll">
	<jsp:include page="/WEB-INF/views/inc/header.jsp"/>
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
              <h2 class="text-uppercase text-white font-weight-bold">장바구니</h2>
            </div>
            <p class="text-white mb-0"></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>


<!-- ====================================
———	cart SECTION
===================================== -->


<section class="cartList">
    <table border="1">
        <tr>
            <th>상품명</th>
            <th>성인 인원수</th>
            <th>소인 인원수</th>
            <th>총 가격</th>
            <th>삭제</th>
        </tr>
        
        <c:choose>
            <c:when test="${empty map.cartList}">
                <tr>
                    <td colspan="6">장바구니가 비어있습니다.</td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach var="cartItem" items="${map.cartList}">
                    <tr>
                        <form action="<c:url value='/cart/update'/>" method="post">
                            <td>${cartItem.pack_name}</td>
                            <td>
                                <input type="hidden" name="cartIdx" value="${cartItem.cart_idx}">
                                <input class="quantity-input" type="number" name="packAdultCount" value="${cartItem.pack_adultcount}" min="0">
                                <button type="button" class="quantity-btn plus-btn">+</button>
                                <button type="button" class="quantity-btn minus-btn">-</button>
                            </td>
                            <td>
                                <input class="quantity-input" type="number" name="packChildCount" value="${cartItem.pack_childcount}" min="0">
                                <button type="button" class="quantity-btn plus-btn">+</button>
                                <button type="button" class="quantity-btn minus-btn">-</button>
                            </td>	
                            <td>${cartItem.pack_totalprice}</td>
                            <td>
                                <button type="submit">수정</button>
                            </td>
                        </form>
                        <td><a href="<c:url value='/cart/delete'/>?cartIdx=${cartItem.cart_idx}">삭제</a></td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        
        <tr>
            <td colspan="4">총 합계</td>
            <td>${map.sumMoney}</td>
            <td></td>
        </tr>
    </table>
    
    <a href="<c:url value='/cart/insert'/>">장바구니에 상품 추가</a>
</section>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        $(".plus-btn").click(function() {
            var inputField = $(this).siblings(".quantity-input");
            var currentValue = parseInt(inputField.val());
            inputField.val(currentValue + 1);
        });

        $(".minus-btn").click(function() {
            var inputField = $(this).siblings(".quantity-input");
            var currentValue = parseInt(inputField.val());
            if (currentValue > 0) {
                inputField.val(currentValue - 1);
            }
        });
    });
</script>





<jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
  
  
  


	<!--메인 자바스크립트-->
	 <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/plugins/jquery/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/menuzord/js/menuzord.js"></script>
    
    <script src='${pageContext.request.contextPath}/assets/plugins/isotope/isotope.min.js'></script>
    <script src='${pageContext.request.contextPath}/assets/plugins/images-loaded/js/imagesloaded.pkgd.min.js'></script>
    <script src='${pageContext.request.contextPath}/assets/plugins/fancybox/jquery.fancybox.min.js'></script>
    
    <script src='${pageContext.request.contextPath}/assets/plugins/selectric/jquery.selectric.min.js'></script>
    <script src='${pageContext.request.contextPath}/assets/plugins/daterangepicker/js/moment.min.js'></script>
    <script src='${pageContext.request.contextPath}/assets/plugins/daterangepicker/js/daterangepicker.min.js'></script>
    
    <script src="${pageContext.request.contextPath}/assets/plugins/lazyestload/lazyestload.js"></script>
    <script src='${pageContext.request.contextPath}/assets/plugins/dzsparallaxer/dzsparallaxer.js'></script>
    
    
    
    
    
    <script src='${pageContext.request.contextPath}/assets/plugins/revolution/js/jquery.themepunch.tools.min.js'></script>
    <script src='${pageContext.request.contextPath}/assets/plugins/revolution/js/jquery.themepunch.revolution.min.js'></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/smoothscroll/SmoothScroll.js"></script>
    
    <script src="${pageContext.request.contextPath}/assets/js/star.js"></script>
  </body>
</html>
