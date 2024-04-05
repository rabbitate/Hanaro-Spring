<%--
  Created by IntelliJ IDEA.
  User: rabbikim
  Date: 4/4/24
  Time: 3:36 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let cust_detail = {
        init:function (){
            $('#detail_form > #btn_update').click(() => {
                let res = confirm("수정하시겠습니까?");
                if (res) {
                    let pwd = $('#pwd').val();
                    let name = $('#name').val();

                    if (pwd == '' || pwd == null) {
                        alert("수정할 비밀번호를 입력하세요");
                        $('#pwd').focus();
                        return;
                    }

                    if (name == '' || name == null) {
                        alert("수정할 이름을 입력하세요");
                        $('#name').focus();
                        return;
                    }
                    this.send();
                }
            })
        },
        send:function (){
            $('#detail_form').attr({
                'method': 'post',
                'action': '<c:url value="/cust/update" />'
            });
            $('#detail_form').submit();
        }
    };

    $(function (){
        cust_detail.init();
    })
</script>

<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">회원 정보 수정</h1>
    <br/>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">
                <form id="detail_form">
                    <div class="form-group">
                        <label for="id">ID:</label>
                        <input type="text" readonly="readonly" value="${cust.id}" class="form-control" id="id" placeholder="Enter id" name="id">

                    </div>
                    <div class="form-group">
                        <label for="pwd">Password:</label>
                        <input type="password"  value="${cust.pwd}"  class="form-control" id="pwd" placeholder="Enter password" name="pwd">

                    </div>
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" value="${cust.name}"  class="form-control" id="name" placeholder="Enter name" name="name">

                    </div>
                    <button id="btn_update" type="button" class="btn btn-primary">수정</button>
                </form>
            </div>
        </div>
    </div>

</div>