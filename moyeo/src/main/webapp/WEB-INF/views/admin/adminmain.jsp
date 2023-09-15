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

<section id="adminpage">
	<div class="container-fluid">
		<div class="row">
			<!-- 사이드바 -->
			<div class="col-sm-2 bg-dark text-white min-vh-100">
				<p>
					<a href="javascript:void(0)" id="userinfo-info"><i class="fas fa-user"></i> 회원 관리</a>
				</p>
				<p>
				    <a href="javascript:void(0)" id="package-info"><i class="fa-solid fa-plane-departure"></i> 패키지 관리</a>
				</p>
				<ul id="package-menu" style="list-style-type: none; padding: 0; display: none;">
				    <li><a href="javascript:void(0)" id="add-package"><i class="fa-solid fa-plus"></i> 패키지 등록</a></li>
				    <li><a href="javascript:void(0)" id="edit-package"><i class="fa-solid fa-pencil"></i> 패키지 수정</a></li>
				    <li><a href="javascript:void(0)" id="delete-package"><i class="fa-solid fa-trash"></i> 패키지 삭제</a></li>
				</ul>
				<p>
					<a href="javascript:void(0)" id="diy-info"><i class="fa-solid fa-map-location-dot"></i> DIY 관리</a>
				</p>
				<p>
					<a href="javascript:void(0)" id="notice-info"><i class="fas fa-bell"></i> 공지사항 관리</a>
				</p>
				<p>
					<a href="javascript:void(0)" id="qa-manage"><i class="fas fa-question"></i> 1:1문의 관리</a>
				</p>
				<p>
					<a href="javascript:void(0)" id="order-manager"><i class="fas fa-shopping-cart"></i> 결제 및 주문 관리</a>
				</p>
			</div>

			<!-- 본문 -->
			<div class="col-sm-10">
				
				<!-- 페이지 당 출력 갯수를 출력하는 태그 -->
				<select id="pageSizeSelect" class="mb-3"></select>

				<!-- 버튼 추가 -->
				<div id="viewSelect" class="nav nav-pills text-right mb-3"></div>

				<!-- 게시글 목록을 출력하는 태그 -->
				<div id="infoListDiv" class="mb-3"></div>

				<!-- 페이지 번호를 출력하는 태그 -->
				<div id="pageNumDiv" class="mb-3 page-number-wrapper"></div>

				<!-- 검색 창을 출력하는 태그 -->
				<div id="searchDiv" class="mb-3"></div>
			</div>
		</div>
	</div>
</section>
	
