<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
  
  
<body id="body" class="up-scroll">

  

<!-- ====================================
———	PAGE TITLE
===================================== -->
<section class="page-title">
  <div class="page-title-img bg-img bg-overlay-darken" style="background-image: url(assets/img/pages/page-title-bg7.jpg);">
    <div class="container">
      <div class="row align-items-center justify-content-center" style="height: 200px;">
        <div class="col-lg-6">
          <div class="page-title-content">
            <div class="title-border">
              <h2 class="text-uppercase text-white font-weight-bold">Booking step 2</h2>
            </div>
            <p class="text-white mb-0"></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>


<!-- ====================================
———	BOOKING SECTION
===================================== -->
<section class="py-8 py-md-10">
  <div class="container">
    <div class="mb-8">
      <div class="row progress-wizard">
        <div class="col-4 progress-wizard-step complete">
          <div class="progress">
            <div class="progress-bar"></div>
          </div>
      
          <a href="diy_add" class="progress-wizard-dot">
            <div class="progress-wizard-content">
              <i class="fa fa-user" aria-hidden="true"></i>
              <span class="d-block">1. Personal info</span>
            </div>
          </a>
        </div>
      
        <div class="col-4 progress-wizard-step active">
          <div class="progress">
            <div class="progress-bar"></div>
          </div>
      
          <a href="diy_list" class="progress-wizard-dot">
            <div class="progress-wizard-content">
              <i class="fas fa-dollar-sign" aria-hidden="true"></i>
              <span class="d-block">2. Payment info</span>
            </div>
          </a>
        </div>
      
        <div class="col-4 progress-wizard-step incomplete">
          <div class="progress">
            <div class="progress-bar"></div>
          </div>
      
          <a href="booking-step-3.html" class="progress-wizard-dot">
            <div class="progress-wizard-content">
              <i class="fa fa-check" aria-hidden="true"></i>
              <span class="d-block">3. Confirmation</span>
            </div>
          </a>
        </div>
      </div>
    </div>
    
    <div class="row">
      <div class="col-md-7 col-lg-8 order-1 order-md-0">
        <h3 class="text-capitalize mb-5">Billing address</h3>
    
        <form action="" method="post" target="_blank">
          <div class="mb-5">
            <div class="row">
              <div class="col-lg-6">
                <div class="form-group">
                  <label for="inputName">First Name</label>
                  <input type="text" class="form-control border-0 bg-smoke">
                </div>
              </div>
            
              <div class="col-lg-6">
                <div class="form-group">
                  <label for="inputName">Last Name</label>
                  <input type="text" class="form-control border-0 bg-smoke">
                </div>
              </div>
            
              <div class="col-lg-6">
                <div class="form-group">
                  <label for="inputName">Adderss 1</label>
                  <input type="text" class="form-control border-0 bg-smoke">
                </div>
              </div>
            
              <div class="col-lg-6">
                <div class="form-group">
                  <label for="inputName">Adderss 2</label>
                  <input type="text" class="form-control border-0 bg-smoke">
                </div>
              </div>
            
              <div class="col-lg-6">
                <div class="form-group">
                  <label for="inputName">City</label>
                  <input type="text" class="form-control border-0 bg-smoke">
                </div>
              </div>
            
              <div class="col-lg-6">
                <div class="form-group">
                  <label for="inputName">Zip Code</label>
                  <input type="number" class="form-control border-0 bg-smoke">
                </div>
              </div>
            
              <div class="col-lg-6">
                <div class="form-group">
                  <label for="inputName">State/Region</label>
                  <input type="text" class="form-control border-0 bg-smoke">
                </div>
              </div>
            
              <div class="col-lg-6">
                <div class="form-group">
                  <label for="inputName">Country</label>
                  <div class="select-default select-confirm">
                    <select class="select-option">
                      <option>Select Country</option>
                      <option>USA</option>
                      <option>UK</option>
                      <option>CANADA</option>
                    </select>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
          <div class="mb-8">
            <h3 class="text-capitalize mb-5">Card Info</h3>
            <div class="row">
              <div class="col-lg-6">
                <div class="form-group">
                  <label for="inputName">Card Name</label>
                  <input type="text" class="form-control border-0 bg-smoke">
                </div>
              </div>
            
              <div class="col-lg-6">
                <div class="form-group">
                  <label for="inputNumber">Card Number</label>
                  <input type="number" class="form-control border-0 bg-smoke">
                </div>
              </div>
            
              <div class="col-lg-6">
                <div class="form-group">
                  <label for="inputName">CVV</label>
                  <input type="text" class="form-control border-0 bg-smoke">
                </div>
              </div>
            
              <div class="col-lg-6">
                <div class="form-group">
                  <label for="inputNumber">Pay with</label>
                  <div class="row">
                    <div class="col-3 pe-lg-1 pe-xl-3">

                      <div class="img-overlay rounded">
                        <img class="w-100 lazyestload" data-src="assets/img/booking/master-card.jpg" src="assets/img/booking/master-card.jpg" alt="Generic placeholder image">
                        <a href="" class="hover-img-overlay-dark"></a>
                      </div>
                    </div>

                    <div class="col-3 px-lg-2 px-xl-3">
                      <div class="img-overlay rounded">
                        <img class="w-100 lazyestload" data-src="assets/img/booking/discover.jpg" src="assets/img/booking/discover.jpg" alt="Generic placeholder image">
                        <a href="" class="hover-img-overlay-dark"></a>
                      </div>
                    </div>

                    <div class="col-3 px-lg-2 px-xl-3">
                      <div class="img-overlay rounded">
                        <img class="w-100 lazyestload" data-src="assets/img/booking/visa.jpg" src="assets/img/booking/visa.jpg" alt="Generic placeholder image">
                        <a href="" class="hover-img-overlay-dark"></a>
                      </div>
                    </div>

                    <div class="col-3 ps-lg-1 ps-xl-3">
                      <div class="img-overlay rounded">
                        <img class="w-100 lazyestload" data-src="assets/img/booking/paypal.jpg" src="assets/img/booking/paypal.jpg" alt="Generic placeholder image">
                        <a href="" class="hover-img-overlay-dark"></a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-lg-6">
                <label for="exampleInputText">Expiration Date</label>
                <div class="form-group form-group-icon form-group-icon-default">
                  <i class="far fa-calendar-alt" aria-hidden="true"></i>
                  <input type="text" class="form-control border-0 bg-smoke" name="dateRange" value="" placeholder="DD/MM/YY">
                </div>
              </div>

              <div class="col-lg-6">
                <div class="form-group">
                  <label for="inputName">Security Code</label>
                  <input type="password" class="form-control border-0 bg-smoke">
                </div>
              </div>
            </div>
          </div>
          
          <div class="d-flex justify-content-between">
            <button type="button" onclick="location.href='diy_add';" class="btn btn-primary text-uppercase">
              Back
            </button>

            <button type="button" onclick="location.href='booking-step-3.html';" class="btn btn-primary text-uppercase">
              Confirm
            </button>
          </div>
        </form>
      </div>
    
      <div class="col-md-5 col-lg-4">
        <h3 class="mb-5">Booking Details</h3>
        <div class="card bg-smoke mb-6 mb-md-0">
          <img class="card-img-top lazyestload" data-src="assets/img/booking/booking.jpg" src="assets/img/booking/booking.jpg" alt="Card image cap">
          <div class="card-body">
            <h6 class="card-title text-dark">Maldives Tour</h6>
    
            <ul class="list-group list-group-flush">
              <li class="list-group-item bg-transparent border-top-0 px-0 py-4">
                <span><i class="far fa-calendar-alt me-1" aria-hidden="true"></i>From:</span>
                <span class="text-gray-color">25 Mar, 2019</span>
              </li>
    
              <li class="list-group-item bg-transparent px-0 py-4 border-off-white">
                <span><i class="far fa-calendar-alt me-1" aria-hidden="true"></i>To:</span>
                <span class="text-gray-color">28 Mar, 2019</span>
              </li>
    
              <li class="list-group-item bg-transparent px-0 py-4 border-off-white">
                <span><i class="fa fa-user me-1" aria-hidden="true"></i>Guests:</span>
                <span class="text-gray-color">2 Adults, 1Child</span>
              </li>
    
              <li class="list-group-item bg-transparent px-0 py-4 d-none"></li>
            </ul>
          </div>
    
          <div class="card-footer mt-6">
            <h2 class="mb-0">
              <span>Total:</span>
              <span class="text-primary font-weight-bold">$6,500</span>
            </h2>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>



  </div><!-- element wrapper ends -->

  <!-- ====================================
    ——— FOOTER SECTION
    ===================================== -->
   
  
    <!-- ====================================
    ——— MODAL SECTION
    ===================================== -->
    <!-- Signup Modal -->
    <div class="modal fade" id="signup" tabindex="-1" role="dialog" aria-label="signupModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header rounded">
            <h3 class="modal-title text-uppercase font-weight-bold">Create your account</h3>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>

          <div class="modal-body">
            <form class="" action="index.html" method="post">
              <div class="mb-3">
                <input type="text" class="form-control bg-smoke" required="" placeholder="Full Name">
              </div>

              <div class="mb-3">
                <input type="email" class="form-control bg-smoke" required="" placeholder="Email">
              </div>
    
              <div class="mb-3">
                <input type="password" class="form-control bg-smoke" required="" placeholder="Password">
              </div>
    
              <div class="mb-3 form-check mb-0">
                <input type="checkbox" class="form-check-input" id="exampleCheck4">
                <label class="form-check-label text-gray-color mb-3" for="exampleCheck4">
                  I agree to the terms of use and privacy.
                </label>
              </div>

              <div class="d-grid">
                <button type="submit" class="btn btn-primary btn-block text-uppercase">Login</button>
              </div>

              <div class="text-uppercase text-center py-3">Or</div>

              <div class="d-grid">
                <button type="submit" class="btn btn-facebook btn-block text-uppercase text-white">Login with facebook</button>
              </div>
            </form>
          </div>
    
          <div class="modal-footer justify-content-center">
            <p class="mb-1">Don’t have an Account? <a href="javascript:void(0)">Sign up</a></p>
          </div>
        </div>
      </div>
    </div>

    <!-- Login Modal -->
    <div class="modal fade" id="login" tabindex="-1" role="dialog" aria-label="loginModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header rounded">
            <h3 class="modal-title text-uppercase font-weight-bold">Log in to your account</h3>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>

          <div class="modal-body">
            <form class="" action="index.html" method="post">
              <div class="mb-3">
                <input type="email" class="form-control bg-smoke" required="" placeholder="Email">
              </div>

              <div class="mb-3">
                <input type="password" class="form-control bg-smoke" required="" placeholder="Password">
              </div>

              <div class="mb-3 form-check mb-0">
                <input type="checkbox" class="form-check-input" id="exampleCheck5">
                <label class="form-check-label text-gray-color mb-3" for="exampleCheck5">
                  Remember me
                </label>
                <a class="pull-right" href="javascript:void(0)">Fogot Password?</a>
             </div>

             <div class="d-grid">
              <button type="submit" class="btn btn-primary text-uppercase">Login</button>
             </div>

              <div class="text-uppercase text-center py-3">Or</div>

              <div class="d-grid">
                <button type="submit" class="btn btn-facebook text-uppercase text-white">Login with facebook</button>
               </div>
            </form>
          </div>

          <div class="modal-footer justify-content-center">
            <p class="mb-1">Don’t have an Account? <a href="javascript:void(0)">Sign up</a></p>
          </div>
        </div>
      </div>
    </div>

    <!-- INQUIRY IN MODAL -->
    <div class="modal fade" id="inquiry" tabindex="-1" role="dialog" aria-label="inquiryModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header rounded">
            <h3 class="modal-title text-uppercase font-weight-bold">Inquiry about tour</h3>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>

          <div class="modal-body pb-3">
            <form class="" action="index.html" method="post">
              <div class="mb-3">
                <input type="text" class="form-control bg-smoke" required="" placeholder="Your Name">
              </div>

              <div class="mb-3">
                <input type="email" class="form-control bg-smoke" required="" placeholder="Your Email">
              </div>
    
              <div class="mb-3">
                <input type="number" class="form-control bg-smoke" required="" placeholder="Phone Number">
              </div>

              <div class="mb-3">
                <textarea class="form-control bg-smoke" rows="6" placeholder="Message"></textarea>
              </div>
    
              <button type="submit" class="btn btn-primary text-uppercase">Submit</button>
            </form>
          </div>
        </div>
      </div>
    </div>

      <!-- Javascript -->
    
    <script src="${pageContext.request.contextPath}/assets/plugins/jquery/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/menuzord/js/menuzord.js"></script>
    
    <script src='${pageContext.request.contextPath}/assets/plugins/fancybox/jquery.fancybox.min.js'></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/lazyestload/lazyestload.js"></script>
    
    <script src='${pageContext.request.contextPath}/assets/plugins/selectric/jquery.selectric.min.js'></script>
    <script src='${pageContext.request.contextPath}/assets/plugins/daterangepicker/js/moment.min.js'></script>
    <script src='${pageContext.request.contextPath}/assets/plugins/daterangepicker/js/daterangepicker.min.js'></script>
    
    <script src="${pageContext.request.contextPath}/assets/plugins/smoothscroll/SmoothScroll.js"></script>
    
    <script src="${pageContext.request.contextPath}/assets/js/star.js"></script>
    
    <script src="${pageContext.request.contextPath}/assets/plugins/smoothscroll/SmoothScroll.js"></script>
    
    <script src="${pageContext.request.contextPath}/assets/js/star.js"></script>
  </body>
</html>