<%--
  Created by IntelliJ IDEA.
  User: rabbikim
  Date: 4/9/24
  Time: 1:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- pagination start -->
<div class="col text-center">
    <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">
            <c:choose>
                <c:when test="${cpage.getPrePage() != 0}">
                    <li class="page-item">
                        <a class="page-link" href="${target}/get?pageNo=${cpage.getPrePage()}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item disabled">
                        <span class="page-link" aria-hidden="true">&laquo;</span>
                    </li>
                </c:otherwise>
            </c:choose>

            <c:forEach begin="${cpage.getNavigateFirstPage() }" end="${cpage.getNavigateLastPage() }" var="page">
                <c:choose>
                    <c:when test="${cpage.getPageNum() == page}">
                        <li class="page-item active">
                            <span class="page-link">${page }</span>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" href="${target}/get?pageNo=${page}">${page}</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:choose>
                <c:when test="${cpage.getNextPage() != 0}">
                    <li class="page-item">
                        <a class="page-link" href="${target}/get?pageNo=${cpage.getNextPage()}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item disabled">
                        <span class="page-link" aria-hidden="true">&raquo;</span>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </nav>
</div>
<!-- pagination end -->
