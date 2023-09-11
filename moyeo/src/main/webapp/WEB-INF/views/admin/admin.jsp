<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- preloader -->
	<div id="preloader">
		<div class="spinner spinner-round"></div>
	</div>
	<!-- / preloader -->
	<!-- content -->
	<!-- userinfo -->
	<section id="shop">
		<div class="container">
			<span></span>
			<div class="col-sm-2 userinfo-sidebar">
				<p>
					<a href="javascript:void(0)" id="userinfo-info">회원 관리</a>
				</p>
				<p>
					<a href="javascript:void(0)" id="festival-info">패키지 관리</a>
				</p>
				<p>
					<a href="javascript:void(0)" id="question-info">DIY 관리</a>
				</p>
				<p>
					<a href="javascript:void(0)" id="notice-info">공지사항 관리</a>
				</p>
				<p>
					<a href="javascript:void(0)" id="page-manage">1:1문의 관리</a>
				</p>
				<p>
					<a href="javascript:void(0)" id="page-manager">결제 및 주문 관리</a>
				</p>
			</div>
		</div>
	</section>

	<script type="text/javascript">
		var page = 1; // 기본 페이지 번호 설정
		var size = 20; // 기본 페이지 크기 설정
		var keyword = ''; // 기본 검색어 = NULL String
		var infoType = ''; // 기본 검색 타입 = NULL String(userinfo / package / qa / notice)
		var viewType = 'list'; // 기본 보기 설정 = 목록으로 보기
		
		// 회원 정보 리스트 출력 함수
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
		        url: "<c:url value ="/admin/userinfo-list"/>",
		        data: {"pageNum": pageNum, "pageSize": pageSize, "selectKeyword": selectKeyword},
		        dataType: "json",
		        success: function(result) {
		            $("#infoListDiv").empty();
		            
		            var table = $("<table>").attr("id", "userinfoInfoTable");
		            var thead = $("<thead>").append(
		                "<tr>" +
		                "<th>아이디</th>" +
		                "<th>이름</th>" +
		                "<th>성별</th>" +
		                "<th>이메일</th>" +
		                "<th>생년월일</th>" +
		                "<th>주소</th>" +
		                "<th>전화번호</th>" +
		                "<th>가입일</th>" +
		                "<th>마지막 로그인</th>" +
		                "<th>권한</th>" +
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
		                var row = "<tr data-id='" + userinfo.id + "'>" +
		                    "<td>" + userinfo.id + "</td>" +
		                    "<td>" + userinfo.name + "</td>" +
		                    "<td>" + userinfo.gender + "</td>" +
		                    "<td>" + userinfo.email + "</td>" +
		                    "<td>" + userinfo.birth + "</td>" +
		                    "<td>" + userinfo.address + "</td>" +
		                    "<td>" + userinfo.phone + "</td>" +
		                    "<td>" + userinfo.regdate + "</td>" +
		                    "<td>" + userinfo.logdate + "</td>" +
		                    "<td>" + userinfo.status + "</td>" +
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
		
		
		// 회원 상세 정보를 열람하기 위한 함수
		function userinfoDetail(id) {
			$("#viewSelect").hide();
			$("#pageSizeSelect").hide();
			$("#pageNumDiv").hide();
			$("#searchDiv").hide();
		    $.ajax({
		        method: "GET",
		        url: "<c:url value='/admin/userinfo_detail'/>",
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
		
		$(document).ready(function() {
			$("#pageSizeSelect").hide();
		   	$("#viewSelect").hide();
		   
		    // 회원 관리 버튼 클릭 시
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
		});
		
		// 한 페이지 당 출력 갯수를 변경햇을 시
		   $("#pageSizeSelect").change(function() {
			   var functionName = infoType + "ListDisplay";
			   var selectedPageSize = parseInt($(this).val());
			    
			    // 동적으로 함수 호출
			   window[functionName](page, selectedPageSize, keyword);
			});
		
		// 검색 버튼 클릭 시
		   $("#searchDiv").on("click", "#searchButton", function() {
		        performSearch();
		    });
		
		// Enter 키를 눌렀을 때 검색 버튼 클릭과 동일한 기능 실행
		    $(document).on("keydown", "#selectKeyword", function(event) {
		        if (event.key === "Enter") {
		            performSearch();
		        }
		    });
		
		 // 회원 tr 태그 클릭 시 상세 정보 보기로 이동
		    $("#infoListDiv").on("click", "#userinfoInfoTable tbody tr", function() {
		        var id = $(this).data("id");
		        userinfoDetail(id);
		    });
		
	</script>
</body>
</html>