
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Module</title>
</head>
<body>
<button id="btn">ADD</button>
<div id="result"></div>
<script src="//cdn.bootcss.com/jquery/3.1.0/jquery.min.js"></script>
<script src="//cdn.bootcss.com/handlebars.js/4.0.5/handlebars.min.js"></script>
<script type="text/html" id="template">
    <div id="num-{{id}}">
        <h2>{{title}}</h2>
        <p>{{essay}}</p>
    </div>
</script>
<script>
    $(function () {
        $("#btn").click(function () {
            var html = $("#template").html();
            html = html.replace("{{id}}",Math.random);
            html = html.replace("{{title}}","标题" + new Date().getTime());
            html = html.replace("{{essay}}","且积分的哈我家附近的几十年的就是计算机" + new Date().getTime())
            $("#result").append(html);

        });
        }
    );
</script>
</body>
</html>
