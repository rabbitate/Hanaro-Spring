<%--
  Created by IntelliJ IDEA.
  User: rabbikim
  Date: 4/3/24
  Time: 10:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    $(document).ready(function (){
        $('#itemDelBtn').click(function (){
            let addressId = $(this).data('address-id')
            window.location.href = '<c:url value="/item/del"/>' + '?id=' + addressId;
        })
    })
</script>

<div class="container">
    <h2>Item DB Page</h2>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>이미지</th>
            <th>이름</th>
            <th>가격</th>
            <th>등록일자</th>
            <th>수정일자</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${itemList}">
            <tr>
                <td><img  src="<c:url value="/imgs"/>/${item.imgName}"></td>
                <td>${item.itemName}</td>
                <td>
                    <fmt:formatNumber type="number" pattern="###,###원" value="${item.itemPrice}" />
                </td>
                <td>${item.regDate}</td>
                <td>${item.updateDate}</td>
                <td>
                    <!-- 삭제 버튼 -->
                    <button id="itemDelBtn" type="button" class="btn btn-danger deleteBtn" data-address-id="${item.itemId}">삭제</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
