<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="en">
  
<head>
</head>     
  
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
                    <form action="<c:url value='/cart/delete'/>" method="GET" id="deleteForm">
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
                                            <button type="button" class="btn btn-outline-secondary minus-btn">-</button>
                                            <input type="number" class="form-control adult-count-input" value="${cartItem.packAdultcount}" min="0">
                                            <button type="button" class="btn btn-outline-secondary plus-btn">+</button>
                                        </div>
                                    </td>
                                    <td class="t2">
                                        <div class="input-group">
                                            <button type="button" class="btn btn-outline-secondary minus-btn">-</button>
                                            <input type="number" class="form-control child-count-input" value="${cartItem.packChildcount}" min="0">
                                            <button type="button" class="btn btn-outline-secondary plus-btn">+</button>
                                        </div>
                                    </td>
                                    <td class="t2">${cartItem.money}원</td>
                                </tr>
                            </c:forEach>
                        </table>
    
                        <div class="cart_totbar">
                            <ul>
                                <li class="tot1">총${map.count} 개의 상품</li>
                                <li class="tot2">장바구니 총금액</li>
                                <li class="tot3">${map.sumMoney}원</li>
                            </ul>
                        </div>
    
                        <div class="cart_btn">
                            <button type="button" class="b1" id="deleteButton">선택상품 삭제</button>
                            <button type="button" class="b1" id="updateButton">선택상품 수정</button>
                            <button class="b1">선택상품 주문</button>
                            <button class="b1">전체상품 주문</button>
                        </div>
                    </form>
                </div>
            </div><!-- cart_list -->
        </div><!-- py-10 -->
    </div><!-- container -->
</section>

<script>
    document.getElementById('selectAllCheckbox').addEventListener('change', function () {
        var cartCheckboxes = document.getElementsByClassName('cartCheckbox');
        for (var i = 0; i < cartCheckboxes.length; i++) {
            cartCheckboxes[i].checked = this.checked;
        }
    });

    document.getElementById('deleteButton').addEventListener('click', function () {
        var selectedCartIdx = [];
        var cartCheckboxes = document.getElementsByClassName('cartCheckbox');
        for (var i = 0; i < cartCheckboxes.length; i++) {
            if (cartCheckboxes[i].checked) {
                selectedCartIdx.push(cartCheckboxes[i].value);
            }
        }
        var hiddenCartIdxField = document.querySelector('.hiddenCartIdx');
        hiddenCartIdxField.value = selectedCartIdx.join(',');
        document.getElementById('deleteForm').submit();
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
        var selectedCartIdx = [];
        var selectedAdultCounts = [];
        var selectedChildCounts = [];
        var adultCountInputs = document.querySelectorAll('.adult-count-input');
        var childCountInputs = document.querySelectorAll('.child-count-input');

        adultCountInputs.forEach(function (input) {
            selectedCartIdx.push(input.getAttribute('data-cartidx'));
            selectedAdultCounts.push(input.value);
        });

        childCountInputs.forEach(function (input) {
            selectedChildCounts.push(input.value);
        });

        var formData = new FormData();
        for (var i = 0; i < selectedCartIdx.length; i++) {
            formData.append('packIdx', selectedCartIdx[i]);
            formData.append('packAdultcount', selectedAdultCounts[i]);
            formData.append('packChildcount', selectedChildCounts[i]);
        }

        fetch('<c:url value="/cart/update" />', {
            method: 'POST',
            body: formData
        })
        .then(response => response.text())
        .then(data => {
            window.location.href = '<c:url value="/cart/list" />';
        });
    });
</script>






  </body>
</html>
