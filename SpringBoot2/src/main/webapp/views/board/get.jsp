<%--
  Created by IntelliJ IDEA.
  User: rabbikim
  Date: 4/3/24
  Time: 10:54 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<style>
    .comment{
        color:red; !important
    }
</style>

<script>
    $(document).ready(function (){
        $('#boardDelBtn').click(function (){
            let res = confirm("삭제하시겠습니까?");
            if (res) {
                window.location.href = '<c:url value="/board/del"/>' + "?boardId=" + $(this).data('article-id');
            }
        })
    })
</script>

<div class="container">
    <h2>게시판 목록</h2>
    <br/>
    <table class="table table-striped" id="boardTable">
        <thead>
        <tr>
            <th>글 번호</th>
            <th>제목</th>
            <th>내용</th>
            <th>등록일</th>
            <th>수정일</th>
            <th>조회수</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
            <c:forEach var="article" items="${list}">
                <tr>
                    <td>${article.boardId}</td>
                    <td>
                        <a href="<c:url value="/board/detail"/>?boardId=${article.boardId}">${article.boardTitle}</a>
                        <c:if test="${article.commentCnt != 0}">
                            <span class="comment">[${article.commentCnt}]</span>
                        </c:if>
                    </td>
                    <td>${article.boardContent}</td>
                    <td>
                        <fmt:parseDate value="${article.boardRegdate}"
                                       pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
                        <fmt:formatDate pattern="yyyy년 MM월 dd일" value="${ parsedDateTime }" />
                    </td>
                    <td>
                        <fmt:parseDate value="${article.boardUpdate}"
                                       pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
                        <fmt:formatDate pattern="yyyy년 MM월 dd일" value="${ parsedDateTime }" />
                    </td>
                    <td>${article.boardCnt}</td>
                    <td>
                        <c:if test="${sessionScope.id == article.custId}">
                            <button id="boardDelBtn" type="button" class="btn btn-danger deleteBtn" data-article-id="${article.boardId}">삭제</button>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
