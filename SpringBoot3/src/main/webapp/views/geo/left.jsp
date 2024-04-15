<%--
  Created by IntelliJ IDEA.
  User: rabbikim
  Date: 3/27/24
  Time: 9:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<ul class="nav nav-pills flex-column">
    <p>GEO</p>
    <li class="nav-item">
        <a class="nav-link" href="<c:url value="/geo/geo1"/>">GEO1</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="<c:url value="/geo/geo2"/>">GEO2</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="<c:url value="/geo/geo3"/>">GEO3</a>
    </li>
</ul>