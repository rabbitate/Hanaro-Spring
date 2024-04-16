<%--
  Created by IntelliJ IDEA.
  User: rabbikim
  Date: 4/16/24
  Time: 10:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<script>
    let summary = {
        init: function (){
            $('#summary_form button').click(() => {
               this.send();
            });
        },
        send: function (){
            let content = $('#summaryContent').val();
            $.ajax({
                url: '<c:url value="/summary"/>',
                data: {'content': content},
                success: (result) => {
                    $('#result').html(result.summary);
                }
            });
        }
    };

    $(function () {
        summary.init();
    });
</script>

<div class="container">
    <h3>Naver Cloud Platform 글 요약</h3>
    <form id="summary_form" action="">
        <div class="form-group">
            <label for="summaryContent">내용:</label>
            <textarea type="text" rows="10" class="form-control" id="summaryContent" placeholder="내용을 입력하세요" name="summaryContent"></textarea>
        </div>
        <button type="button" class="btn btn-primary">요약</button>
    </form>
    <br/>
    <h4>요약된 내용</h4>
    <div id="result"></div>
</div>
