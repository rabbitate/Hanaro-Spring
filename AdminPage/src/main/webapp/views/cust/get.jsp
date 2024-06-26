<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: rabbikim
  Date: 3/28/24
  Time: 11:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Tables</h1>
    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
        For more information about DataTables, please visit the <a target="_blank"
                                                                   href="https://datatables.net">official DataTables documentation</a>.</p>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Password</th>
                        <th>Name</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>ID</th>
                        <th>Password</th>
                        <th>Name</th>
                    </tr>
                    </tfoot>
                    <tbody>
                        <c:forEach var="c" items="${custData}">
                            <tr>
                                <td>${c.id}</td>
                                <td>${c.pwd}</td>
                                <td>${c.name}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>