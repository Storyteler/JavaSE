
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JSONP</title>
</head>
<body>
    <button id="btn">jsonp</button>
    <script src="/static/js/jquery.js"></script>
    <script>
        $(
            $("#btn").click(function () {
                $.getJSON("/jsonp?method=?").done(function(data){
                    alert(data.name + " -> " + data.address);
                }).error(function(){
                    alert("服务器异常");
                });
              $.getJSON("/jsonp?method=?").done(function (data) {
                    alert(data.name + " -> " + data.address);
                });
            })
        );
    </script>
</body>
</html>
