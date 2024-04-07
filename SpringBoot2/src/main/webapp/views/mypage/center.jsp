<%--
  Created by IntelliJ IDEA.
  User: rabbikim
  Date: 3/27/24
  Time: 9:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    $(document).ready(function (){
        $('#addrAddBtn').click(function (){
            window.location.href = '<c:url value="/mypage/add" />?id=${id}'
        })
    })

    $(document).ready(function (){
        $('#addrEditBtn').click(function (){
            let addressId = $(this).data('address-id');
            window.location.href = '<c:url value="/mypage/edit"/>?addrId=' + addressId + '&id=${id}';
        })
    })

    $(document).ready(function (){
        $('#addrDelBtn').click(function (){
            let res = confirm("삭제하시겠습니까?");
            if (res) {
                let addressId = $(this).data('address-id');
                window.location.href = '<c:url value="/mypage/delImpl"/>?addrId=' + addressId + '&id=${id}';
            }
        })
    })
</script>

<div class="container">
    <h2>${id}님의 마이페이지</h2>
    <br/>
    <div class="container">
        <div class="row justify-content-between mb-3">
            <div class="col-auto">
                <h5>주소 정보</h5>
            </div>
            <div class="col-auto">
                <button id="addrAddBtn" type="button" class="btn btn-primary" onclick="">새로운 주소 추가</button>
            </div>
        </div>
    <table class="table table-striped">
        <thead>
        <tr>
            <th width="10%">번호</th>
            <th width="20%">주소 이름</th>
            <th width="50%">주소 상세</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="a" items="${addrs}">
            <tr>
                <td>${a.addrId}</td>
                <td>${a.addrName}</td>
                <td>${a.addrDetail}</td>
                <td>
                    <!-- 수정 버튼 -->
                    <button id="addrEditBtn" type="button" class="btn btn-primary editBtn" data-address-id="${a.addrId}">수정</button>
                    <!-- 삭제 버튼 -->
                    <button id="addrDelBtn" type="button" class="btn btn-danger deleteBtn" data-address-id="${a.addrId}">삭제</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>