<script type="text/javascript">
	var page = 1; // 기본 페이지 번호 설정
	var size = 20; // 기본 페이지 크기 설정
	var keyword = ''; // 기본 검색어 = NULL String
	var infoType = ''; // 기본 검색 타입 = NULL String(userinfo / package / diy / notice / qa / )
	var viewType = 'list'; // 기본 보기 설정 = 목록으로 보기

	//회원 정보 리스트 출력
	function userinfoListDisplay(pageNum, pageSize, selectKeyword) {
		$("#viewSelect").show();
		$("#pageSizeSelect").show();
		$("#pageNumDiv").show();
		$("#searchDiv").show();
	   page=pageNum;
	   size=pageSize;
	   keyword=selectKeyword;
   
    $.ajax({
        method: "GET",
        url: "<c:url value="/admin/userinfo-list"/>",
        data: {"pageNum": pageNum, "pageSize": pageSize, "selectKeyword": selectKeyword},
        dataType: "json",
        success: function(result) {
            $("#infoListDiv").empty();
            
            var table = $("<table>").attr("id", "userinfoInfoTable");
            var thead = $("<thead>").append(
                "<tr>" +
                "<th style='min-width:100px; white-space: nowrap;'>아이디</th>" +
                "<th style='min-width:60px; white-space: nowrap;'>이름</th>" +
                "<th style='min-width:40px; white-space: nowrap;'>성별</th>" +
                "<th style='min-width:170px; white-space: nowrap;'>이메일</th>" +
                "<th style='min-width:80px; white-space: nowrap;'>생년월일</th>" +
                "<th style='min-width:150px; white-space: nowrap;'>주소</th>" +
                "<th style='min-width:100px; white-space: nowrap;'>전화번호</th>" +
                "<th style='min-width:80px; white-space: nowrap;'>가입일</th>" +
                "<th style='min-width:90px; white-space: nowrap;'>마지막로그인</th>" +
                "<th style='min-width:50px; white-space: nowrap;'>상태</th>" +
                "</tr>"
            );

            var tbody = $("<tbody>");

            if (result.userinfoList.length == 0) { // 검색된 게시글이 없을 때
                var row = "<tr>" +
                    "<td colspan='10'>검색된 회원 정보가 없습니다.</td>" +
                    "</tr>";
                tbody.append(row);
            } 
            for (var i = 0; i < result.userinfoList.length; i++) {
                var userinfo = result.userinfoList[i];
                var genderText = userinfo.gender === 'm' ? '남자' : '여자';
                var displayStatus = '';
                switch(userinfo.status) {
                    case 0: displayStatus = '일반회원'; break;
                    case 2: displayStatus = '휴면회원'; break;
                    case 3: displayStatus = '탈퇴회원'; break;
                    case 9: displayStatus = '관리자'; break;
                    default: displayStatus = userinfo.status;
                }
                
                var row = "<tr data-id='" + userinfo.id + "'>" +
                    "<td>" + userinfo.id + "</td>" +
                    "<td>" + userinfo.name + "</td>" +
                    "<td>" + genderText + "</td>" +
                    "<td>" + userinfo.email + "</td>" +
                    "<td>" + userinfo.birth.substring(0, 10) + "</td>" +
                    "<td>" + userinfo.address + "</td>" +
                    "<td>" + userinfo.phone + "</td>" +
                    "<td>" + userinfo.regdate.substring(0, 10) + "</td>" +
                    "<td>" + userinfo.logdate.substring(0, 10) + "</td>" +
                    "<td>" + displayStatus  + "</td>" +
                    "</tr>";
                tbody.append(row);
           }

            table.append(thead, tbody);
            
            $("#infoListDiv").append(table);
            
            var searchDiv = $("#searchDiv");
           
            // 기존 테이블 및 내용 삭제
            searchDiv.empty();

        	searchDiv.append(
        			"<br>" +
        		    "<div class='input-group'>" +
        		    "   <input type='text' class='form-control' id='selectKeyword' placeholder='검색어를 입력하세요'>" +
        		    "   <div class='input-group-append'>" +
        		    "       <button id='searchButton' class='btn btn-primary'>검색</button>" +
        		    "   </div>" +
        		    "</div>" +
        		    "<br>"
            )
          
            // 페이지 번호 출력
            pageNumDisplay(result.pager, infoType);
            
            // 페이지 당 출력 갯수를 출력
           pageSizeDisplay();
            
           viewSelect(infoType)
        },
        
        error: function(xhr) {
            alert("회원 정보를 불러오는 중에 오류가 발생했습니다. (에러 코드 = " + xhr.status + ")");
        }
    });
}
	
	//패키지 리스트 출력
	function packageListDisplay(pageNum, pageSize, selectKeyword) {
		$("#viewSelect").show();
		$("#pageSizeSelect").show();
		$("#pageNumDiv").show();
		$("#searchDiv").show();
       page=pageNum;
   	   size=pageSize;
   	   keyword=selectKeyword;
   	   
   	$.ajax({
        method: "GET",
        url: "<c:url value ="/admin/package-list"/>",
        data: {"pageNum": pageNum, "pageSize": pageSize, "selectKeyword": selectKeyword},
        dataType: "json",
        success: function(result) {
           
           $("#infoListDiv").empty();
           
           // 썸네일로 보기를 눌렀을 때
           if (viewType === "thumbnail") {
        	   var gridDiv = $("<div>").attr("id", "grid").addClass("row"); // 클래스 추가
        	   
        	   if (result.packageList.length == 0) { // 검색된 게시글이 없을 때
        	       var noResultMessage = $("<p>").text("검색된 영화제가 없습니다.");
        	       gridDiv.append(noResultMessage);
        	   } 
	        	   
       	       for (var i = 0; i < result.packageList.length; i++) {
       	           var package = result.packageList[i];
       	           
       	           var packageDiv = $("<div>").addClass("col-xs-6 col-md-3 product");
       	           
       	           var aPackageDetail = $("<a>").attr('href', 'javascript:packageDetail(' + pack.packIdx + ');').addClass('product-link');
       	           
       	           var imgThumbnail = $("<img>").attr("src", '<c:url value="/resources/upload/' + pack.packPreviewImg + '" />').attr("alt", pack.packTitle + " 포스터");
       	           
       	           var shopTitleDiv = $("<div>").addClass("shop_title");
       	           
       	           // 요소들을 조립합니다.
       	           packageDiv.append(aPackageDetail, imgThumbnail, shopTitleDiv);
       	           
       	           gridDiv.append(packageDiv); // 요소를 infoListDiv에 추가합니다.
       	       }
       	       
       	       $("#infoListDiv").append(gridDiv); // 요소를 infoListDiv에 추가합니다.
             
             // 목록으로 보기를 눌렀을 때
            } else if(viewType === "list") {
               var table = $("<table>").attr("id", "packageInfoTable");
                var thead = $("<thead>").append(
                      "<tr>" +
                       "<th style='min-width:100px; white-space: nowrap;'>패키지 번호</th>" +
                       "<th style='min-width:100px; white-space: nowrap;'>패키지 제목</th>" +
                       "<th style='min-width:100px; white-space: nowrap;'>패키지 종류</th>" +
                       "<th style='min-width:100px; white-space: nowrap;'>패키지 시작일</th>" +
                       "<th style='min-width:100px; white-space: nowrap;'>패키지 종료일</th>" +
                       "<th style='min-width:100px; white-space: nowrap;'>패키지 등록일</th>" +
                       "<th style='min-width:100px; white-space: nowrap;'>패키지 인원수</th>" +
                       "<th style='min-width:100px; white-space: nowrap;'>성인 가격</th>" +
                       "<th style='min-width:100px; white-space: nowrap;'>소인 가격</th>" +
                       "<th style='min-width:100px; white-space: nowrap;'>패키지 하트</th>" +
                       "<th style='min-width:100px; white-space: nowrap;'>상태</th>" +
                       "</tr>"
                );
   
                var tbody = $("<tbody>");
   
                if (result.packageList.length == 0) { // 검색된 게시글이 없을 때
                    var row = "<tr>" +
                       "<td colspan='11'>검색된 패키지가 없습니다.</td>" +
                       "</tr>";
                    tbody.append(row);
                }
                for (var i = 0; i < result.packageList.length; i++) {
                    var pack = result.packageList[i];
                    var row = "<tr data-idx='" + pack.packIdx + "'>";
                    
                    if (pack.packStatus == 0) {
                        row += "<td>" + pack.packIdx + "</td>";
                    } else if (pack.packStatus == 1) {
                        row += "<td style='background-color: red;'>" + pack.packIdx + "</td>";
                    } else {
                        row += "<td style='background-color: #87CEEB;'>" + pack.packIdx + "</td>";
                    }
                    row += "<td>" + pack.packKind + "</td>" +
                       	   "<td>" + pack.packTitle + "</td>" +
                       	   "<td>" + pack.packStartDate + "</td>" +
                           "<td>" + pack.packEndDate + "</td>" +
                           "<td>" + pack.packRegDate.substring(0, 10) + "</td>" +
                           "<td>" + pack.packPeople + "</td>" +
                           "<td>" + pack.packChildPrice + "</td>" +
                           "<td>" + pack.packAdultPrice + "</td>" +
                           "<td>" + pack.packHeart + "</td>" +
                           "<td>" + pack.packStatus + "</td>" +
                           "</tr>";
                   tbody.append(row);
               }
               
                table.append(thead, tbody);
               
                $("#infoListDiv").append(table);
           }

           var searchDiv = $("#searchDiv");
            
            // 기존 테이블 및 내용 삭제
            searchDiv.empty();

            searchDiv.append(
            		"<br>" +
            	    "<div class='input-group'>" +
            	    "   <input type='text' class='form-control' id='selectKeyword' placeholder='검색어를 입력하세요'>" +
            	    "   <div class='input-group-append'>" +
            	    "       <button id='searchButton' class='btn btn-primary'>검색</button>" +
            	    "   </div>" +
            	    "</div>" +
            	    "<br>"
            )
          
            // 페이지 번호 출력
            pageNumDisplay(result.pager, infoType);
            
            // 페이지 당 출력 갯수를 출력
           pageSizeDisplay();
            
           viewSelect(infoType)
        },
        error: function(xhr) {
            alert("패키지 정보를 불러오는 중에 오류가 발생했습니다. (에러 코드 = " + xhr.status + ")");
        }
      
    });
}   	   
	
	//페이지 번호를 출력하는 함수
	function pageNumDisplay(pager, infoType) {
	    var html = "";
	    if (pager.startPage > pager.blockSize) {
	        html += "<a href=\"javascript:" + infoType + "ListDisplay(" + pager.prevPage + ", " + size + ", '" + keyword + "');\" class='btn btn-direction btn-default btn-rounded'><i class='fa fa-long-arrow-left'/></a>";
	    } else {
	        html += "<a class='btn btn-direction btn-default btn-rounded' disabled><i class='fa fa-long-arrow-left'/></a>";
	    }

	    for (var i = pager.startPage; i <= pager.endPage; i++) {
	        if (pager.pageNum != i) {
	            html += "<a class='btn btn-direction btn-default btn-rounded' href=\"javascript:" + infoType + "ListDisplay(" + i + ", " + size + ", '" + keyword + "');\">" + i + "</a>";
	        } else {
	            html += "<a class='btn btn-direction btn-default btn-rounded' disabled>" + i + "</a>";
	        }
	    }

	    if (pager.endPage != pager.totalPage) {
	        html += "<a href=\"javascript:" + infoType + "ListDisplay(" + pager.prevPage + ", " + size + ", '" + keyword + "');\" class='btn btn-direction btn-default btn-rounded'><i class='fa fa-long-arrow-right'/></a>";
	    } else {
	        html += "<a class='btn btn-direction btn-default btn-rounded' disabled><i class='fa fa-long-arrow-right'/></a>";
	    }

	    $("#pageNumDiv").html(html);
	}
	
	// 페이지 당 출력 갯수를 설정하는 함수
	function pageSizeDisplay() {
	    // 페이지 크기 선택
	    var pageSizeSelect = $("#pageSizeSelect");

	    pageSizeSelect.empty(); // 기존 옵션 초기화

	    var pageSizeOptions = [10, 20, 50, 100];
	    for (var i = 0; i < pageSizeOptions.length; i++) {
	        var optionValue = pageSizeOptions[i];
	        var optionText = optionValue + "개씩 보기";

	        var option = $("<option>").val(optionValue).text(optionText);

	        if (optionValue === size) {
	            option.prop("selected", true);
	        }
	        pageSizeSelect.append(option);
	    }
	}
	
	//infoType으로 설정
	function viewSelect(infoType) {
		var viewSelectDiv = $("#viewSelect");
		viewSelectDiv.empty();

		if (infoType === 'package') {
		viewSelectDiv.append(
			'<button id="listViewButton" class="btn btn-primary">버튼</button>'+ 
			'<button id="ViewButton" class="btn btn-primary">버튼</button>'
			);
		} else if (infoType === 'notice') {
			viewSelectDiv.append('<button id="addNotice" class="btn btn-primary">공지사항 등록</button>');
		}
	}
	
	// 검색하는 함수
	function performSearch() {
	    var selectKeyword = $("#selectKeyword").val();
	    if (infoType == "userinfo") {
	        userinfoListDisplay(1, size, selectKeyword);
	    } else if (infoType == "package") {
	        packageListDisplay(1, size, selectKeyword);
	    } else if (infoType == "diy") {
	        diyListDisplay(1, size, selectKeyword);
	    } else if (infoType == "notice") {
	        noticeListDisplay(1, size, selectKeyword);
	    } else if (infoType == "qa") {
	        qaListDisplay(1, size, selectKeyword);
	    }
	}

	//회원 상세 정보를 열람하기 위한 함수
	function userinfoDetail(id) {
		$("#viewSelect").hide();
		$("#pageSizeSelect").hide();
		$("#pageNumDiv").hide();
		$("#searchDiv").hide();
	    $.ajax({
	        method: "GET",
	        url: "<c:url value='/admin/userinfo-detail'/>",
	        data: {"id": id},
	        dataType: "html",
	        success: function(html) {
	            var userinfoDetailDiv = $("<div>").html(html); // HTML을 DOM 요소로 변환
	            $("#infoListDiv").empty().append(userinfoDetailDiv); // 기존 내용 지우고 새로운 내용 삽입
	        },
	        error: function(xhr) {
	            alert("상세 정보를 불러오는 중에 오류가 발생했습니다. 에러 코드 = (" + xhr.status + ")");
	        }
	    });
	}

    $(document).ready(function() {
		$("#pageSizeSelect").hide();
	   	$("#viewSelect").hide();
	
	//회원 관리 버튼 클릭 시
	$("#userinfo-info").off("click").on("click", function() {
	   	$("#viewSelect").show();
		$("#pageSizeSelect").show();
	    $("#pageNumDiv").show();
	    $("#searchDiv").show();
	    page = 1;
	    size = 20;
	    keyword ='';
	    infoType = "userinfo";
	    userinfoListDisplay(page, size, keyword);
	   
	    $("#pageSizeSelect").val(size);
	});
	
	//패키지 관리 버튼 클릭 시
	$("#package-info").click(function() {
	    $("#package-menu").toggle(); // 하위 메뉴의 가시성을 토글합니다.

		$("#viewSelect").show();
		$("#pageSizeSelect").show();
		$("#pageNumDiv").show();
		$("#searchDiv").show();
		page = 1;
		size = 20;
		keyword ='';
		infoType = "package";
		viewType = "list";
		packageListDisplay(page, size, keyword);
		       
		$("#pageSizeSelect").val(size);
	});
	
	//한 페이지 당 출력 갯수를 변경햇을 시
	$("#pageSizeSelect").change(function() {
		var functionName = infoType + "ListDisplay";
		var selectedPageSize = parseInt($(this).val());
		    
	// 동적으로 함수 호출
	window[functionName](page, selectedPageSize, keyword);
	});
	
	//검색 버튼 클릭 시
	$("#searchDiv").on("click", "#searchButton", function() {
		performSearch();
	});

	// Enter 키를 눌렀을 때 검색 버튼 클릭과 동일한 기능 실행
	$(document).on("keydown", "#selectKeyword", function(event) {
		if (event.key === "Enter") {
			performSearch();
		}
	});
	
	//목록으로 보기 버튼 클릭 시
	$("#viewSelect").on("click", "#listViewButton", function() {
		viewType = "list";
		packageListDisplay(page, size, keyword);
	});
	
	// 회원 tr 태그 클릭 시 상세 정보 보기로 이동
    $("#infoListDiv").on("click", "#userinfoInfoTable tbody tr", function() {
        var id = $(this).data("id");
        userinfoDetail(id);
    });
	
});	
</script>	
</body>
</html>
