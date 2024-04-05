<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-03-28
  Time: 오전 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    $(document).ready(function (){
        $('.deleteBtn').click(function (){
            let res = window.confirm("정말 삭제하시겠습니까?");
            if (res) {
                let id = $(this).data('id');
                console.log(id);
                window.location.href = '<c:url value="/cust/del"/>?id=' + id;
            }
        })
    })
</script>

<div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">회원 목록</h1>
    <br/>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>아이디</th>
                        <th>비밀번호</th>
                        <th>이름</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>아이디</th>
                        <th>비밀번호</th>
                        <th>이름</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <c:forEach var="c" items="${custs}">
                        <tr>
                            <td><a href="<c:url value="/cust/detail"/>?id=${c.id}">${c.id}</a></td>
                            <td>${c.pwd}</td>
                            <td class="d-flex justify-content-between">
                                    ${c.name}
                                <button type="button" class="btn btn-danger btn-sm deleteBtn" data-id="${c.id}">
                                    <i class="fas fa-trash"></i> 삭제
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
