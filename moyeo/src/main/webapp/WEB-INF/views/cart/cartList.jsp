<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html lang="utf-8">
<head><script src="https://code.jquery.com/jquery-3.6.0.min.js"></script></head>
       
  
<body id="body" class="up-scroll">
  <div class="main-wrapper packages-grid">

	
<!-- ====================================
———	PAGE TITLE
===================================== -->
<section class="page-title">
  <div class="page-title-img bg-img bg-overlay-darken" style="background-image: url(${pageContext.request.contextPath}/assets/img/pages/page-title-bg6.jpg);">
    <div class="container">
      <div class="row align-items-center justify-content-center" style="height: 200px;">
        <div class="col-lg-6">
          <div class="page-title-content">
            <div class="title-border">
              <h2 class="text-uppercase text-white font-weight-bold">장바구니</h2>
            </div>
            <p class="text-white mb-0"></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>


<!-- ====================================
———	cart SECTION
===================================== -->


	<section class="cartList">
	    <div class="container">
	        <div class="py-10">
	            <div class="cart_list">
	                
	                <div class="diy_form_title">
	                    장바구니
	                </div>
	                
	                <div class="cart_f">
	                    <form action="<c:url value='/cart/delete'/>" method="POST" id="deleteForm">
	                        <table>
	                            <colgroup>
	                                <col width="10%">
	                                <col width="15%">
	                                <col width="45%">
	                                <col width="10%">
	                                <col width="10%">
	                                <col width="10%">
	                            </colgroup>
	    
	                            <tr class="th">
	                                <td class="t1"><label><input type="checkbox" id="selectAllCheckbox"> </label></td>
	                                <td class="t1"></td>
	                                <td class="t1">상품명</td>
	                                <td class="t1">성인</td>
	                                <td class="t1">소인</td>
	                                <td class="t1">합계금액</td>
	                            </tr>
	    
	                            <c:forEach var="cartItem" items="${map.list}" varStatus="i">
	    <tr>
	        <td class="t2">
	            <input type="checkbox" class="cartCheckbox" name="cartIdx" value="${cartItem.cartIdx}">
	        </td>
	        <td class="t2 t_img"><a href="#">이미지</a></td>
	        <td class="t2">${cartItem.packTitle}</td>
	        <td class="t2">
	            <div class="input-group">
	                <button type="button" class="btn btn-outline-secondary minus-btn" data-product-id="${cartItem.cartIdx}">-</button>
	                <input type="number" class="form-control adult-count-input" value="${cartItem.packAdultcount}" min="0">
	                <button type="button" class="btn btn-outline-secondary plus-btn" data-product-id="${cartItem.cartIdx}">+</button>
	            </div>
	        </td>
	        <td class="t2">
	            <div class="input-group">
	                <button type="button" class="btn btn-outline-secondary minus-btn" data-product-id="${cartItem.cartIdx}">-</button>
	                <input type="number" class="form-control child-count-input" value="${cartItem.packChildcount}" min="0">
	                <button type="button" class="btn btn-outline-secondary plus-btn" data-product-id="${cartItem.cartIdx}">+</button>
	            </div>
	        </td>
	        <td class="t2"><fmt:formatNumber value="${cartItem.packTotalprice}" pattern="###,###"/>원</td>
	    </tr>
	</c:forEach>
	                        </table>
	    
	                        <div class="cart_totbar">
	                            <ul>
	                                <li class="tot1">총 ${map.count} 개의 상품</li>
	                                <li class="tot2">장바구니 총금액 </li>
	                                <li class="tot3">﻿<fmt:formatNumber value="${map.sumTotal}" pattern="###,###"/></li>
	                            </ul>
	                        </div>
	                     <div class="cart_btn">
	                            <button type="submit" class="b1" id="deleteButton">선택상품 삭제</button>
	                            <button type="button" class="b1" id="updateButton">선택상품 수정</button>    
	                            <button type="button" class="b1" id="orderButton">선택상품 주문</button>
	                            <button type="button" class="b1" id="allorderButton">전체상품 주문</button>                      
	                        </div>   
	                        </form>	             
	                        </div>
	                </div>
	            </div><!-- cart_list -->
	        </div><!-- py-10 -->
	    </div><!-- container -->
	</section>
	<style>
/* + 버튼과 - 버튼의 스타일 설정 */
.plus-btn,
.minus-btn {
    font-size: 18px; /* 원하는 폰트 크기로 조절하세요 */
    padding: 0px 10px; /* 원하는 여백 값으로 조절하세요 */
}
</style>
	<script>
	    document.getElementById('selectAllCheckbox').addEventListener('change', function () {
	        var cartCheckboxes = document.getElementsByClassName('cartCheckbox');
	        for (var i = 0; i < cartCheckboxes.length; i++) {
	            cartCheckboxes[i].checked = this.checked;
	        }
	    });
	
	
	    document.querySelectorAll('.plus-btn').forEach(function (button) {
	        button.addEventListener('click', function () {
	            var inputField = this.parentElement.querySelector('.form-control');
	            inputField.value = parseInt(inputField.value) + 1;
	        });
	    });
	
	    document.querySelectorAll('.minus-btn').forEach(function (button) {
	        button.addEventListener('click', function () {
	            var inputField = this.parentElement.querySelector('.form-control');
	            if (parseInt(inputField.value) > 0) {
	                inputField.value = parseInt(inputField.value) - 1;
	            }
	        });
	    });
	    
	    document.getElementById('updateButton').addEventListener('click', function () {
	        console.log("Update button clicked");

	        var selectedCartIdx = [];
	        var selectedAdultCounts = [];
	        var selectedChildCounts = [];

	        var cartCheckboxes = document.getElementsByClassName('cartCheckbox');
	        var adultInputFields = document.querySelectorAll('.adult-count-input');
	        var childInputFields = document.querySelectorAll('.child-count-input');

	        for (var i = 0; i < cartCheckboxes.length; i++) {
	            if (cartCheckboxes[i].checked) {
	                selectedCartIdx.push(cartCheckboxes[i].value);
	                selectedAdultCounts.push(adultInputFields[i].value);
	                selectedChildCounts.push(childInputFields[i].value);
	            }
	        }

	        // FormData 객체를 생성하여 데이터 추가
	        var formData = new FormData();
	        for (var i = 0; i < selectedCartIdx.length; i++) {
	            formData.append("cartIdx", selectedCartIdx[i]);
	            formData.append("packAdultcount", selectedAdultCounts[i]);
	            formData.append("packChildcount", selectedChildCounts[i]);
	        }

	        // AJAX 요청을 보냅니다.
	        fetch('/moyeo/cart/update', {
	            method: 'POST',
	            body: formData
	        })
	        .then(function (response) {
	            if (response.ok) {
	                console.log('Update successful');
	                alert('수정되었습니다.');
	                location.reload();
	                // 서버로부터 업데이트가 완료되면 필요한 작업을 수행하세요.
	            } else {
	                console.error('Update failed');
	            }
	        })
	        .catch(function (error) {
	            console.error('Fetch error:', error);
	        });
	    });
	    
	</script>






  </body>
</html>
