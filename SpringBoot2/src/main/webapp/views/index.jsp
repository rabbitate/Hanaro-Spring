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

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

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

        <!-- Web Socket -->
        <script src="<c:url value="/webjars/sockjs-client/sockjs.min.js"/>"></script>
        <script src="<c:url value="/webjars/stomp-websocket/stomp.min.js"/>"></script>

        <style>
            .fakeimg {
                height: 200px;
                background: #aaa;
            }
            #scroll-btn {
                opacity: 0;
                width: 50px;
                height: 50px;
                color: #fff;
                background-color: #ef476f;
                position: fixed;
                bottom: 13%;
                right: 3%;
                border: 2px solid #fff;
                border-radius: 50%;
                font: 2px monospace;
                transition: opacity 2s, transform 2s;
            }
            #scroll-btn.show {
                opacity: 1;
                transition: opacity 5s, transform 5s;
            }
            #scroll-btn2 {
                opacity: 0;
                width: 50px;
                height: 50px;
                color: #fff;
                background-color: #ef476f;
                position: fixed;
                bottom: 5%;
                right: 3%;
                border: 2px solid #fff;
                border-radius: 50%;
                font: bold 10px monospace;
                transition: opacity 2s, transform 2s;
            }
            #scroll-btn2.show {
                opacity: 1;
                transition: opacity 5s, transform 5s;
            }

            .fakeimg {
                height: 200px;
                background: #aaa;
            }
        </style>

        <%-- NCP Chat Script --%>

        <script>
            let chatbtn = {
                init:function(){
                    // const scrollBtn = document.createElement("button");
                    // scrollBtn.innerHTML = "chatbot";
                    // scrollBtn.setAttribute("id", "scroll-btn");
                    // document.body.appendChild(scrollBtn);
                    // scrollBtn.classList.add("show");
                    // scrollBtn.addEventListener("click", function(){
                    //     location.href='/login';
                    // });
                    const scrollBtn2 = document.createElement("button");
                    scrollBtn2.innerHTML = "🤖";
                    scrollBtn2.setAttribute("id", "scroll-btn2");
                    document.body.appendChild(scrollBtn2);
                    scrollBtn2.classList.add("show");
                    scrollBtn2.addEventListener("click", function(){
                        location.href='<c:url value="/chat2"/>';
                    });
                }
            };
            $(function(){
                chatbtn.init();
            });
        </script>

        <%-- Web Socket script--%>
        <script>
            let websocket = {
                id:'',
                stompClient:null,
                init:function(){
                    this.id = $('#adm_id').text();
                    this.connect();
                },
                connect:function(){
                    let sid = this.id;
                    let socket = new SockJS('http://172.16.21.235:81/notiws');
                    this.stompClient = Stomp.over(socket);

                    this.stompClient.connect({}, function(frame) {
                        console.log('Connected: ' + frame);
                        this.subscribe('/send', function(msg) {

                            $('#msg_box').append(
                                '<div class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-autohide="false">' +
                                '<div class="toast-header">' +
                                '<strong class="mr-auto pr-5 h4">'+(JSON.parse(msg.body).sendid)+'</strong>' +
                                '<small class="text-muted h6">just now</small>' +
                                '<button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">' +
                                '<span aria-hidden="true">&times;</span>' +
                                '</button>' +
                                '</div>' +
                                '<div class="toast-body h6' +
                                '">'+(JSON.parse(msg.body).content1)+'</div>' +
                                '</div>'
                            )
                            $('.close').on('click', function(){
                                $(this).parent().parent().remove();
                            });
                            $('.toast').toast('show');
                        });

                    });
                }
            };
            $(function(){
                websocket.init();
            });
        </script>
    </head>
    <body>

    <div class="jumbotron text-center" style="margin-bottom:0">
        <h1>HTML5 & JavaScript</h1>
        <h5><spring:message code="site.title"  arguments="aa,aa"  /></h5>
        <h5><spring:message code="site.phone"/></h5>
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
                    <a class="nav-link" href="<c:url value="/logoutimpl"/>">LOG OUT</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/chat/"/>">CHAT</a>
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
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/weather/"/>">Weather</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/pic"/>">Pic</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/ncp"/>">Naver Cloud Platform</a>
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

    <div id="msg_box" style="position: fixed; bottom: 30px; right: 30px; z-index: 9999;">
    </div>

    <%--Start Bottom Area--%>
    <div class="text-center bg-dark" style="margin-bottom:0">
        <p>Footer</p>
    </div>



    <%--End Bottom Area--%>

    </body>
</html>