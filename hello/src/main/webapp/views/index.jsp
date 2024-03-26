<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
    </head>
    <body>
        <h1>Hello</h1>
        <h2>${data}</h2>
        <c:forEach var="s" items="${datas}">
            <h3>${s}</h3>
        </c:forEach>
    </body>
</html>
