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
	<!-- preloader -->
	<div id="preloader">
		<div class="spinner spinner-round"></div>
	</div>

	<section id="adminpage">
		<div class="container-fluid">
			<div class="row">
			<!-- 사이드바 -->
			<div class="col-sm-2 bg-dark text-white min-vh-100">
				<p>
					<a href="javascript:void(0)" id="userinfo-info"><i
						class="fas fa-user"></i> 회원 관리</a>
				</p>
				<p>
					<a href="javascript:void(0)" id="package-info"><i
						class="fa-solid fa-plane-departure"></i> 패키지 관리</a>
				</p>
				<p>
					<a href="javascript:void(0)" id="diy-info"><i
						class="fa-solid fa-map-location-dot"></i> DIY 관리</a>
				</p>
				<p>
					<a href="javascript:void(0)" id="notice-info"><i
						class="fas fa-bell"></i> 공지사항 관리</a>
				</p>
				<p>
					<a href="javascript:void(0)" id="qa-manage"><i
						class="fas fa-question"></i> 1:1문의 관리</a>
				</p>
				<p>
					<a href="javascript:void(0)" id="order-manager"><i
						class="fas fa-shopping-cart"></i> 결제 및 주문 관리</a>
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

	//회원 정보 리스트 출력 함수
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
        			"<br>"+
            		"<input type='text' class='form-control' id='selectKeyword' placeholder='검색어를 입력하세요'>"+
					"<br>"+        			
             		"<button id='searchButton'>검색</button>"
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
	   
	//회원 관리 버튼 클릭 시
	$("#userinfo-info").click(function() {
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
	
	// 페이지 크기가 변경될 때의 이벤트 리스너
	$("#pageSizeSelect").change(function() {
	    size = parseInt($(this).val()); // 선택한 값을 정수로 변환
	    // 적절한 리스트 출력 함수 호출. 예를 들어, 회원 정보 리스트를 출력하는 경우:
	    if (infoType === 'userinfo') {
	        userinfoListDisplay(page, size, keyword);
	    }
	    // 다른 타입의 리스트에 대해서도 동일하게 처리할 수 있습니다.
	});
	
	//infoType으로 설정
	function viewSelect(infoType) {
		var viewSelectDiv = $("#viewSelect");
		viewSelectDiv.empty();

		if (infoType === 'userinfo') {
			viewSelectDiv.append('<button id="userinfoReList" class="btn btn-primary">목록으로 돌아가기</button>');
			viewSelectDiv.append('<button id="changeUserinfo" class="btn btn-primary">회원 정보 수정</button>');
		} else if (infoType === 'package') {
			viewSelectDiv.append(
					'<button id="package" class="btn btn-primary">패키지 목록</button>'+ 
					'<button id="addPackage" class="btn btn-primary">패키지 등록</button>'
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
	    } else if (infoType == "qa") {
	        qaListDisplay(1, size, selectKeyword);
	    } else if (infoType == "notice") {
	        noticeListDisplay(1, size, selectKeyword);
	    }
	}

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
	
	//목록으로 버튼 클릭 시
	$("#viewSelect").on("click", "#userinfoReList", function() {
		viewType = "list";
		userinfoListDisplay(page, size, keyword);
	});
	
</script>	
</body>
</html>
