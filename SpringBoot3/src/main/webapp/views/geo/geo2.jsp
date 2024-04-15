<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: rabbikim
  Date: 3/27/24
  Time: 9:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    #geo2 > #kakaomap {
        width: 500px;
        height: 500px;
        border: 2px solid lightcyan;
    }
</style>
<script>
    let geo2 = {
        map:null,
        // initialize
        init:function (){
            this.mapdisplay();
            $('#btnSeoul').click(() => {
                this.go(37.5447611,127.0564625); // 알파코 캠퍼스
                geo2.getgeodata('Seoul');
            });
            $('#btnBusan').click(() => {
                this.go(35.159400,129.041036); // 부산
                geo2.getgeodata('Busan');
            });
            $('#btnJeju').click(() => {
                this.go(33.508489,126.489600); // 제주국제공항
                geo2.getgeodata('Jeju');
            });
        },
        // map 객체 생성
        mapdisplay:function (){
            var mapContainer = document.getElementById('kakaomap'), // 지도를 표시할 div
                mapOption = {
                    center: new kakao.maps.LatLng(37.5447611,127.0564625), // 지도의 중심좌표
                    level: 9 // 지도의 확대 레벨
                };
            geo2.map = new kakao.maps.Map(mapContainer, mapOption);

            var market_position = new kakao.maps.LatLng(37.5447611,127.0564625);
            var marker = new kakao.maps.Marker({
                position: market_position
            });
            marker.setMap(geo2.map);
        },
        // 이동
        go:function (latitude, longitude){
            var moveLatLon = new kakao.maps.LatLng(latitude, longitude);

            // 지도 중심을 이동 시킵니다
            this.map.setCenter(moveLatLon);
        },
        // 이동하는 지역의 데이터를 가지고 온다
        // location - Seoul, Busan, Jeju
        getgeodata:function (location){
            $.ajax({
                url:'<c:url value="/geo/getdata"/>',
                data: {
                    'location': location
                },
                success:function (datas){
                    geo2.display(datas);
                }
            });
        },
        display:function (datas){
            var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/2012/img/marker_p.png';
            $(datas).each(function(index, item){
                // marker 생성
                var imageSize = new kakao.maps.Size(30, 30);
                var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

                var marketPosition = new kakao.maps.LatLng(item.latitude,item.longitude);
                var marker = new kakao.maps.Marker({
                    map: geo2.map,
                    position: marketPosition,
                    title:item.title,
                    image: markerImage
                });
                // info window 생성
                var infoContent = '<p>'+item.title+'</p>';
                infoContent += '<img style="width:50px;"  src="<c:url value="/img/'+item.img+'"/>">';

                var infowindow = new kakao.maps.InfoWindow({
                    content : infoContent,
                    position: marketPosition
                });

                // event 추가
                kakao.maps.event.addListener(marker, 'mouseover',mouseoverHandler(marker,infowindow));
                kakao.maps.event.addListener(marker, 'mouseout',mouseoutHandler(marker,infowindow));

                function mouseoverHandler(marker,infowindow){
                    return function(){
                        infowindow.open(geo2.map, marker);
                    };
                }

                function mouseoutHandler(marker,infowindow){
                    return function(){
                        infowindow.close();
                    };
                }
            });
        }
    };

    $(function (){
        geo2.init();
    })
</script>
<div id="geo2" class="container">
    <h2>지역 맛집 소개 페이지</h2>
    <button id="btnSeoul" type="button" class="btn btn-primary">Seoul</button>
    <button id="btnBusan" type="button" class="btn btn-primary">Busan</button>
    <button id="btnJeju" type="button" class="btn btn-primary">Jeju</button>
    <div id="kakaomap"></div>
</div>
