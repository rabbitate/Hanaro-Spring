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
    $(function () {
        login.init('<c:url value="/loginimpl"/>');
    });
</script>

<div class="container">
    <h2>로그인</h2>
    <form id="login_form" action="">
        <div class="form-group">
            <label for="id">아이디:</label>
            <input type="text" class="form-control" id="id" placeholder="Enter id" name="id">
        </div>
        <div class="form-group">
            <label for="pwd">비밀번호:</label>
            <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
        </div>
        <div class="form-group">
            <p>${msg}</p>
        </div>
        <button type="button" class="btn btn-primary">로그인</button>
    </form>
</div>

