<%--
  Created by IntelliJ IDEA.
  User: rabbikim
  Date: 4/3/24
  Time: 10:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
    <h2>Cust DB Page</h2>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Password</th>
            <th>Name</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${cpage.getList()}">
            <tr>
                <td><a href="<c:url value="/cust/detail"/>?id=${c.id}">${c.id}</a></td>
                <td>${c.pwd}</td>
                <td>${c.name}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <jsp:include page="page.jsp"/>
</div>
