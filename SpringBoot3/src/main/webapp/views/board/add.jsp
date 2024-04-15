<%--
  Created by IntelliJ IDEA.
  User: rabbikim
  Date: 4/3/24
  Time: 10:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let boardadd = {
        url: '',
        init:function (url) {
            this.url = url;
            $('#boardadd_form > button').click(function () {
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
                boardadd.send();
            })
        },
        send:function () {
            $('#boardadd_form').attr({
                'method': 'post',
                'action': this.url
            })
            $('#boardadd_form').submit();
        }
    };

    $(function () {
        boardadd.init('<c:url value="/board/addImpl"/>');
    });
</script>

<div class="container">
    <h3>게시판 글 작성</h3>
    <form id="boardadd_form" action="">
        <div class="form-group">
            <label for="boardTitle">제목:</label>
            <input type="text" class="form-control" id="boardTitle" placeholder="제목을 입력하세요" name="boardTitle">
        </div>
        <div class="form-group">
            <label for="boardContent">내용:</label>
            <textarea type="text" rows="10" class="form-control" id="boardContent" placeholder="내용을 입력하세요" name="boardContent"></textarea>
        </div>
        <input type="hidden" name="custId" value="${sessionScope.id}">
        <button type="button" class="btn btn-primary">작성</button>
    </form>
</div>
