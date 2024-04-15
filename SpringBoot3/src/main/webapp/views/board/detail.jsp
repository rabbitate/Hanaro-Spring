<%--
  Created by IntelliJ IDEA.
  User: rabbikim
  Date: 4/8/24
  Time: 1:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<script>
    let detail = {
        init: function () {
        }
    };
    $(function () {
        detail.init();
    });
</script>

<script>
    let boardDetail = {
        url: '',
        init:function (url) {
            this.url = url;
            $('#boarddetail_form > button').click(function () {
                let boardTitle =  $('#boardTitle').val();
                let boardContent =  $('#boardContent').val();
                if (boardTitle == '' || boardTitle == null) {
                    alert("제목을 입력하세요");
                    $('#boardTitle').focus();
                    return;
                }
                if (boardContent == '' || boardContent == null) {
                    alert("내용을 입력하세요");
                    $('#boardContent').focus();
                    return;
                }
                boardDetail.send();
            })
        },
        send:function () {
            $('#boarddetail_form').attr({
                'method': 'post',
                'action': this.url
            })
            $('#boarddetail_form').submit();
        }
    };

    $(function () {
        boardDetail.init('<c:url value="/board/detailImpl"/>');
    });
</script>

<div class="container">
    <h3>게시판 글 조회</h3>
    <br/>
    <p>
        등록일:
        <fmt:parseDate value="${board.boardRegdate}"
                       pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
        <fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분" value="${ parsedDateTime }" />
        <br/>
        수정일:
        <fmt:parseDate value="${board.boardUpdate}"
                       pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
        <fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분" value="${ parsedDateTime }" />
    </p>
    <form id="boarddetail_form" action="">
        <div class="form-group">
            <label for="boardTitle">제목:</label>
            <input type="text" class="form-control" id="boardTitle" placeholder="제목을 입력하세요" value="${board.boardTitle}" name="boardTitle">
        </div>
        <div class="form-group">
            <label for="boardContent">내용:</label>
            <textarea class="form-control" id="boardContent" rows="10" placeholder="내용을 입력하세요" name="boardContent">${board.boardContent}</textarea>
        </div>
        <input type="hidden" name="boardId" value="${board.boardId}">
        <input type="hidden" name="custId" value="${sessionScope.id}">
        <c:if test="${sessionScope.id == board.custId}">
            <button type="button" class="btn btn-primary">작성</button>
        </c:if>
    </form>

    <br/>

    <%-- Comment List --%>
    <h4>댓글</h4>
    <table class="table table-striped" id="boardTable">
        <thead>
        <tr>
            <th>아이디</th>
            <th>내용</th>
            <th>등록일</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="comment" items="${board.commentList}">
            <tr>
                <td>${comment.custId}</td>
                <td>${comment.commentContent}</td>
                <td>
                    <fmt:parseDate value="${comment.commentRegdate}"
                                   pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
                    <fmt:formatDate pattern="yyyy년 MM월 dd일" value="${ parsedDateTime }" />
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>