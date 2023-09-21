<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>    
<!DOCTYPE html>
<html lang="en" >
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
                    1:1 문의
                </div>
				<div class="border_view">
				    <div class="view">
				        <h3 class="tit">${qa.qaTitle}</h3>
				        <p class="t1">작성자: ${qa.userinfoId}</p>
				        <p class="t1">작성일: ${qa.qaRegdate}</p>
				        <%--  <p class="t1">수정일: ${qa.qaModifyDate}</p>--%>
				    </div><hr>
					<div class="view_con">${qa.qaContent}</div>
					 <div class="view_img">
                        <img
                           src="<c:url value='/assets/img/upload/${qa.qaImg1}'/>"
                           alt="">
                        <img
                           src="<c:url value='/assets/img/upload/${qa.qaImg2}'/>"
                           alt="">
                        <img
                           src="<c:url value='/assets/img/upload/${qa.qaImg3}'/>"
                           alt="">                    	
                     </div>
					<div class="border_btn">
						<div class="list_btn"><a href="${pageContext.request.contextPath}/qa/list">목록</a></div>
						<sec:authorize access="isAuthenticated()">
                        <sec:authorize access="hasRole('ROLE_ADMIN')" var="adminRole"/>
                        <sec:authentication property="principal" var="pinfo"/>   
						<c:if test="${adminRole || pinfo.id eq qa.userinfoId}">
						<div class="list_btn sp"><a href="${pageContext.request.contextPath}/qa/modify/${qa.qaIdx}">수정</a></div>
						<div class="list_btn sp"><a href="${pageContext.request.contextPath}/qa/delete/${qa.qaIdx}">삭제</a></div>
						</c:if>               
                    	<sec:csrfInput/>
                     	</sec:authorize>
					</div>
				</div>
				
				<!-- 댓글 -->
				<ul id= "replyList">
					
					<c:forEach items="${reply}" var="reply">
						<li>
							<div>
								<p>${reply.userinfoId} / ${reply.qaReplyRegdate}</p>
					            <p id="qaReplyContent_${reply.qaReplyIdx}">${reply.qaReplyContent}</p>
					            <sec:authorize access="isAuthenticated()">
								<sec:authorize access="hasRole('ROLE_ADMIN')" var="adminRole"/>
								<c:if test="${adminRole}">
					            <p>
					                <a href="${pageContext.request.contextPath}/reply/modify?qaIdx=${reply.qaIdx}&qaReplyIdx=${reply.qaReplyIdx}">수정</a> /
					                <a href="javascript:;" class="deleteLink" data-qa-idx="${reply.qaIdx}" id="${reply.qaReplyIdx}">삭제</a>
					            </p>
					            </c:if>      
					            </sec:authorize>
					            <hr />
						 	</div>
						</li>	
					</c:forEach>
					
					
				</ul>
				
				<div>
					<form id="addReplyForm" method="post" action="${pageContext.request.contextPath}/reply/write">
						<sec:authorize access="isAuthenticated()">
						<sec:authorize access="hasRole('ROLE_ADMIN')" var="adminRole"/>
						<c:if test="${adminRole}">
						<p>
							<label>답글 작성자</label><input type="text" name="userinfoId" value="운영자" readonly>
							
						</p>
						<p>
							<textarea rows="5" cols="50" name="qaReplyContent"></textarea>
						</p>
						<p>
							<input type="hidden" name="qaIdx" value="${qa.qaIdx}">
							<input type="hidden" name="isAdmin" value="${isAdmin}">
							<button type="submit">답글 작성</button>
						</p>
						</c:if>
						<sec:csrfInput/>
						</sec:authorize>
					</form>
				</div>
				
				<!-- 댓글 끝 -->

            </div><!-- /diy_content -->
        </div> <!-- /py-10 -->
    </div> <!-- /container -->
</section>
  </div>

	<script>
	
	
	/* 댓글 추가 */
	$("#addReplyForm").submit(function(event) {		
		  var csrfHeaderName="${_csrf.headerName}";
    	  var csrfTokenValue="${_csrf.token}";
    	     
    	  //CSRF 토큰 전달
    	  $(document).ajaxSend(function(e, xhr) {
    	     xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
    	  }); 
		
    	  
	    event.preventDefault();
	    
	    var formData = $(this).serialize();
	   
	    
	    $.ajax({
	        type: "POST",
	        url: "${pageContext.request.contextPath}/reply/write",
	        data: formData,
	        success: function(response) {
	            // 서버에서 반환된 JSON을 사용하여 새로운 댓글을 추가
	            var newReply = 
	            	"<li><div><p>" + response.userinfoId + " / " + response.qaReplyRegdate + "</p><p>" + response.qaReplyContent + "</p><p><a href='#'>수정</a> / <a href='#'>삭제</a></p><hr /></div></li>";
	            $("#replyList").append(newReply);
	            
	            // 입력 필드 초기화
	            $("#qaReplyContent").val("");
	            
	            // 댓글 등록 폼 숨기기
	           // $("#addReplyForm").hide();
	        }
	    });
	});
	</script>
	
	
	<script>
		/*삭제*/
	
		$(document).on("click", ".deleteLink", function(event) {
			  var csrfHeaderName="${_csrf.headerName}";
	    	  var csrfTokenValue="${_csrf.token}";
	    	     
	    	  //CSRF 토큰 전달
	    	  $(document).ajaxSend(function(e, xhr) {
	    	     xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	    	  }); 
			
		    event.preventDefault();

		    var qaReplyIdx = $(this).attr("id");
		    var qaIdx = $(this).data("qa-idx");
	
		    // 댓글 삭제 요청을 보내는 JSON 데이터 생성
		    var requestData = {
		        qaReplyIdx: qaReplyIdx,
		        qaIdx: qaIdx 
		    };
	
		    // AJAX를 사용하여 댓글 삭제 요청 보내기
		    $.ajax({
		        type: "POST",
		        url: "${pageContext.request.contextPath}/reply/delete",
		        contentType: "application/json",
		        data: JSON.stringify(requestData),
		        success: function(response) {
		            // 성공적으로 삭제되면 해당 댓글을 화면에서 제거
		            $("#qaReplyContent_" + qaReplyIdx).parent().remove();
		        },
		        error: function(xhr, status, error) {
		            // 삭제에 실패한 경우 에러 처리
		            console.error("댓글 삭제 실패: " + error);
		        }
		    });
		});
	</script>

</body>
</html>
