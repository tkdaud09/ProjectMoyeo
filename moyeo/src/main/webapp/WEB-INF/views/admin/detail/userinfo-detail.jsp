<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css" >
</head>
<body>
	<div id="preloader">
		<div class="spinner spinner-round"></div>
	</div>
	
	<!-- userifo-detail -->
<section id="userinfo">
    <div class="container">
        <div class="row">
        	<!-- userinfo -->
			<div class="col-sm-10 userinfo-info">
                <div id="userDetail" class="userinfo-info-content">
                    <h4>사용자 정보 <span class="pull-right"><button id="modify-userinfo" type="button" class="btn btn-sm btn-default btn-rounded no-margin"><i class="lnr lnr-pencil"></i><span>편집</span></button></span></h4>
                    <div class="row">

                        <div class="col-xs-6 col-sm-8 col-md-10">
                            <p>이 름: <span>${userinfo.name }</span></p>
                            <p>이메일: <span>${userinfo.email }</span></p>
                            <p>전화번호: <span>${userinfo.phone }</span></p>
                            <p>주소: <span>${userinfo.address }</span></p>
                            <p>상태: <span>${userinfo.status }</span></p>
                        </div>
                    </div><!-- / row -->
                    
                    <div id="edit-form" style="display: none;">
                    	<br>
                    	<h3>수정하세요</h3>
                    	<p> 이름 </p>
                    	<input id="aName" name="aName" value="${userinfo.name }">
                    	<hr>
                    	<p> 이메일 </p>
                    	<input id="aEmail" name="aEmail" value="${userinfo.email }">
                    	<hr>
                    	<p> 전화번호 </p>
                    	<input id="aPhone" name="aPhone" value="${userinfo.phone }">
                    	<hr>
                    	<p> 주소 </p>
                    	<input id="aAddress" name="aAddress" value="${userinfo.address }">
                    	<hr>
                    	<p> 상태 </p>
                    	<input id="aStatus" name="aStatus" value="${userinfo.status }">
                    	<hr>
                    	<!-- 수정 버튼 -->
                    	<button id="modifyBtn" type="submit">저장</button>
                    	<button id="cancelModifyBtn" type="button">취소</button>
                   	</div>
                </div><!-- /userinfo -->

                <div id="myDiy" class="userinfo-info-content">
                    <h4> DIY 내역 </h4>
                    <p class="space-bottom"></p>
                    <div id="diyListDiv"></div>
                    <div id="diyPageNumDiv"></div>
                </div>

                <div id="myQa" class="userinfo-info-content">
                    <h4> QnA 내역 </h4>
                    <p class="space-bottom"></p>
                    <div id="qaListDiv"></div>
                    <div id="qaPageNumDiv"></div>
                </div>
                
                <div id="myReview" class="userinfo-info-content">
                    <h4> 후기 내역 </h4>
                    <p class="space-bottom"></p>
                    <div id="reviewListDiv"></div>
                    <div id="reviewPageNumDiv"></div>
                </div>

				<div id="myPackageHeart" class="userinfo-info-content">
                    <h4> 하트 리스트 </h4>
                    <p class="space-bottom"></p>
                    <div id="heartListDiv"></div>
                    <div id="packageHeartPageNumDiv"></div>
                </div>
                <br>
                <button id="remove-userinfo" type="button" style="color: red;">회원 삭제</button>
            </div>
	
        </div><!-- / row -->
    </div>
</section>

