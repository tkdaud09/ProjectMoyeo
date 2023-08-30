<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html lang="utf-8">

<style>



</style>



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

———	TOUR PACKAGES SECTION

===================================== -->





<section class="bg-smoke py-10">

  <div class="container">

   



    <div id="filters" class="button-group">

      <button class="button is-checked" data-filter="*">전체상품</button>

      <button class="button" data-filter=".A">나홀로</button>

      <button class="button" data-filter=".I">아이와 함께</button>

      <button class="button" data-filter=".H">배려와 함께</button>

	  <button class="button" data-filter=".P">동물과 함께</button>

	  <button class="button" data-filter=".C">연인과 함께</button>

	  <button class="button" data-filter=".F">친구과 함께</button>

    </div>





	<div class="row grid">

	

	

	<c:forEach items="${packList}" var="pack">

	

      <div class="col-md-6 col-lg-4 mb-5 element-item  ${pack.packKind}">

        <div class="card card-hover">

          <a href="${pageContext.request.contextPath}/package/detail/${pack.packIdx}" class="position-relative">

            <img class="card-img-top lazyestload" data-src="${pageContext.request.contextPath}/assets/img/upload/${pack.packPreviewImg}" src="${pageContext.request.contextPath}/assets/img/upload/${pack.packPreviewImg}" alt="Card image cap">

            <div class="card-img-overlay card-hover-overlay rounded-top d-flex flex-column">

             

			<%--

			<div class="badge bg-primary badge-rounded-circle">

                <span class="d-block">

                  50%<br>off

                </span>

              </div>

			 --%>

			

        

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

                

                <%-- 

                  <h3 class="text-primary">${pack.packAdultPrice}원</h3>

                 <p class="mb-0 text-capitalize">소인 가격</p>

                <h3 class="text-primary">${pack.packChildPrice}원</h3>

                --%>

             

                

              </div>

              

              <%--

               <div>

                <a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#inquiry" class="btn btn-xs btn-outline-secondary text-uppercase">Inquiry</a>

              </div>

               --%>

             

            </div>

          </div>

        </div>

      </div>

      </c:forEach>

      

      <%--



      <div class="col-md-6 col-lg-4 mb-5 element-item child">

        <div class="card card-hover">

          <a href="single-package-right-sidebar.html" class="position-relative">

            <img class="card-img-top lazyestload" data-src="${pageContext.request.contextPath}/assets/img/home/deal/deal-02.jpg" src="${pageContext.request.contextPath}/assets/img/home/deal/deal-02.jpg" alt="Card image cap">

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

                  <li class="border-right border-white pe-2">12 days</li>

                  <li class="border-right border-white px-2">3 hrs</li>

                  <li class="ps-2">12 min</li>

                </ul>

              </small>

            </div>

          </a>

        

          <div class="card-body px-4">

            <h5 class="">

              <a href="single-package-right-sidebar.html" class="card-title text-uppercase">Eros Erat Tour</a>

            </h5>

            <p class="mb-5">Proin convallis magna vel libero accumsan sollicitudin. Quisque dapibus vitae turpis eu magna

              sagittis.</p>

            <div class="d-flex justify-content-between align-items-center">

              <div>

                <p class="mb-0 text-capitalize">Start from</p>

                <h3 class="text-primary">$499</h3>

              </div>

              <div>

                <a href="booking-step-1.html" class="btn btn-xs btn-outline-secondary text-uppercase">Book now</a>

              </div>

            </div>

          </div>

        </div>

      </div>



      <div class="col-md-6 col-lg-4 mb-5 element-item alone animal">

        <div class="card card-hover">

          <a href="single-package-right-sidebar.html" class="position-relative">

            <img class="card-img-top lazyestload" data-src="${pageContext.request.contextPath}/assets/img/home/deal/deal-03.jpg" src="${pageContext.request.contextPath}/assets/img/home/deal/deal-03.jpg" alt="Card image cap">

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

                  <li class="border-right border-white pe-2">17 days</li>

                  <li class="border-right border-white px-2">14 hrs</li>

                  <li class="ps-2">10 min</li>

                </ul>

              </small>

            </div>

          </a>

        

          <div class="card-body px-4">

            <h5>

              <a href="single-package-right-sidebar.html" class="card-title text-uppercase">Quisque Tour</a>

            </h5>

            <p class="mb-5">Vivamus eu mattis nibh. Quisque eget ipsum at odio fringilla consequat vel id erat. Suspendisse non

              feugiat mi.</p>

            <div class="d-flex justify-content-between align-items-center">

              <div>

                <p class="mb-0 text-capitalize">Start from</p>

                <h3 class="text-primary">$349</h3>

              </div>

              <div>

                <a href="single-package-fullwidth.html" class="btn btn-xs btn-outline-secondary text-uppercase">Details</a>

              </div>

            </div>

          </div>

        </div>

      </div>



      <div class="col-md-6 col-lg-4 mb-5 element-item couple">

        <div class="card card-hover">

          <a href="single-package-right-sidebar.html" class="position-relative">

            <img class="card-img-top lazyestload" data-src="${pageContext.request.contextPath}/assets/img/packages/package-01.jpg" src="${pageContext.request.contextPath}/assets/img/packages/package-01.jpg" alt="Card image cap">

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

                  <li class="border-right border-white pe-2">25 days</li>

                  <li class="border-right border-white px-2">01 hrs</li>

                  <li class="ps-2">03 min</li>

                </ul>

              </small>

            </div>

          </a>

        

          <div class="card-body px-4">

            <h5 class="">

              <a href="single-package-right-sidebar.html" class="card-title text-uppercase">Blandit Tour</a>

            </h5>

        

            <p class="mb-5">Sagittis proin convallis magna vel libero accumsan sollicitudin. Quisque dapibus vitae turpis eu

              magna.</p>

        

            <div class="d-flex justify-content-between align-items-center">

              <div>

                <p class="mb-0 text-capitalize">Start from</p>

                <h3 class="text-primary">$199</h3>

              </div>

              <div>

                <a href="single-package-fullwidth.html" class="btn btn-xs btn-outline-secondary text-uppercase">Details</a>

                <a href="" class="btn btn-xs btn-outline-secondary px-3">

                  <i class="fas fa-map-marker-alt" aria-hidden="true"></i>

                </a>

              </div>

            </div>

          </div>

        </div>

      </div>



      <div class="col-md-6 col-lg-4 mb-5 element-item alone consideration">

        <div class="card card-hover">

          <a href="single-package-right-sidebar.html" class="position-relative">

            <img class="card-img-top lazyestload" data-src="${pageContext.request.contextPath}/assets/img/packages/package-02.jpg" src="${pageContext.request.contextPath}/assets/img/packages/package-02.jpg" alt="Card image cap">

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

                  <li class="border-right border-white pe-2">27 days</li>

                  <li class="border-right border-white px-2">05 hrs</li>

                  <li class="ps-2">33 min</li>

                </ul>

              </small>

            </div>

          </a>

        

          <div class="card-body px-4">

            <h5 class="">

              <a href="single-package-right-sidebar.html" class="card-title text-uppercase">Turpis Eu Tour</a>

            </h5>

        

            <p class="mb-5">Suspendisse non feugiat mi. Vivamus eu mattis nibh. Quisque eget ipsum at odio fringilla consequat

              vel id erat.</p>

        

            <div class="d-flex justify-content-between align-items-center">

              <div>

                <p class="mb-0 text-capitalize">Start from</p>

                <h3 class="text-primary">$249</h3>

              </div>

              <div>

                <a href="booking-step-1.html" class="btn btn-xs btn-outline-secondary text-uppercase">Book</a>

                <a href="" class="btn btn-xs btn-outline-secondary px-3">

                  <i class="fas fa-map-marker-alt" aria-hidden="true"></i>

                </a>

              </div>

            </div>

          </div>

        </div>

      </div>



      <div class="col-md-6 col-lg-4 mb-5 element-item couple">

        <div class="card card-hover">

          <a href="single-package-right-sidebar.html" class="position-relative">

            <img class="card-img-top lazyestload" data-src="${pageContext.request.contextPath}/assets/img/packages/package-03.jpg" src="${pageContext.request.contextPath}/assets/img/packages/package-03.jpg" alt="Card image cap">

            <div class="card-img-overlay card-hover-overlay rounded-top d-flex flex-column">

              <div class="badge bg-primary badge-rounded-circle">

                <span class="d-block">

                  50%<br>off

                </span>

              </div>

        

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

                  <li class="border-right border-white pe-2">35 days</li>

                  <li class="border-right border-white px-2">11 hrs</li>

                  <li class="ps-2">03 min</li>

                </ul>

              </small>

            </div>

          </a>

        

          <div class="card-body px-4">

            <h5>

              <a href="single-package-right-sidebar.html" class="card-title text-uppercase">Pharetra Tour</a>

            </h5>

            <p class="mb-5">Donec rutrum lectus et pharetra egestas. Integer purus ex, dictum nec elementum eu, tristique vel

              lectus.</p>

        

            <div class="d-flex justify-content-between align-items-center">

              <div>

                <p class="mb-0 text-capitalize">Start from</p>

                <h3 class="text-primary">$149</h3>

              </div>

              <div>

                <a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#inquiry" class="btn btn-xs btn-outline-secondary text-uppercase">Inquiry</a>

                <a href="" class="btn btn-xs btn-outline-secondary px-3">

                  <i class="fas fa-map-marker-alt" aria-hidden="true"></i>

                </a>

              </div>

            </div>

          </div>

        </div>

      </div>



      <div class="col-md-6 col-lg-4 mb-5 mb-lg-0 element-item alone friend">

        <div class="card card-hover">

          <a href="single-package-right-sidebar.html" class="position-relative">

            <img class="card-img-top lazyestload" data-src="${pageContext.request.contextPath}/assets/img/packages/package-04.jpg" src="${pageContext.request.contextPath}/assets/img/packages/package-04.jpg" alt="Card image cap">

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

                  <li class="border-right border-white pe-2">07 days</li>

                  <li class="border-right border-white px-2">15 hrs</li>

                  <li class="ps-2">20 min</li>

                </ul>

              </small>

            </div>

          </a>

        

          <div class="card-body px-4">

            <h5 class="">

              <a href="single-package-right-sidebar.html" class="card-title text-uppercase">France / Europe</a>

            </h5>

        

            <p class="mb-5">Suspendisse non feugiat mi. Vivamus eu mattis nibh. Quisque eget ipsum at odio fringilla consequat vel id erat.</p>

        

            <div class="d-flex justify-content-between align-items-center">

              <div>

                <p class="mb-0 text-capitalize">Start from</p>

                <h3 class="text-primary">$150</h3>

              </div>

              <div>

                <a href="single-package-fullwidth.html" class="btn btn-xs btn-outline-secondary text-uppercase">Details</a>

                <a href="" class="btn btn-xs btn-outline-secondary px-3">

                  <i class="fas fa-map-marker-alt" aria-hidden="true"></i>

                </a>

              </div>

            </div>

          </div>

        </div>

      </div>



      <div class="col-md-6 col-lg-4 mb-5 mb-lg-0 element-item animal">

        <div class="card card-hover">

          <a href="single-package-right-sidebar.html" class="position-relative">

            <img class="card-img-top lazyestload" data-src="${pageContext.request.contextPath}/assets/img/packages/package-05.jpg" src="${pageContext.request.contextPath}/assets/img/packages/package-05.jpg" alt="Card image cap">

            <div class="card-img-overlay card-hover-overlay rounded-top d-flex flex-column">

              <div class="badge bg-primary badge-rounded-circle">

                <span class="d-block">

                  50%<br>off

                </span>

              </div>

        

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

                  <li class="border-right border-white pe-2">07 days</li>

                  <li class="border-right border-white px-2">15 hrs</li>

                  <li class="ps-2">20 min</li>

                </ul>

              </small>

            </div>

          </a>

        

          <div class="card-body px-4">

            <h5 class="">

              <a href="single-package-right-sidebar.html" class="card-title text-uppercase"> Europe / France</a>

            </h5>

        

            <p class="mb-5">Suspendisse non feugiat mi. Vivamus eu mattis nibh. Quisque eget ipsum at odio fringilla consequat vel id erat.</p>

        

            <div class="d-flex justify-content-between align-items-center">

              <div>

                <p class="mb-0 text-capitalize">Start from</p>

                <h3 class="text-primary">$150</h3>

              </div>

              <div>

                <a href="single-package-fullwidth.html" class="btn btn-xs btn-outline-secondary text-uppercase">Details</a>

                <a href="" class="btn btn-xs btn-outline-secondary px-3">

                  <i class="fas fa-map-marker-alt" aria-hidden="true"></i>

                </a>

              </div>

            </div>

          </div>

        </div>

      </div>



      <div class="col-md-6 col-lg-4 element-item child friend">

        <div class="card card-hover">

          <a href="single-package-right-sidebar.html" class="position-relative">

            <img class="card-img-top lazyestload" data-src="${pageContext.request.contextPath}/assets/img/packages/package-06.jpg" src="${pageContext.request.contextPath}/assets/img/packages/package-06.jpg" alt="Card image cap">

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

                  <li class="border-right border-white pe-2">07 days</li>

                  <li class="border-right border-white px-2">15 hrs</li>

                  <li class="ps-2">20 min</li>

                </ul>

              </small>

            </div>

          </a>

        

          <div class="card-body px-4">

            <h5 class="">

              <a href="single-package-right-sidebar.html" class="card-title text-uppercase"> Europe / France</a>

            </h5>

        

            <p class="mb-5">Suspendisse non feugiat mi. Vivamus eu mattis nibh. Quisque eget ipsum at odio fringilla consequat vel id erat.</p>

        

            <div class="d-flex justify-content-between align-items-center">

              <div>

                <p class="mb-0 text-capitalize">Start from</p>

                <h3 class="text-primary">$150</h3>

              </div>

              <div>

                <a href="single-package-fullwidth.html" class="btn btn-xs btn-outline-secondary text-uppercase">Details</a>

                <a href="" class="btn btn-xs btn-outline-secondary px-3">

                  <i class="fas fa-map-marker-alt" aria-hidden="true"></i>

                </a>

              </div>

            </div>

          </div>

        </div>

      </div>

      

      

      

       --%>

      

      

      

      

    </div>	







</section>









<!-- element wrapper ends -->



  







  </body>

</html>