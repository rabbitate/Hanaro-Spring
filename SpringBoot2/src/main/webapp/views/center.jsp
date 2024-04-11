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

<script>
    let center = {
        init:function (){
            $.ajax({
                url: '<c:url value="/wh"/>',
                success:(result) => {
                    let text = result.response.body.items.item[0].wfSv;
                    $('#wh').text(text);
                }
            })
        }
    }
    $(function (){
        center.init();
    })
</script>
<div class="container">
    <h3>게시판 상위 목록</h3>
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
            <c:forEach var="article" items="${ranks}">
                <tr>
                    <td>${article.boardId}</td>
                    <td><a href="<c:url value="/board/detail"/>?boardId=${article.boardId}">${article.boardTitle}</a></td>
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

    <h5>오늘의 날씨</h5>
    <p id="wh"></p>
</div>