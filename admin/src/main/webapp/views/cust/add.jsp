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
    let add = {
        url: '',
        init:function (url){
            this.url = url;
            $('#register_form > button').click(function (){
                let id = $('#id').val();
                let pwd = $('#pwd').val();
                let name = $('#name').val();

                if (id == null || id == '') {
                    alert("아이디를 입력하세요");
                    $('#id').focus();
                    return;
                }
                if (pwd == null || pwd == '') {
                    alert("비밀번호를 입력하세요");
                    $('#pwd').focus();
                    return;
                }
                if (name == null || name == '') {
                    alert("이름을 입력하세요");
                    $('#name').focus();
                    return;
                }

                let res = confirm("등록하시겠습니까?");
                if (res) {
                    add.send();
                }
            })
        },
        send:function (){
            $('#register_form').attr({
                'method': 'post',
                'action': '<c:url value="/item/addimpl" />'
            })
            $('#register_form').submit();
        }
    };

    $(function (){
        add.init('<c:url value="/cust/addimpl" />');
    })
</script>
<div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">회원 정보 등록</h1>
    <br/>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">
                <form id="register_form">
                    <div class="form-group">
                        <label for="id">아이디:</label>
                        <input type="text" class="form-control" id="id" placeholder="Enter id" name="id">
                    </div>
                    <div class="form-group">
                        <label for="pwd">비밀번호:</label>
                        <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
                    </div>
                    <div class="form-group">
                        <label for="name">이름:</label>
                        <input type="text" class="form-control" id="name" placeholder="Enter name" name="name">
                    </div>
                    <button type="button" class="btn btn-primary">등록</button>
                </form>
            </div>
        </div>
    </div>

</div>