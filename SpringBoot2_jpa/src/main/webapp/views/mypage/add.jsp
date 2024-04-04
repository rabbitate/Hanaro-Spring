<%--
  Created by IntelliJ IDEA.
  User: rabbikim
  Date: 3/27/24
  Time: 9:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let addradd = {
        url: '',
        init:function (url) {
            $('#addradd_form > button').click(function (){
                let name = $('#name').val();
                let detail = $('#detail').val();
                if (name == '' || name == null) {
                    alert("주소 이름을 입력하세요");
                    $('#name').focus();
                    return;
                }
                if (detail == '' || detail == null) {
                    alert("주소 상세 정보를 입력하세요");
                    $('#detail').focus();
                    return;
                }
                addradd.send();
            })
        },
        send:function (){
            $('addradd_form').attr({
                'method': 'post',
                'url': this.url
            })
            $('addradd_form').submit();
        }
    };

    $(function (){
        addradd.init('<c:url value="/mypage/addImpl" />');
    })
</script>
<div class="container">
    <h3>주소 정보 추가</h3>
    <form id="addradd_form" action="">
        <div class="form-group">
            <label for="name">주소 이름:</label>
            <input type="text" class="form-control" id="name" placeholder="주소 이름을 입력하세요..." name="name">
        </div>
        <div class="form-group">
            <label for="detail">주소 상세:</label>
            <input type="text" class="form-control" id="detail" placeholder="주소 상세를 입력하세요..." name="detail">
        </div>
        <button type="button" class="btn btn-primary">추가</button>
    </form>
</div>