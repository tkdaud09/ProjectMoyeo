<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>     

<body id="body" class="up-scroll">
  <div class="main-wrapper packages-grid">

    <!-- ====================================
    ——— PAGE TITLE
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
    ——— DIY SECTION
    ===================================== -->
    <section class="">
    <div class="container">
        <div class="py-10">
            <div class="review_content">
                <div class="diy_form_title">
                    1:1 문의 댓글 수정
                </div>

				
				<!-- 댓글 -->				
				<div>
					<form id="modifyQaReply" method="post" action="${pageContext.request.contextPath}/reply/modify">
						<p>
							<label>댓글 작성자</label><input type="text" name="userinfoId" value="${reply.userinfoId }" readonly>
							
						</p>
						<p>
							<textarea rows="5" cols="50" name="qaReplyContent">${reply.qaReplyContent}</textarea>
						</p>
						<p>
							<input type="hidden" name="qaIdx" value="${reply.qaIdx}">
							<input type="hidden" name="qaReplyIdx" value="${reply.qaReplyIdx}">
							
							<button type="submit">댓글 수정</button>
						</p>
					</form>
				</div>
				
				<!-- 댓글 끝 -->

            </div><!-- /diy_content -->
        </div> <!-- /py-10 -->
    </div> <!-- /container -->
</section>
  </div>

	<script>
	

	
	</script>

</body>
</html>