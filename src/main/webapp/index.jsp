<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>
<label for="">随便输点什么</label>
<input id="name" type="text">
<button id="bnt">ajax提交</button>
<div id="div"></div>
<script>
    (function () {

        document.querySelector("#bnt").onclick = function() {
            var name = document.querySelector("#name").value;
            sendGet(name);
            //sendPost(name);
        }

        function sendPost(name) {
            var xmlHttp = createAjax();
            xmlHttp.open("post","/ajax");
            xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
            xmlHttp.onreadystatechange = function () {
                if(xmlHttp.readyState == 4) {
                    if(xmlHttp.status == 200) {
                        var result = xmlHttp.responseText;
                        console.log(result);
                        if(result == "不能用") {
                            document.querySelector("#div").innerText = "你的账号已被占用";
                        } else {
                            document.querySelector("#div").innerText = "你的账号可以使用";
                        }
                    }
                }
            }
            xmlHttp.send("name=" + name + "&age=23");
        }

        function sendGet(name) {
            var xmlHttp = createAjax();
            xmlHttp.open("get","/ajax?name=" + name);
            xmlHttp.send();
        }

        function createAjax() {
            if(window.ActiveXObject) {
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            } else {
                xmlHttp = new XMLHttpRequest();
            }
            return xmlHttp;
        }
    })();
</script>
</body>
</html>
