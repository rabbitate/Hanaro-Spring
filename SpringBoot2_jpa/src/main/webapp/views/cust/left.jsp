<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: rabbikim
  Date: 3/27/24
  Time: 12:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<ul class="nav nav-pills flex-column">
  <p>메뉴</p>
  <li class="nav-item">
    <a class="nav-link" href="<c:url value="/cust/add"/>">Cust 추가</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="<c:url value="/cust/get"/>">Cust 조회</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="<c:url value="/cust/getall"/>">전체 조회</a>
  </li>
</ul>
