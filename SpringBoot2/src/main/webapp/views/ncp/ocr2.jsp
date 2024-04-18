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
    <h2>OCR2</h2>
    <h3>카드 글자 인식</h3>

    <form id="item_add_form" action="<c:url value="/ncp/ocrimpl2"/>" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="image">카드 이미지 첨부:</label>
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
    <h3>${result.cardnum}</h3>
    <h3>${result.name}</h3>
</div>

