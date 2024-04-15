<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    #dataTable th:first-child {
        width: 10%;
    }
</style>

<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">로그인 현황</h1>
    <br/>

    <h3>현재 로그인한 회원 수: ${cnt}명</h3>
    <br/>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>아이디</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${list}" varStatus="status">
                            <tr>
                                <td>${status.index + 1}</td>
                                <td>${item.loginId}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>

