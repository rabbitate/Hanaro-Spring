<%--
  Created by IntelliJ IDEA.
  User: rabbikim
  Date: 3/27/24
  Time: 12:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<script>

</script>

<ul class="nav nav-pills flex-column">
  <li class="nav-item">
    <a id="btn_board_add" class="nav-link" href="<c:url value="/ncp/"/>">글 요약</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="<c:url value="/ncp/ocr"/>">OCR</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="<c:url value="/ncp/ocr2"/>">OCR2</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="<c:url value="/ncp/chatbot"/>">Chat Bot</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="<c:url value="/ncp/kogpt"/>">KoGPT</a>
  </li>
</ul>