<%--
  Created by IntelliJ IDEA.
  User: rabbikim
  Date: 3/26/24
  Time: 4:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <title>Bootstrap 4 Website Example</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="<c:url value="/js/0327.js"/>"></script>

        <!-- Kakao Map API -->
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=220e7684231ba8e4ff5395788f23fd5f"></script>

        <!-- HighChart API -->
        <script src="https://code.highcharts.com/stock/highstock.js"></script>

        <script src="https://code.highcharts.com/modules/series-label.js"></script>
        <script src="https://code.highcharts.com/modules/exporting.js"></script>
        <script src="https://code.highcharts.com/modules/export-data.js"></script>
        <script src="https://code.highcharts.com/modules/accessibility.js"></script>

        <script src="https://code.highcharts.com/modules/variable-pie.js"></script>

        <script src="https://code.highcharts.com/modules/datagrouping.js"></script>
        <script src="https://code.highcharts.com/modules/windbarb.js"></script>
        <script src="https://code.highcharts.com/modules/pattern-fill.js"></script>
        <script src="https://code.highcharts.com/modules/data.js"></script>

        <link href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

        <style>
            .fakeimg {
                height: 200px;
                background: #aaa;
            }
        </style>
    </head>
    <body>

    <div class="jumbotron text-center" style="margin-bottom:0">
        <h1>HTML5 & JavaScript</h1>
    </div>

    <ul class="nav justify-content-end">

        <c:choose>
            <c:when test="${id == null}">
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/login"/>">LOGIN</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/register"/>">REGISTER</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">ABOUT US</a>
                </li>
            </c:when>
            <%-- 로그인 상태 --%>
            <c:otherwise>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/mypage/"/>?id=${id}">${id}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/logout"/>">LOG OUT</a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>

    <%--Start Nav Bar--%>
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <a class="navbar-brand" href="<c:url value='/'/>">Home</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/html/"/>">HTML</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/jquery/"/>">jQuery</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/ajax/"/>">Ajax</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/geo/"/>">Geo</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/chart/"/>">Chart</a>
                </li>
                <!-- 로그인을 해야 화면에 나타남 -->
                <c:if test="${id != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/cust/"/>">Cust</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"  href="<c:url value="/item/"/>">Item</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </nav>
    <%--End Nav Bar--%>

    <%--Start Center Area--%>
    <div class="container-fluid" style="margin-top:30px">
        <div class="row">
            <div class="col-sm-2">
                <c:choose>
                    <c:when test="${left == null}">
                        <jsp:include page="left.jsp"/>
                    </c:when>
                    <c:otherwise>
                        <jsp:include page="${left}.jsp"/>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="col-sm-10">
                <c:choose>
                    <c:when test="${center == null}">
                        <jsp:include page="center.jsp"/>
                    </c:when>
                    <c:otherwise>
                        <jsp:include page="${center}.jsp"/>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
    <%--End Center Area--%>

    <%--Start Bottom Area--%>
    <div class="text-center bg-dark" style="margin-bottom:0">
        <p>Footer</p>
    </div>
    <%--End Bottom Area--%>

    </body>
</html>