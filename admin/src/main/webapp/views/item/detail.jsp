<%--
  Created by IntelliJ IDEA.
  User: rabbikim
  Date: 4/4/24
  Time: 3:36 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let item_detail = {
        init:function (){
            $('#item_update_form > #btn_update').click(() => {
                let res = confirm("수정하시겠습니까?");
                if (res) {
                    let name = $('#name').val();
                    let price = $('#price').val();

                    if (name == '' || name == null) {
                        alert("수정할 이름을 입력하세요");
                        $('#name').focus();
                        return;
                    }

                    if (price == '' || price == null) {
                        alert("수정할 가격을 입력하세요");
                        $('#price').focus();
                        return;
                    }
                    this.send();
                }
            })
        },
        send:function (){
            $('#item_update_form').attr({
                'method': 'post',
                'enctype': 'multipart/form-data',
                'action': '<c:url value="/item/update" />'
            });
            $('#item_update_form').submit();
        }
    };

    $(function (){
        item_detail.init();
    })
</script>

<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">아이템 정보 수정</h1>
    <br/>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">
                <form id="item_update_form">
                    <div class="form-group">
                        <label for="id">상품 번호:</label>
                        <input type="text" readonly="readonly" value="${item.itemId}" class="form-control" id="id" placeholder="Enter id" name="itemId">
                    </div>
                    <div class="form-group">
                        <label for="name">이름:</label>
                        <input type="text" value="${item.itemName}"  class="form-control" id="name" placeholder="Enter name" name="itemName">
                    </div>
                    <div class="form-group">
                        <label for="price">가격:</label>
                        <input type="text" value="${item.itemPrice}"  class="form-control" id="price" placeholder="Enter name" name="itemPrice">
                    </div>
                    <div class="form-group">
                        <h6>
                            <fmt:parseDate value="${item.regDate}}"
                                           pattern="yyyy-MM-dd" var="parsedDateTime" type="both" />
                            <fmt:formatDate pattern="yyyy년 MM월 dd일" value="${parsedDateTime}" />
                        </h6>
                        <h6>
                            <fmt:parseDate value="${item.updateDate}}"
                                           pattern="yyyy-MM-dd" var="parsedDateTime" type="both" />
                            <fmt:formatDate pattern="yyyy년 MM월 dd일" value="${parsedDateTime}" />
                        </h6>
                    </div>
                    <div class="form-group">
                        <img width="100px" src="<c:url value="/imgs"/>/${item.imgName}"/>
                        <input type="hidden" name="imgName" value="${item.imgName}">
                    </div>
                    <div class="form-group">
                        <label for="newimage">New Image:</label>
                        <input type="file" class="form-control" id="newimage" placeholder="" name="image"/>
                    </div>
                    <button id="btn_update" type="button" class="btn btn-primary">수정</button>
                </form>
            </div>
        </div>
    </div>

</div>