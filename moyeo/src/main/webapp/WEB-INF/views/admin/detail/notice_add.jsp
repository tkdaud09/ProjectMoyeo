<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<style> 
.categories-sidebar-widget {
     max-width: 150px;
    margin-top: 150px;
    margin-left: 50px;
}
</style>
</head>
<body>
<!-- header -->
<header>
   <div id="page-header" class="notice">
        <div class="container">
            <div class="page-header-content text-center">
                <div class="page-header wsub">
                    <h1 class="page-title fadeInDown animated first">공지사항 등록</h1>
                </div><!-- / page-header -->
            </div><!-- / page-header-content -->
        </div><!-- / container -->
    </div><!-- / page-header -->
</header>
<!-- / header -->
<section id="contact">
    <div class="container">
        <div class="row">
             <div class="col-sm-6 form-container">
                <!-- contact form -->
                <div id="contact-form-1">
                <form id="contactForm" data-toggle="validator" action="<c:url value='/admin/notice_add'/>" method="post" enctype="multipart/form-data">
				    <div class="form-group">
				        <label for="title">제목</label>
				        <input name="title" type="text" class="form-control" id="title" placeholder="제목을 입력해주세요" required>
				        <div class="help-block with-errors"></div>
				    </div>
				    <div class="form-group">
				        <label for="message">내용</label>
				        <textarea name="content" id="message" class="form-control" rows="15" placeholder="내용을 입력해주세요" required></textarea>
				        <div class="help-block with-errors"></div>
				    </div>
				    <br>
				    <button type="button" id="addBtn" class="btn btn-md btn-primary-filled btn-form-submit btn-rounded">등록하기</button>
				    <div id="msgSubmit" class="h3 text-center hidden"></div>
				    <div class="clearfix"></div>
				</form>
                </div><!-- / contact form -->
            </div><!-- / form-container -->
        </div><!-- / row -->
    </div><!-- / container -->
</section>

<!-- javascript -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.easing.min.js"></script>

<!-- contact-form -->
<script src="${pageContext.request.contextPath}/resources/js/validator.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/form-scripts.js"></script>
<!-- / contact-form -->
<script>
	
	$(document).ready(function(){
		$("#addBtn").click(function() {
		    var formData = new FormData();
		    
	        formData.append("title", $("#title").val());
	        formData.append("content", $("#message").val());

	        $.ajax({
	            type: "POST",
	            url: "<c:url value='/admin/notice_add'/>",
	            data: formData,
	            contentType: false,
	            processData: false,
	            dataType: "text",
	            success: function(result) {
	                if (result == "success") {
		                alert("공지 사항을 등록하였습니다.");
	                    noticeDetail(idx);
	                }
	            },
	            error: function(xhr) {
	                alert("공지 사항 수정 중 오류가 발생하였습니다(" + xhr.status + ")");
	            }
	        });
		});
		
	});
</script>
<!-- / javascript -->
</body>

</html>