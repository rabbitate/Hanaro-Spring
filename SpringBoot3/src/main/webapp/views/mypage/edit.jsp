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
                this.url = url;
                $('#addredit_form > button').click(function (){
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
                $('#addredit_form').attr({
                    'method': 'post',
                    'action': this.url
                })
                $('#addredit_form').submit();
            }
        };

        $(function (){
            addradd.init('<c:url value="/mypage/editImpl" />');
        })
    </script>
    <div class="container">
        <h3>주소 정보 수정</h3>
        <form id="addredit_form" action="">
            <div class="form-group">
                <label for="name">주소 이름:</label>
                <input type="text" class="form-control" id="name" value="${address.addrName}" placeholder="주소 이름을 입력하세요..." name="addrName">
            </div>
            <div class="form-group">
                <label for="detail">주소 상세:</label>
                <input type="text" class="form-control" id="detail" value="${address.addrDetail}" placeholder="주소 상세를 입력하세요..." name="addrDetail">
            </div>
            <div class="form-group">
                <input type="hidden" class="form-control" value="${address.addrId}" name="addrId">
            </div>
            <div class="form-group">
                <input type="hidden" class="form-control" value="${address.custId}" name="custId">
            </div>
            <button type="button" class="btn btn-primary">수정</button>
        </form>
    </div>