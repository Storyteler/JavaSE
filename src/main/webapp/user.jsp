
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--<link href="//cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.css" rel="stylesheet">--%>
    <title>User</title>
</head>
<body>
<button id="btn">创建表格</button>
<table class="table">
    <thead>
    <tr>
        <th>id</th>
        <th>用户名</th>
        <th>地址</th>
    </tr>
    </thead>
    <tbody></tbody>
</table>
</body>
<script>
    (function () {
           document.querySelector("#btn").onclick = function () {
               sendGet();
           }

           function sendGet() {
               var xmlHttp = creatAjax();
               xmlHttp.open("get","/getXml.xml");
               xmlHttp.onreadystatechange = function () {
                   var state = xmlHttp.readyState;
                   if(state == 4) {
                       var status = xmlHttp.status;
                       if(status == 200) {

                           var xmlDoc = xmlHttp.responseXML;
                           var users = xmlDoc.querySelectorAll("user");
                           var tbody = document.querySelector("tbody");
                           for(var i =0 ;i < users.length;i++) {
                               var user = users[i];
                               //childNodes获得第几个文本子节点
                              var id = user.querySelector("id").childNodes[0].nodeValue;
                               var name = user.querySelector("name").childNodes[0].nodeValue;
                               var address = user.querySelector("address").childNodes[0].nodeValue;

                               var tr = document.createElement("tr");
                               var tdId = document.createElement("td");
                               var tdName = document.createElement("td");
                               var tdAddress = document.createElement("td");

                               var textId = document.createTextNode(id);
                               var textName = document.createTextNode(name);
                               var textAddress = document.createTextNode(address);

                               tdId.appendChild(textId);
                               tdName.appendChild(textName);
                               tdAddress.appendChild(textAddress);

                               tr.appendChild(tdId);
                               tr.appendChild(tdName);
                               tr.appendChild(tdAddress);

                               tbody.appendChild(tr);
                           }

                       } else {
                           alert("服务器异常" + status)
                       }
                   }

               }
               xmlHttp.send();

           }
           function creatAjax() {
               var xmlHttp = null;
               if(window.ActiveXObject) {
                   xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
               } else {
                   xmlHttp = new XMLHttpRequest();
               }
               return xmlHttp;

           }
    })();
</script>
</html>
