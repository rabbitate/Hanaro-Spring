<%--
  Created by IntelliJ IDEA.
  User: rabbikim
  Date: 3/27/24
  Time: 12:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<div class="container">
    <h3>날씨 정보</h3>
    <h5>현재 날씨: ${weather.weather[0].description}</h5>
    <h5>온도: ${weather.main.temp}도</h5>
    <h5>체감온도: ${weather.main.feels_like}도</h5>
</div>