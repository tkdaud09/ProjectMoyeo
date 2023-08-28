<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="utf-8">
  

<body id="body" class="up-scroll">

  <div class="main-wrapper packages-grid">


<!-- ====================================
———	PAGE TITLE
===================================== -->
<!-- <section class="page-title">
  <div class="page-title-img bg-img bg-overlay-darken" style="background-image: url(assets/img/pages/page-title-bg13.jpg);">
    <div class="container">
      <div class="row align-items-center justify-content-center" style="height: 200px;">
        <div class="col-lg-6">
          <div class="page-title-content">
            <div class="">
              <h2 class="text-uppercase text-white font-weight-bold">City Museum Tour</h2>
            </div>
            <p class="text-white mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section> -->

<div class="pack_detail_title">
	<p>${pack.packTitle} </p>
</div>

<!-- ====================================
———	PACKAGES SECTION
===================================== -->
<section class="py-10 pd">
  <div class="container">
    <div class="row">
      <div class="col-md-5 col-lg-4 order-2">
        <form class="" action="index.html" method="GET">
          <div class="card border">
            <h2 class="card-header text-uppercase text-center bg-smoke border-bottom">
              옵션선택
            </h2>

            <div class="card-body px-3 py-4">
              <div class="border-bottom mb-5">
                <div class="form-group mb-5">
                  <div class="row">
                    <label for="inputTime" class="col-xl-5 col-form-label text-center text-xl-right px-2">여행 일정</label>

                    <div class="col-xl-7">
                      <div class="form-group form-group-icon form-group-icon-category-2 mb-0">
                        <i class="far fa-calendar-alt" aria-hidden="true"></i>
                        <input type="text" class="form-control daterange-picker-category-2" autocomplete="off" name="dateRange" value=""
                          placeholder="MM/DD/YYYY">
                      </div>
                    </div>
                  </div>
                </div>

                <!-- <div class="form-group mb-5">
                  <div class="row">
                    <label for="inputTime" class="col-xl-5 col-form-label text-center text-xl-right px-2">Select a time
                      slot:</label>
                    <div class="col-xl-7">
                      <div class="form-group mb-0">
                        <div class="select-default select-category-2 timer">
                          <select class="select-option">
                            <option>9:00 AM</option>
                            <option>10:00 AM</option>
                            <option>11:00 AM</option>
                            <option>12:00 AM</option>
                            <option>13:00 AM</option>
                            <option>14:00 AM</option>
                            <option>15:00 AM</option>
                            <option>16:00 AM</option>
                          </select>
                        </div>
                      </div>
                    </div>
                  </div>
                </div> -->

                <div class="form-group mb-5">
                  <div class="row align-items-center">
                    <label class="control-label col-xl-5 text-center text-xl-right">성인</label>

                    <div class="col-xl-5">
                      <div class="count-input mx-auto">
                        <a class="incr-btn" data-action="decrease" href="javascript:void(0)">–</a>
                        <input class="quantity" type="number" value="1">
                        <a class="incr-btn" data-action="increase" href="javascript:void(0)">+</a>
                      </div>
                    </div>

                    <div class="col-xl-2">
                      <p class="text-center mt-3 mt-xl-0 mb-0">50원</p>
                    </div>
                  </div>
                </div>

                <div class="form-group mb-5">
                  <div class="row align-items-center">
                    <label class="control-label col-xl-5 text-center text-xl-right">소인</label>

                    <div class="col-xl-5">
                      <div class="count-input mx-auto">
                        <a class="incr-btn" data-action="decrease" href="javascript:void(0)">–</a>
                        <input class="quantity" type="number" value="0">
                        <a class="incr-btn" data-action="increase" href="javascript:void(0)">+</a>
                      </div>
                    </div>

                    <div class="col-xl-2">
                      <p class="text-center mt-3 mt-xl-0 mb-0">50원</p>
                    </div>
                  </div>
                </div>
              </div>

              <div class="d-flex justify-content-between border-bottom mb-5 pb-5">
                <span class="text-uppercase h4 mb-0">Total cost</span>
                <span class="font-weight-bold text-primary h3 mb-0">$158</span>
              </div>

              <div class="text-center px-4">
                <button type="button" onclick="location.href='booking-step-1.html';"
                  class="btn btn-hover btn-lg btn-block btn-outline-secondary text-uppercase bsize">
                  예약하기 <span class="ms-4"><i class="fa fa-angle-right" aria-hidden="true"></i></span>
                </button>
				 <button type="button" onclick="location.href='booking-step-1.html';"
                  class="btn btn-hover btn-lg btn-block btn-outline-secondary text-uppercase bsize">
                  장바구니 <span class="ms-4"><i class="fa fa-angle-right" aria-hidden="true"></i></span>
                </button>
				 <button type="button" onclick="location.href='booking-step-1.html';"
                  class="btn btn-hover btn-lg btn-block btn-outline-secondary text-uppercase bsize">
                  하트수정<span class="ms-4"><i class="fa fa-angle-right" aria-hidden="true"></i></span>
                </button>
              </div>
            </div>
          </div>
        </form>
      </div>

      <div class="col-md-7 col-lg-8">
        <div id="package-slider" class="owl-carousel owl-theme package-slider">
          <div class="item">
            <img class="lazyestload" data-src="${pageContext.request.contextPath}/assets/img/packages/package-slider-03.jpg" src="${pageContext.request.contextPath}/assets/img/packages/package-slider-03.jpg" alt="image">
          </div>

          <div class="item">
            <img class="lazyestload" data-src="${pageContext.request.contextPath}/assets/img/packages/package-slider-04.jpg" src="${pageContext.request.contextPath}/assets/img/packages/package-slider-04.jpg" alt="image">
          </div>

          <div class="item">
            <img class="lazyestload" data-src="${pageContext.request.contextPath}/assets/img/packages/package-slider-05.jpg" src="${pageContext.request.contextPath}/assets/img/packages/package-slider-05.jpg" alt="image">
          </div>
        </div>

		

		<div class="package_con">
			<div class="pack_img1">
				<img src="${pageContext.request.contextPath}/assets/img/packages/pack_img_calendar.png">
			</div>
			<div class="pack_text">여행 상세 내용이 들어갈 공간 </div>
		</div>

     

        <div class="mb-7">
          <h2 class="text-uppercase mb-6">Reviews</h2>
          <p class="mb-6">Pulla consuat sed libero eu feugiat. Praesent vel hendrerit erat. Phasellus gravida efficitur
            lectus, placerat semper
            est tristique nec. Proin magna enim</p>

          <div class="d-flex align-items-center mb-6">
            <h3 class="text-uppercase mb-0">
              <span class="me-2">Reviews (3)</span>

              <span class="text-warning">
                <i class="fa fa-star" aria-hidden="true"></i>
                <i class="fa fa-star" aria-hidden="true"></i>
                <i class="fa fa-star" aria-hidden="true"></i>
                <i class="fa fa-star" aria-hidden="true"></i>
                <i class="fas fa-star-half-alt" aria-hidden="true"></i>
              </span>
            </h3>
          </div>

          <div class="media mb-6">
            <a class="me-6" href="">
              <img class="rounded lazyestload" data-src="${pageContext.request.contextPath}/assets/img/blog/comments-02.jpg" src="${pageContext.request.contextPath}/assets/img/blog/comments-02.jpg" alt="Generic placeholder image">
            </a>

            <div class="media-body">
              <h5>Samanta Doe</h5>
              <span class="star add-rating-default pb-1"></span>
              <p class="mb-0">Pellen tesque vitae ultrices magna. Cras vul putate commodo justo. Fusce vitae justo
                efficitur, condi mentum ante.</p>
            </div>
          </div>

          <div class="media mb-6">
            <a class="me-6" href="">
              <img class="rounded lazyestload" data-src="${pageContext.request.contextPath}/assets/img/blog/comments-01.jpg" src="${pageContext.request.contextPath}/assets/img/blog/comments-01.jpg" alt="Generic placeholder image">
            </a>

            <div class="media-body">
              <h5>Amanda Smith</h5>
              <span class="star add-rating-default pb-1"></span>
              <p class="mb-0">Nunc ultricies dui sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                incididunt ut labore et dolore magna
                aliqua.</p>
            </div>
          </div>

          <div class="media">
            <a class="me-6" href="">
              <img class="rounded lazyestload" data-src="${pageContext.request.contextPath}/assets/img/blog/comments-03.jpg" src="${pageContext.request.contextPath}/assets/img/blog/comments-03.jpg" alt="Generic placeholder image">
            </a>
            <div class="media-body">
              <h5>Rodney Artichoke</h5>
              <span class="star add-rating-default pb-1"></span>
              <p class="mb-0">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque
                laudan totam rem ape riam</p>
            </div>
          </div>
        </div>

        <form class="mb-9 mb-md-0">
          <h3 class="text-uppercase mb-6">Leave your review</h3>

          <p class="rating-view d-flex align-items-center">
            <span class="content-view">Want to Rate it?</span>
            <span class="star add-rating-default ms-2"></span>
          </p>

          <div class="form-group mb-6">
            <textarea class="form-control border-0 bg-smoke" placeholder="Comment" rows="6"></textarea>
          </div>

          <div class="">
            <button type="button" onclick="location.href='javascript:void(0)';"
              class="btn btn-hover btn-outline-secondary text-uppercase">
              Submit
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</section>

