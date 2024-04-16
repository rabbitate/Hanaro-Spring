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
    let chat2 = {
        id:'',
        stompClient:null,
        init:function(){
            this.id = $('#adm_id').text();
            $('#connect').click(()=>{
                this.connect();
            });
            $('#disconnect').click(()=>{
                this.disconnect();
            });
            $('#sendto').click(()=>{
                var msg = JSON.stringify({
                    'sendid': this.id,
                    'receiveid': $('#target').val(),
                    'content1': $('#totext').val()
                });
                this.stompClient.send('/sendchat', {}, msg);
            });
        },
        connect:function(){
            let sid = this.id;
            let socket = new SockJS('${serverUrl}/chat');
            this.stompClient = Stomp.over(socket);

            this.stompClient.connect({}, function(frame) {
                chat2.setConnected(true);
                console.log('Connected: ' + frame);
                this.subscribe('/send3/to/'+ sid, function(msg) {
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
            chat2.setConnected(false);
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
        chat2.init();
    });
</script>

<div class="container-fluid">
    <h2>채팅 페이지</h2>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">
                <div class="col-sm-5">
                    <h1 id="adm_id">${sessionScope.id}</h1>
                    <H1 id="status">Status</H1>
                    <button id="connect">Connect</button>
                    <button id="disconnect">Disconnect</button>

                    <h3>To</h3>
                    <input type="text" id="target" value="sadmin">
                    <input type="text" id="totext"><button id="sendto">Send</button>
                    <div id="to"></div>
                </div>
            </div>
        </div>
    </div>
</div>