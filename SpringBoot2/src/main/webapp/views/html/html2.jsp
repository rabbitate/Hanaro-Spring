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

    // 문서가 준비되었다면 객체 init
    $(function () {
        html2.init();
    });

    $(document).ready(function(){
        $('#btn').click(function(){
            alert('OK');
        });
    });
</script>
<div class="container">
    <h2>HTML2 Page</h2>
    <button id="btn" type="button" class="btn btn-success">Success</button>
    <table class="table table-striped" id="cust_tb">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>John</td>
            <td>Doe</td>
            <td>john@example.com</td>
        </tr>
        <tr>
            <td>Mary</td>
            <td>Moe</td>
            <td>mary@example.com</td>
        </tr>
        <tr>
            <td>July</td>
            <td>Dooley</td>
            <td>july@example.com</td>
        </tr>
        </tbody>
    </table>
<%--    <div class="row">--%>
<%--        <div class="container col-sm-4" >--%>

<%--        </div>--%>
<%--        <div class="container col-sm-8" id="result">--%>

<%--        </div>--%>
<%--    </div>--%>
</div>