<!-- ====================================
———	PACKAGES LIKE SECTION
===================================== -->
<!-- <section class="pb-10">
  <div class="container">
    <div class="text-uppercase mb-4">
      <h2 class="mb-0">you may also like</h2>
    </div>
    <div class="row">
      <div class="col-md-6 col-lg-4 mb-5 mb-lg-0">
        <div class="card card-bg">
          <a href="single-package-right-sidebar.html" class="position-relative">
            <img class="card-img-top lazyestload" data-src="assets/img/home/deal/deal-01.jpg" src="assets/img/home/deal/deal-01.jpg" alt="Card image cap">
            <div class="card-img-overlay card-hover-overlay rounded-top d-flex flex-column">
              <div class="badge bg-primary badge-rounded-circle">
                <span class="d-block">
                  45%<br>off
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

              <ul class="list-unstyled d-flex text-white font-weight-bold mb-0">
                <li class="border-right border-white pe-2">7 days</li>
                <li class="border-right border-white px-2">15 hrs</li>
                <li class="ps-2">15 min</li>
              </ul>
            </div>
          </a>

          <div class="card-body">
            <h5>
              <a href="single-package-right-sidebar.html" class="card-title text-uppercase">France / Paris</a>
            </h5>

            <p class="mb-7">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt
              labore dolore.</p>

            <div class="d-flex justify-content-between align-items-center">
              <div>
                <p class="mb-0 text-capitalize">Start from</p>
                <h3 class="text-primary">$299</h3>
              </div>

              <div>
                <a href="single-package-fullwidth.html" class="btn btn-xs btn-outline-secondary text-uppercase">Details</a>
                <a href="" class="btn btn-xs btn-outline-secondary px-4">
                  <i class="fas fa-map-marker-alt" aria-hidden="true"></i>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="col-md-6 col-lg-4 mb-5 mb-lg-0">
        <div class="card card-bg">
          <a href="single-package-right-sidebar.html" class="position-relative">
            <img class="card-img-top lazyestload" data-src="assets/img/home/deal/deal-02.jpg" src="assets/img/home/deal/deal-02.jpg" alt="Card image cap">
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

              <ul class="list-unstyled d-flex text-white font-weight-bold mb-0">
                <li class="border-right border-white pe-2">7 days</li>
                <li class="border-right border-white px-2">15 hrs</li>
                <li class="ps-2">15 min</li>
              </ul>
            </div>
          </a>

          <div class="card-body">
            <h5>
              <a href="single-package-right-sidebar.html" class="card-title text-uppercase">Australia / Canberra</a>
            </h5>

            <p class="mb-7">Integer purus ex, dictum nec elementum eu, tristique vel lectus. Donec rutrum lectus et
              pharetra
              egestas.</p>

            <div class="d-flex justify-content-between align-items-center">
              <div>
                <p class="mb-0 text-capitalize">Start from</p>
                <h3 class="text-primary">$299</h3>
              </div>

              <div>
                <a href="single-package-fullwidth.html" class="btn btn-xs btn-outline-secondary text-uppercase">Details</a>
                <a href="" class="btn btn-xs btn-outline-secondary px-4">
                  <i class="fas fa-map-marker-alt" aria-hidden="true"></i>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="col-md-6 col-lg-4">
        <div class="card card-bg">
          <a href="single-package-right-sidebar.html" class="position-relative">
            <img class="card-img-top lazyestload" data-src="assets/img/home/deal/deal-03.jpg" src="assets/img/home/deal/deal-03.jpg" alt="Card image cap">
            <div class="card-img-overlay card-hover-overlay rounded-top d-flex flex-column">
              <div class="badge bg-primary badge-rounded-circle">
                <span class="d-block">
                  40%<br>off
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

              <ul class="list-unstyled d-flex text-white font-weight-bold mb-0">
                <li class="border-right border-white pe-2">7 days</li>
                <li class="border-right border-white px-2">15 hrs</li>
                <li class="ps-2">15 min</li>
              </ul>
            </div>
          </a>

          <div class="card-body">
            <h5>
              <a href="single-package-right-sidebar.html" class="card-title text-uppercase">Jarmani / Berlin</a>
            </h5>

            <p class="mb-7">Donec lacus felis, dapibus males uada massa non, ferm entum tincidunt quam. Orci varius
              natoque.</p>

            <div class="d-flex justify-content-between align-items-center">
              <div>
                <p class="mb-0 text-capitalize">Start from</p>
                <h3 class="text-primary">$299</h3>
              </div>

              <div>
                <a href="single-package-fullwidth.html" class="btn btn-xs btn-outline-secondary text-uppercase">Details</a>
                <a href="" class="btn btn-xs btn-outline-secondary px-4">
                  <i class="fas fa-map-marker-alt" aria-hidden="true"></i>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
 -->


  </div><!-- element wrapper ends -->


   
  </body>
</html>

