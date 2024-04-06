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
    let item_add = {
        init:function (){
            $('#item_add_form > #btn_add').click(() => {
                let res = confirm("입력하시겠습니까?");
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
            $('#item_add_form').attr({
                'method': 'post',
                'enctype': 'multipart/form-data',
                'action': '<c:url value="/item/addimpl" />'
            });
            $('#item_add_form').submit();
        }
    };

    $(function (){
        item_add.init();
    })
</script>

<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">아이템 정보 추가</h1>
    <br/>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">
                <form id="item_add_form">
                    <div class="form-group">
                        <label for="name">이름:</label>
                        <input type="text" value="${item.itemName}"  class="form-control" id="name" placeholder="Enter name" name="itemName">
                    </div>
                    <div class="form-group">
                        <label for="price">가격:</label>
                        <input type="text" value="${item.itemPrice}"  class="form-control" id="price" placeholder="Enter name" name="itemPrice">
                    </div>
                    <div class="form-group">
                        <label for="image">이미지 첨부:</label>
                        <input type="file" class="form-control" id="image" placeholder="Enter name" name="image"/>
                    </div>
                    <button id="btn_add" type="button" class="btn btn-primary">추가</button>
                </form>
            </div>
        </div>
    </div>

</div>