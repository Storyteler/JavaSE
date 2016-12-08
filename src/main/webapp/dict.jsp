
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>dirc</title>
</head>
<body>
<label>请输入你要查找的单词</label>
<input id="query" type="text"></input>
<button id="btn">Query</button>
<p id="result"></p>
<script>
    (function () {
        document.querySelector("#btn").onclick = function () {
            sendGet();
        }
        function sendGet() {
            var query = document.querySelector("#query").value;
            var httpxml = new XMLHttpRequest();
            httpxml.open("get","/dict?query="+query);
            httpxml.onreadystatechange = function () {
                if(httpxml.readyState == 4) {
                    if(httpxml.status) {
                        var middle = httpxml.responseText;
                        var json = JSON.parse(middle);
                        var explains = json.basic.explains;
                        document.querySelector("#result").innerText = explains;
                    } else {
                        alert("服务器异常" + httpxml.status);
                    }
                }
            }
            httpxml.send();
        }
    })();
</script>
</body>
</html>
