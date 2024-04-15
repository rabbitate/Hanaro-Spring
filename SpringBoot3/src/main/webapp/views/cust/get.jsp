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
    let custget = {
        url: '',
        init:function (url) {
            this.url = url;
            $('#custget_form > button').click(function () {
                let id =  $('#id').val();
                if (id == '' || id == null) {
                    alert("아이디를 입력하세요");
                    $('#id').focus();
                    return;
                }
                $.ajax({
                    url: '<c:url value="/cust/getImpl"/>',
                    data: {id: id},
                    success: function (data) {
                        custget.display(data);
                    }
                })
            })
        },
        display: function (data) {
            $('#custTable tbody').empty().append(
                '<tr><td><a href="<c:url value="/cust/detail"/>' + '?id=' + data.id + '">' + data.id + '</a></td><td>' + data.pwd + '</td><td>' + data.name + '</td></tr>'
            );
        }

    };

    $(function () {
        custget.init('<c:url value="/cust/getImpl" />');
    });
</script>
<div class="container">
    <h1>Cust Get Page</h1>
    <h3>Get할 Cust ID를 입력하세요</h3>
    <form id="custget_form" action="">
        <div class="form-group">
            <label for="id">ID:</label>
            <input type="text" class="form-control" id="id" placeholder="Enter id" name="id">
        </div>
        <button type="button" class="btn btn-primary">Get</button>
    </form>
    <table class="table table-striped" id="custTable">
        <thead>
        <tr>
            <th>ID</th>
            <th>Password</th>
            <th>Name</th>
        </tr>
        </thead>
        <tbody>
            <tr>
                <td>${custDto.id}</td>
                <td>${custDto.pwd}</td>
                <td>${custDto.name}</td>
            </tr>
        </tbody>
    </table>
</div>
