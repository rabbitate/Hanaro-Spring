<%--
  Created by IntelliJ IDEA.
  User: rabbikim
  Date: 3/27/24
  Time: 2:14 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    #all {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid red;
    }

    #me {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid blue;
    }

    #to {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid green;
    }
</style>
<script>
    let chatbot = {
        id:'',
        stompClient:null,
        init:function(){
            this.id = $('#adm_id').text();
            this.connect();

            $('#disconnect').click(()=>{
                this.disconnect();
            });

            $('#sendto').click(()=>{
                var msg = JSON.stringify({
                    'sendid' : this.id,
                    'content1' : $('#totext').val()
                });
                this.stompClient.send('/sendchatbot', {}, msg);
            });
        },
        connect:function(){
            let sid = this.id;
            let socket = new SockJS('${serverurl}/chatbot');
            this.stompClient = Stomp.over(socket);

            this.stompClient.connect({}, function(frame) {
                chatbot.setConnected(true);
                console.log('Connected: ' + frame);

                this.subscribe('/send/me/' + sid, function(msg) {
                    $("#to").prepend(
                        "<h4>" + JSON.parse(msg.body).sendid +":"+
                        JSON.parse(msg.body).content1
                        + "</h4>");
                });
            });
        },
        disconnect:function(){
            if (this.stompClient !== null) {
                this.stompClient.disconnect();
            }
            chatbot.setConnected(false);
            console.log("Disconnected");
        },
        setConnected:function(connected){
            if (connected) {
                $("#status").text("Connected");
            } else {
                $("#status").text("Disconnected");
            }
        }
    };
    $(function(){
        chatbot.init();
    });
</script>
<div class="container">
    <h2>ChatBot Page</h2>
    <div class="col-sm-5">
        <h1 id="adm_id">${sessionScope.id}</h1>
        <H1 id="status">Status</H1>
        <button id="disconnect">Disconnect</button>

        <input type="text" id="totext"><button id="sendto">Send</button>
        <div id="to"></div>
    </div>
</div>