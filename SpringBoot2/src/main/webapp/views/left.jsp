<%--
  Created by IntelliJ IDEA.
  User: rabbikim
  Date: 3/27/24
  Time: 12:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<script>
  let left = {
    init: function (){
      $('#btn_board_add').click(() => {
        let login_id = '${sessionScope.id}';
        if (login_id == '' || login_id == null) {
          $('#btn_board_add').removeAttr('href');
          alert('로그인 해주세요');
        }
      })
    }
  };

  $(function (){
    left.init();
  });
</script>

<ul class="nav nav-pills flex-column">
  <li class="nav-item">
    <a id="btn_board_add" class="nav-link" href="<c:url value="/board/add"/>">게시판 글 작성</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="<c:url value="/board/get"/>">게시판 조회</a>
  </li>
</ul>