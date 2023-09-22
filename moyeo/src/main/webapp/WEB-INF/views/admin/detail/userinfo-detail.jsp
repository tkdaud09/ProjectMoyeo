<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>       
<!DOCTYPE html>
<html lang="en">
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
                    	<hr>
                    	<p> 이메일 </p>
                    	<input id="aEmail" name="aEmail" value="${userinfo.email }">
                    	<hr>
                    	<hr>
                    	<p> 전화번호 </p>
                    	<input id="aPhone" name="aPhone" value="${userinfo.phone }">
                    	<hr>
                    	<hr>
                    	<p> 주소 </p>
                    	<input id="aAddress" name="aAddress" value="${userinfo.address }">
                    	<hr>
                    	<hr>
                    	<p> 상태 </p>
                    	<input id="aStatus" name="aStatus" value="${userinfo.status }"> 
                    	<hr>
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
	        "<th style='padding: 10px; white-space: nowrap;'>번호</th>" +
	        "<th style='padding: 10px; white-space: nowrap;'>출발일</th>" +
	        "<th style='padding: 10px; white-space: nowrap;'>도착일</th>" +
	        "<th style='padding: 10px; white-space: nowrap;'>인원수</th>" +
	        "<th style='padding: 10px; white-space: nowrap;'>지역</th>" +
	        "<th style='padding: 10px; white-space: nowrap;'>총 가격</th>" +
	        "<th style='padding: 10px; white-space: nowrap;'>좋아요수</th>" +
	        "<th style='padding: 10px; white-space: nowrap;'>제목</th>" +
	        "<th style='padding: 10px; white-space: nowrap;'>한줄평</th>" +
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
	            "<td style='padding: 10px; white-space: nowrap;'>" + diy.diyIdx + "</td>" +
	            "<td style='padding: 10px; white-space: nowrap;'>" + diy.diyStartdate.substring(0, 10) + "</td>" +
	            "<td style='padding: 10px; white-space: nowrap;'>" + diy.diyEnddate.substring(0, 10) + "</td>" +
	            "<td style='padding: 10px; white-space: nowrap;'>" + diy.diyPeople + "</td>" +
	            "<td style='padding: 10px; white-space: nowrap;'>" + diy.diyLoc + "</td>" +
	            "<td style='padding: 10px; white-space: nowrap;'>" + diy.diyPrice + "</td>" +
	            "<td style='padding: 10px; white-space: nowrap;'>" + diy.loveCount + "</td>" +
	            "<td style='padding: 10px;'>" + diy.diyTitle + "</td>" +
	            "<td style='padding: 10px;'>" + diy.diyIntroduction + "</td>" +
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
	        "<th style='padding: 10px;'>번호</th>" +
	        "<th style='padding: 10px;'>옵션</th>" +
	        "<th style='padding: 10px;'>제목</th>" +
	        "<th style='padding: 10px;'>내용</th>" +
	        "<th style='padding: 10px;'>등록일</th>" +
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
	            "<td style='padding: 10px; white-space: nowrap;'>" + qa.qaIdx + "</td>" +
	            "<td style='padding: 10px; white-space: nowrap;'>" + qa.qaOption + "</td>" +
	            "<td style='padding: 10px; white-space: nowrap;'>" + qa.qaTitle + "</td>" +
	            "<td style='padding: 10px;'>" + qa.qaContent + "</td>" +
	            "<td style='padding: 10px; white-space: nowrap;'>" + qa.qaRegdate.substring(0, 10) + "</td>" +
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
	        "<th style='padding: 10px;'>번호</th>" +
	        "<th style='padding: 10px;'>패키지 제목</th>" +
	        "<th style='padding: 10px;'>별점</th>" +
	        "<th style='padding: 10px;'>후기 제목</th>" +
	        "<th style='padding: 10px;'>내용</th>" +
	        "<th style='padding: 10px;'>등록일</th>" +
	        "<th style='padding: 10px;'>조회수</th>" +
	        "</tr>"
	    );

	    var tbody = $("<tbody>");

	    if (myReviewData.reviewList.length == 0) { // 검색된 리뷰가 없을 때
	        var row = "<tr>" +
	            "<td colspan='7'>리뷰 내역이 없습니다.</td>" +
	            "</tr>";
	        tbody.append(row);
	    }

	    for (var i = 0; i < myReviewData.reviewList.length; i++) {
	        var review = myReviewData.reviewList[i];
	        
	     	// 별점을 ★ 문자로 변환
	        var stars = "";
	        for (var j = 0; j < review.reviewStar; j++) {
	            stars += "★";
	        }

	        var row = "<tr data-idx='" + review.reviewIdx + "'>" +
	            "<td style='padding: 10px; white-space: nowrap;'>" + review.reviewIdx + "</td>" +
	            "<td style='padding: 10px; white-space: nowrap;'>" + review.packTitle + "</td>" +
	            "<td style='padding: 10px; white-space: nowrap;'>" + stars + "</td>" +  // ★ 문자로 변경된 부분
	            "<td style='padding: 10px; white-space: nowrap;'>" + review.reviewTitle + "</td>" +
	            "<td style='padding: 10px;'>" + review.reviewContent + "</td>" +
	            "<td style='padding: 10px; white-space: nowrap;'>" + review.reviewRegdate + "</td>" +
	            "<td style='padding: 10px; white-space: nowrap;'>" + review.reviewViewcnt + "</td>" +
	            "</tr>";
	        tbody.append(row);
	    }

	    table.append(thead, tbody);

	    $("#reviewListDiv").append(table);

	    reviewPageNumDisplay(myReviewData.pager);
	}

	
	/*
	//myPackageHeartData 리스트 데이터를 표시하는 함수
	function displayPackageHeartData(myPackageHeartData) {
		$("#packageHeartListDiv").empty();
	    
		var griDiv = $("<div>").attr("id", "gri").addClass("row"); // 클래스 추가
		
		if (myPackageHeartData.packageHeartList.length == 0) { // 검색된 게시글이 없을 때
		    var noResultMessage = $("<p>").text("찜목록이 없습니다.");
		    griDiv.append(noResultMessage);
		} 
			   
	   for (var i = 0; i < myPackageHeartData.packageHeartList.length; i++) {
	        var packageHeart = myPackageHeartData.packageHeartList[i];

		   }
		    
	    $("#packageHeartListDiv").append(griDiv);
	    
	    packageHeartPageNumDisplay(myPackageHeartData.pager);
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
		
		//CSRF 토큰 관련 정보를 자바스크립트 변수에 저`장
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";

		// Ajax 기능을 사용하여 요청하는 모든 웹 프로그램에게 CSRF 토큰 전달 가능
		// ▶ Ajax 요청 시 beforeSend 속성을 설정할 필요 없음
		$(document).ajaxSend(function(e, xhr){
		   xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		});
		
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
	    	var aAddress = $("#aAddress").val();
	    	var aStatus = $("#aStatus").val();
	    	var aPw = $("#aPw").val();
	        var aBirth = $("#aBirth").val();
	    	
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
	    	    alert("상태를 입력해 주세요.");
	    	    return;
	    	}
	    	
	    	$.ajax({
	    		type: "PUT",
	    		url: "<c:url value="/admin/userinfo-modify"/>",
	    		contentType: "application/json",
	    		data: JSON.stringify({
	    			"id":id,
	    			"pw":aPw,
	    			"birth":aBirth,
	    			"name":aName,
	    			"email":aEmail,
	    			"phone":aPhone,
	    			"address":aAddress,
	    			"status":aStatus 
	    		}),
	    		dataType: "text",
	            success: function(result) {
	                if (result == "success") {
	                    userinfoDetail(id);

	                }
	            },
	            error: function(xhr) {
	                alert("회원 정보 편집 중 오류가 발생하였습니다(" + xhr.status + ")");
	            }
	        });
	    });
		
	$("#remove-userinfo").click(function() {
        if (confirm("정말로 삭제하시겠습니까?")) {
            
            $.ajax({
                type: "PUT",
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
