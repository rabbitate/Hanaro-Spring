// Login
let login = {
    url:'',
    init:function (url) {
        this.url = url;
        $('#login_form > button').click(function (){
            let id = $('#id').val(); // form에서 가져올땐 val(), html 태그 사이의 텍스트를 가져오려면 text()
            let pwd = $('#pwd').val();
            if (id == '' || id == null) {
                alert('ID를 입력하세요');
                $('#id').focus();
                return;
            }
            if (pwd == '' || pwd == null) {
                alert('Password를 입력하세요');
                $('#pwd').focus();
                return;
            }
            login.send();
        });
    },
    send:function () {
        $('#login_form').attr({
            'method':'post',
            'action':this.url
        });
        $('#login_form').submit();
    }
};

// register
let register = {
    url: '',
    init:function (url) {
        this.url = url;
        $('#register_form > button').click(function () {
            let name =  $('#name').val();
            let id =  $('#id').val();
            let pwd =  $('#pwd').val();
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
    },
    send:function () {
        $('#register_form').attr({
            'method': 'post',
            'action': this.url
        })
        $('#register_form').submit();
    }
};

// html2
let datas = [
    {"id":"id01", "name":"james01"},
    {"id":"id02", "name":"james02"},
    {"id":"id03", "name":"james03"},
    {"id":"id04", "name":"james04"},
    {"id":"id05", "name":"james05"}
];

let html2 = {
    init:function () {
        $('#btn').click(function () {
            html2.display(datas);
        });
    },
    display:function (datas) {
        let result = '';
        $(datas).each(function (index, data) {
            result += '<tr>';
            result += '<td>' + data.id + '</td>';
            result += '<td>' + data.name + '</td>';
            result += '</tr>';
        });
        // text()는 text형식, html()은 html형식으로
        $('#cust_tb > tbody').html(result);
    }
};