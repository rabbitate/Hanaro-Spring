<%--
  Created by IntelliJ IDEA.
  User: rabbikim
  Date: 4/3/24
  Time: 10:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<script>
    let custadd = {
        url: '',
        init:function (url) {
            this.url = url;
            $('#custadd_form > button').click(function () {
                let name =  $('#name').val();
                let id =  $('#id').val();
                let pwd =  $('#pwd').val();
                if (name == '' || name == null) {
                    alert("이름을 입력하세요");
                    $('#name').focus();
                    return;
                }
                if (id == '' || id == null) {
                    alert("아이디를 입력하세요");
                    $('#id').focus();
                    return;
                }
                if (pwd == '' || pwd == null) {
                    alert("비밀번호를 입력하세요");
                    $('#pwd').focus();
                    return;
                }
                custadd.send();
            })
        },
        send:function () {
            $('#custadd_form').attr({
                'method': 'post',
                'action': this.url
            })
            $('#custadd_form').submit();
        }
    };

    $(function () {
        custadd.init('<c:url value="/cust/addImpl" />');
    });
</script>
<div class="container">
    <h1>Cust Add Page</h1>
    <h3>추가할 Cust를 입력하세요</h3>
    <form id="custadd_form" action="">
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" class="form-control" id="name" placeholder="Enter name" name="name">
        </div>
        <div class="form-group">
            <label for="id">ID:</label>
            <input type="text" class="form-control" id="id" placeholder="Enter id" name="id">
        </div>
        <div class="form-group">
            <label for="pwd">Password:</label>
            <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
        </div>
        <button type="button" class="btn btn-primary">Add</button>
    </form>
</div>
