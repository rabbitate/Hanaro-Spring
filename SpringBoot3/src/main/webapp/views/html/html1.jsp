<%--
  Created by IntelliJ IDEA.
  User: rabbikim
  Date: 3/27/24
  Time: 9:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    p{
        color:red;
    }
</style>
<script>
    // jQuery
    // 문서가 준비되면 함수 실행
    $(document).ready(function(){
        $('#ptag').text('Replace Text');
        $('h5').click(function(){
            alert('Ok');
            $(this).text('Click Event');
        });
    });

    // JavaScript
    // window.onload = function(){
    //     // document.getElementById("ptag").innerHTML = 'Replace Text';
    //     // document.querySelector('h5').addEventListener(onclick(function(){
    //     //     alert('OK');
    //     // }));
    //
    // };
</script>

<div class="container">
    <h2>HTML1 Page</h2>
    <h5>Title description, Sep 2, 2017</h5>
    <div class="fakeimg">Fake Image</div>
    <p id="ptag">Some text..</p>
    <span>Span</span>
    <a href="#">A TAG</a>
</div>