<script type="text/javascript">

	var id = "${userinfo.id}"; // 전달받은 아이디
	var diyPage = 1;
	var qaPage = 1;
	var reviewPage = 1;
	var packageHeartPage = 1;
	
	function getMyUserinfosData(userinfoId, diyPageNum, qaPageNum, reviewPageNum, packageHeartPageNum) {
		id = userinfoId;
		diyPage = diyPageNum;
		qaPage = qaPageNum;
		reviewPage = reviewPageNum;
		packageHeartPage = packageHeartPageNum;

		$.ajax({
	        method: "GET",
	        url: "<c:url value ='/admin/userinfo-details'/>",
	        data: {
	            "id": id,
	            "diyPageNum": diyPageNum,
	            "qaPageNum": qaPageNum,
	            "reviewPageNum": reviewPageNum,
	            "packageHeartPageNum": packageHeartPageNum
	        },
	        dataType: "json",
	        success: function (result) {
	        	console.log(result);
	            // result 객체에서 myDiy, myQa, myReview myPackageHeart 데이터를 추출
	            var myDiyData = result.myDiy;
	            var myQaData = result.myQa;
	            var myReviewData = result.myReview;
	            var myPackageHeartData = result.myPackageHeart;
	
	            displayDiyData(myDiyData);
	            displayQaData(myQaData);
	            displayReviewData(myReviewData);
	            //displayPackageHeartData(myPackageHeartData);
	            console.log(myDiyData);
	            console.log(myQaData);
	            console.log(myReviewData);
	            //console.log(myPackageHeartData);
	            console.log(result);
	        },
	        error: function (xhr) {
	            alert("데이터를 불러오는 중에 오류가 발생했습니다. (에러 코드 = " + xhr.status + ")");
	        }
	    });
	}
	
	//Diy 데이터를 표시하는 함수
	function displayDiyData(myDiyData) {
		$("#diyListDiv").empty();
	    
	    var table = $("<table>").attr("id", "diyTable");
	    var thead = $("<thead>").append(
	        "<tr>" +
	        "<th>번호</th>" +
	        "<th>출발일</th>" +
	        "<th>도착일</th>" +
	        "<th>인원수</th>" +
	        "<th>지역</th>" +
	        "<th>총 가격</th>" +
	        "<th>좋아요수</th>" +
	        "<th>제목</th>" +
	        "<th>한줄평</th>" +
	        "</tr>"
	    );
	    
	    var tbody = $("<tbody>");
		
	    if (myDiyData.diyList.length == 0) { // 검색된 게시글이 없을 때
	        var row = "<tr>" +
	            "<td colspan='9'>Diy 내역이 없습니다.</td>" +
	            "</tr>";
	        tbody.append(row);
	    }
	    
	    for (var i = 0; i < myDiyData.diyList.length; i++) {
	        var diy = myDiyData.diyList[i];
	        var row = "<tr data-idx='" + diy.diyIdx + "'>" +
	            "<td>" + diy.diyIdx + "</td>" +
	            "<td>" + diy.diyStartdate + "</td>" +
	            "<td>" + diy.diyEnddate + "</td>" +
	            "<td>" + diy.diyPeople + "</td>" +
	            "<td>" + diy.diyLoc + "</td>" +
	            "<td>" + diy.diyPrice + "</td>" +
	            "<td>" + diy.loveCount + "</td>" +
	            "<td>" + diy.diyTitle + "</td>" +
	            "<td>" + diy.diyIntroduction + "</td>" +
	            "</tr>";
	        tbody.append(row);
	   	}
	
	    table.append(thead, tbody);
	    
	    $("#diyListDiv").append(table);
	    
	    diyPageNumDisplay(myDiyData.pager);
	}
	
	//Qa 데이터를 표시하는 함수
	function displayQaData(myQaData) {
		$("#qaListDiv").empty();
	    
	    var table = $("<table>").attr("id", "qaTable");
	    var thead = $("<thead>").append(
	        "<tr>" +
	        "<th>번호</th>" +
	        "<th>옵션</th>" +
	        "<th>제목</th>" +
	        "<th>내용</th>" +
	        "<th>등록일</th>" +
	        "</tr>"
	    );
	
	    var tbody = $("<tbody>");
	
	    if (myQaData.qaList.length == 0) { // 검색된 게시글이 없을 때
	        var row = "<tr>" +
	            "<td colspan='5'>Q&A 내역이 없습니다.</td>" +
	            "</tr>";
	        tbody.append(row);
	    }
	    
	    for (var i = 0; i < myQaData.qaList.length; i++) {
	        var qa = myQaData.qaList[i];
	        var row = "<tr data-idx='" + qa.qaIdx + "'>" +
	            "<td>" + qa.qaIdx + "</td>" +
	            "<td>" + qa.qaOption + "</td>" +
	            "<td>" + qa.qaTitle + "</td>" +
	            "<td>" + qa.qaContent + "</td>" +
	            "<td>" + qa.qaRegdate + "</td>" +
	            "</tr>";
	        tbody.append(row);
	   	}
	
	    table.append(thead, tbody);
	    
	    $("#qaListDiv").append(table);
	    
	    qaPageNumDisplay(myQaData.pager);
	}
	
	// Review 데이터를 표시하는 함수
	function displayReviewData(myReviewData) {
	    $("#reviewListDiv").empty();

	    var table = $("<table>").attr("id", "reviewTable");
	    var thead = $("<thead>").append(
	        "<tr>" +
	        "<th>번호</th>" +
	        "<th>별점</th>" +
	        "<th>제목</th>" +
	        "<th>내용</th>" +
	        "<th>등록일</th>" +
	        "<th>조회수</th>" +
	        "</tr>"
	    );

	    var tbody = $("<tbody>");

	    if (myReviewData.reviewList.length == 0) { // 검색된 리뷰가 없을 때
	        var row = "<tr>" +
	            "<td colspan='6'>리뷰 내역이 없습니다.</td>" +
	            "</tr>";
	        tbody.append(row);
	    }

	    for (var i = 0; i < myReviewData.reviewList.length; i++) {
	        var review = myReviewData.reviewList[i]; // 변수 이름을 'qa'에서 'review'로 수정

	        var row = "<tr data-idx='" + review.reviewIdx + "'>" +
	            "<td>" + review.reviewIdx + "</td>" +
	            "<td>" + review.reviewStar + "</td>" +
	            "<td>" + review.reviewTitle + "</td>" +
	            "<td>" + review.reviewContent + "</td>" +
	            "<td>" + review.reviewRegdate + "</td>" +
	            "<td>" + review.reviewViewcnt + "</td>" +
	            "</tr>";
	        tbody.append(row);
	    }

	    table.append(thead, tbody);

	    $("#reviewListDiv").append(table);

	    reviewPageNumDisplay(myReviewData.pager);
	}

	
	/*
	//위시 리스트 데이터를 표시하는 함수
	function displayPackageHeartData(myWishData) {
		$("#wishListDiv").empty();
	    
		var griDiv = $("<div>").attr("id", "gri").addClass("row"); // 클래스 추가
		
		if (myWishData.wishList.length == 0) { // 검색된 게시글이 없을 때
		    var noResultMessage = $("<p>").text("찜목록이 없습니다. 어서 찜하세요!");
		    griDiv.append(noResultMessage);
		} 
			   
	   for (var i = 0; i < myWishData.wishList.length; i++) {
	       var wish = myWishData.wishList[i];
	       
	       var wishDiv = $("<div>").addClass("col-xs-6 col-md-3 product");
	       
	       var wishA = $("<a>").attr('href', 'javascript:festivalDetail(' + wish.festivalIdx + ');').addClass('product-link');
	       
	       var wishImg = $("<img>").attr("src", '<c:url value="/resources/upload/' + wish.mainImg + '" />').attr("alt", wish.subject + " 포스터");
	       
	       var shopTitleDiv = $("<div>").addClass("shop_title");
	       
	       var strongTitle = $("<h3>").addClass("product-title").text(wish.subject);
	       
	       // 요소들을 조립합니다.
	       shopTitleDiv.append(strongTitle);
	       
	       donationDiv.append(donationA, donationImg, shopTitleDiv);
	       
	       griDiv.append(donationDiv);
	       
		   }
		    
	    $("#wishListDiv").append(griDiv);
	    
	    wishPageNumDisplay(myWishData.pager);
	}
	*/
	
	
	
	
	
	
	
	
	
	function diyPageNumDisplay(pager) {
		 var html = "";
		 if (pager.startPage > pager.blockSize) {
			 html += "<a href=\"javascript:getMyUserinfosData('" + id + "', " + pager.prevPage + ", " + qaPage + ", " + reviewPage + ", " + packageHeartPage + ");\" class='btn btn-direction btn-default btn-rounded'><i class='fa fa-long-arrow-left'/></a>";
		 } else {
			 html += "<a class='btn btn-direction btn-default btn-rounded' disabled><i class='fa fa-long-arrow-left'/></a>";
		 }
	
		 for (var i = pager.startPage; i <= pager.endPage; i++) {
		     if (pager.pageNum != i) {
		         html += "<a class='btn btn-direction btn-default btn-rounded' href=\"javascript:getMyUserinfosData('" + id + "', " + i + ", " + qaPage + ", " + reviewPage + ", " + packageHeartPage + ");\">" + i + "</a>";
		     } else {
		         html += "<a class='btn btn-direction btn-default btn-rounded' disabled>" + i + "</a>";
		     }
		 }
	
		 if (pager.endPage != pager.totalPage) {
		     html += "<a href=\"javascript:getMyUserinfosData('" + id + "', " + pager.nextPage + ", " + qaPage + ", " + reviewPage + ", " + packageHeartPage + ");\" class='btn btn-direction btn-default btn-rounded'><i class='fa fa-long-arrow-right'/></a>";
		 } else {
		     html += "<a class='btn btn-direction btn-default btn-rounded' disabled><i class='fa fa-long-arrow-right'/></a>";
		 }
	
		 $("#diyPageNumDiv").html(html);
	}
	
	function qaPageNumDisplay(pager) {
		 var html = "";
		 if (pager.startPage > pager.blockSize) {
		     html += "<a href=\"javascript:getMyUserinfosData('" + id + "', " + diyPage + ", " + pager.prevPage + ", " + reviewPage + ", " + packageHeartPage + ");\" class='btn btn-direction btn-default btn-rounded'><i class='fa fa-long-arrow-left'/></a>";
		 } else {
			 html += "<a class='btn btn-direction btn-default btn-rounded' disabled><i class='fa fa-long-arrow-left'/></a>";
		 }
		
		 for (var i = pager.startPage; i <= pager.endPage; i++) {
		     if (pager.pageNum != i) {
		         html += "<a class='btn btn-direction btn-default btn-rounded' href=\"javascript:getMyUserinfosData('" + id + "', " + diyPage + ", " + i + ", " + reviewPage + ", " + packageHeartPage + ");\">" + i + "</a>";
		     } else {
		         html += "<a class='btn btn-direction btn-default btn-rounded' disabled>" + i + "</a>";
		     }
		 }
		
		 if (pager.endPage != pager.totalPage) {
		     html += "<a href=\"javascript:getMyUserinfosData('" + id + "', " + diyPage + ", " + pager.nextPage + ", " + reviewPage + ", " + packageHeartPage + ");\" class='btn btn-direction btn-default btn-rounded'><i class='fa fa-long-arrow-right'/></a>";
		 } else {
		     html += "<a class='btn btn-direction btn-default btn-rounded' disabled><i class='fa fa-long-arrow-right'/></a>";
		 }
		
		 	$("#qaPageNumDiv").html(html);
		}
	
	function reviewPageNumDisplay(pager) {
		 var html = "";
		 if (pager.startPage > pager.blockSize) {
		     html += "<a href=\"javascript:getMyUserinfosData('" + id + "', " + diyPage + ", " + qaPage + ", " + pager.prevPage + ", " + packageHeartPage + ");\" class='btn btn-direction btn-default btn-rounded'><i class='fa fa-long-arrow-left'/></a>";
		 } else {
			 html += "<a class='btn btn-direction btn-default btn-rounded' disabled><i class='fa fa-long-arrow-left'/></a>";
		 }
		
		 for (var i = pager.startPage; i <= pager.endPage; i++) {
		     if (pager.pageNum != i) {
		         html += "<a class='btn btn-direction btn-default btn-rounded' href=\"javascript:getMyUserinfosData('" + id + "', " + diyPage + ", " + qaPage + ", " + i + ", " + packageHeartPage + ");\">" + i + "</a>";
		     } else {
		         html += "<a class='btn btn-direction btn-default btn-rounded' disabled>" + i + "</a>";
		     }
		 }
		
		 if (pager.endPage != pager.totalPage) {
		     html += "<a href=\"javascript:getMyUserinfosData('" + id + "', " + diyPage + ", " + qaPage + ", " + pager.nextPage + ", " + packageHeartPage + ");\" class='btn btn-direction btn-default btn-rounded'><i class='fa fa-long-arrow-right'/></a>";
		 } else {
		     html += "<a class='btn btn-direction btn-default btn-rounded' disabled><i class='fa fa-long-arrow-right'/></a>";
		 }
		
		 	$("#reviewPageNumDiv").html(html);
		}
	
	/*
	function packageHeartPageNumDisplay(pager) {
		 var html = "";
		 if (pager.startPage > pager.blockSize) {
		     html += "<a href=\"javascript:getMyUserinfosData('" + id + "', " + diyPage + ", " + qaPage + ", " + reviewPage + ", " + pager.prevPage + ");\" class='btn btn-direction btn-default btn-rounded'><i class='fa fa-long-arrow-left'/></a>";
		 } else {
			 html += "<a class='btn btn-direction btn-default btn-rounded' disabled><i class='fa fa-long-arrow-left'/></a>";
		 }
		
		 for (var i = pager.startPage; i <= pager.endPage; i++) {
		     if (pager.pageNum != i) {
		         html += "<a class='btn btn-direction btn-default btn-rounded' href=\"javascript:getMyUserinfosData('" + id + "', " + diyPage + ", " + qaPage + ", " + reviewPage + ", " + i + ");\">" + i + "</a>";
		     } else {
		         html += "<a class='btn btn-direction btn-default btn-rounded' disabled>" + i + "</a>";
		     }
		 }
		
		 if (pager.endPage != pager.totalPage) {
		     html += "<a href=\"javascript:getMyUserinfosData('" + id + "', " + diyPage + ", " + qaPage + ", " + reviewPage + ", " + pager.nextPage + ");\" class='btn btn-direction btn-default btn-rounded'><i class='fa fa-long-arrow-right'/></a>";
		 } else {
		     html += "<a class='btn btn-direction btn-default btn-rounded' disabled><i class='fa fa-long-arrow-right'/></a>";
		 }
		
		 	$("#packageHeartPageNumDiv").html(html);
		}
		*/
	
	
	$(document).ready(function () {
		getMyUserinfosData(id, diyPage, qaPage, reviewPage, packageHeartPage);
		
		$("#cancelModifyBtn").click(function(){
	        $("#edit-form").toggle();
		});
		
	    $("#modify-userinfo").click(function() {
	        // 수정 폼을 표시하거나 숨기기
	        $("#edit-form").toggle();
	    });
		
		$("#modifyBtn").click(function() {
	    	var aName = $("#aName").val();
	    	var aEmail = $("#aEmail").val();
	    	var aPhone = $("#aPhone").val();
	    	var aAddress1 = $("#aAddress1").val();
	    	
	    	if(aName == "") {
	    		alert("이름을 입력해 주세요.");
	    		return;
	    	}
	    	
	    	if(aEmail == "") {
	    		alert("이메일을 입력해 주세요.");
	    		return;
	    	}
	    	
	    	if(aPhone == "") {
	    		alert("전화번호를 입력해 주세요.");
	    		return;
	    	}
	    	
	    	if(aAddress == "") {
	    	    alert("주소를 입력해 주세요.");
	    	    return;
	    	}
	    	
	    	if(aStatus == "") {
	    	    alert("주소를 입력해 주세요.");
	    	    return;
	    	}
	    	
	    	$.ajax({
	    		type: "PUT",
	    		url: "<c:url value="/admin/userinfo-modify"/>",
	    		contentType: "application/json",
	    		data: JSON.stringify({"id":id, "name":aName, "email":aEmail, "phone":aPhone, "address":aAddress, "status":aStatus, }),
	    		dataType: "text",
	    		success: function(result) {
	    			
	    			if(result == "success") {
	    			
	    			userinfoDetail(id);
	    			
	    			}
	    		},
	    		error: function(xhr) {
	    			alert("회원 정보 편집 중 오류가 발생하였습니다("+ xhr.status+")");
	    		}
	    	});
	    });
		
	$("#remove-userinfo").click(function() {
        if (confirm("정말로 삭제하시겠습니까?")) {
            
            $.ajax({
                type: "DELETE",
                url: "<c:url value='/admin/userinfo-remove?id='/>" + id,
                success: function(result) {
                    if(result == "success") {
                    	userinfoListDisplay(page, size, keyword);
                    } else {
                        alert("회원 정보 삭제 중 오류가 발생하였습니다.");
                    }
                },
                error: function(xhr) {
                    alert("회원 정보  삭제 중 오류가 발생하였습니다("+ xhr.status+")");
                }
            });
        }
    });
});

</script>
</body>
</html>
