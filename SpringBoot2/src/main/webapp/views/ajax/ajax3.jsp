<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: rabbikim
  Date: 3/27/24
  Time: 9:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    let ajax3 = {
        init:function (){
            setInterval(ajax3.send, 1000);
        },
        send:function () {
            $.ajax({
                url: '<c:url value="/getsearchrank"/>',
                success:function (data){
                    ajax3.display(data);
                }
            });
        },
        display:function (data){
            let result = '';
            $(data).each(function (index, data) {
                result += '<h5>' + data.rank + '위 ' + data.keyword + '</h5>';
            });
            $('#searchRanking').html(result);
        }
    };

    $(function (){
        ajax3.init();
    })
</script>
<div class="container">
    <h2>AJAX3 Page</h2>
    <h3>실시간 검색 순위</h3>
    <div id="searchRanking">
    </div>
</div>
