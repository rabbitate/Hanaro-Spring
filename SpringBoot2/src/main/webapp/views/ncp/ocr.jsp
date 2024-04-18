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

</script>

<div class="container">
    <h2>OCR</h2>
    <h3>사업자등록증 글자 인식</h3>

    <form id="item_add_form" action="<c:url value="/ncp/ocrimpl"/>" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="image">사업자등록증 이미지 첨부:</label>
            <input type="file" class="form-control" id="image" placeholder="Enter name" name="image"/>
        </div>
        <button id="btn_add" type="submit" class="btn btn-primary">등록</button>
    </form>
    <br/>

    <c:if test="${imgname != null}">
        <img width="200px" src="/imgs/<c:url value="${imgname}"/>"/>
    </c:if>
    <br/>
    <br/>
    <h3>${result.bizname}</h3>
    <h3>${result.bizowner}</h3>
    <h3>${result.bizdate}</h3>
    <h3>${result.bizadd}</h3>
</div>

