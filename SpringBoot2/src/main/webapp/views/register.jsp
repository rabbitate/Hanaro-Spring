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
    // register
    let register = {
        url: '',
        init: function (url) {
            this.url = url;
            $('#register_form > button').click(function (){
                let name = $('#name').val();
                let id = $('#id').val();
                let pwd = $('#pwd').val();
                if (name == '' || name == null) {
                    alert("이름을 입력하세요");
                    $('#name').focus();
                    return;
                }
                if (id == '' || id == null) {
                    alert("아이디를 입력하세요");
                    $('#id').focus();
                    return;
                }
                if (pwd == '' || pwd == null) {
                    alert("비밀번호를 입력하세요");
                    $('#pwd').focus();
                    return;
                }
                register.send();
            })

            $('#register_form #btn_check').click(() => {
                let id = $('#id').val();
                if (id == '' || id == null) {
                    alert("아이디를 입력하세요");
                    $('#id').focus();
                    return;
                }
                $.ajax({
                    url:'<c:url value="/registercheckid"/>',
                    data:{'id':id},
                    success:(result)=>{
                        if (result == '0') {
                            let msg = '중복되는 아이디입니다';
                            $('#check_msg').html(msg);
                        } else {
                            let msg = '사용 가능한 아이디입니다';
                            $('#check_msg').html(msg);
                        }
                    }
                })
            })
        },
        send:function (){
            $('#register_form').attr({
                'method': 'post',
                'action': this.url
            })
            $('#register_form').submit();
        }
    };

    $(function () {
        register.init('<c:url value="/registerimpl" />');
    });
</script>
<div class="container">
    <h2>회원가입</h2>
    <form id="register_form">
        <div class="form-group">
            <label for="name">이름:</label>
            <input type="text" class="form-control" id="name" placeholder="Enter name" name="name">
        </div>
        <div class="form-group">
            <label for="id">아이디:</label>
            <input type="text" class="form-control" id="id" placeholder="Enter id" name="id">
            <button id="btn_check" type="button" class="btn btn-primary">중복 검사</button>
            <span id="check_msg"></span>
        </div>
        <div class="form-group">
            <label for="pwd">비밀번호:</label>
            <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
        </div>
        <button type="button" class="btn btn-primary">회원가입</button>
    </form>
</div>