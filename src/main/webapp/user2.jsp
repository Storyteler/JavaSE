
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User</title>
</head>
<body>
    <button id="btn">create a list</button>
    <table>
        <thead>
            <tr>
                <th>id</th>
                <th>name</th>
                <th>address</th>
            </tr>
        </thead>
        <tbody id="tb">
        </tbody>
    </table>
    <div id="div"></div>
    <script>
        (function () {
            document.querySelector("#btn").onclick = function () {
                sendGet();

            }

            function sendGet() {
                var xmlHttp = createAjax();
                xmlHttp.open("get","/getXml.xml");
                xmlHttp.onreadystatechange = function () {
                    if(xmlHttp.readyState == 4) {
                        var statu = xmlHttp.status;
                        if(statu == 200) {
                            var xmlDoc = xmlHttp.responseXML;
                            var users = xmlDoc.getElementsByTagName("user");
                            var tbody = document.querySelector("tbody");
                            for(var i = 0;i < users.length;i++) {
                                var user = users[i];
                                var id = user.getElementsByTagName("id")[0].childNodes[0].nodeValue;
                                var name = user.getElementsByTagName("name")[0].childNodes[0].nodeValue;
                                var address = user.getElementsByTagName("address")[0].childNodes[0].nodeValue;

                                var tr = document.createElement("tr");
                                var tdId = document.createElement("td");
                                var tdName = document.createElement("td");
                                var tdAddress = document.createElement("td");

                                var codeId = document.createTextNode(id);
                                var codeName = document.createTextNode(name);
                                var codeAddress = document.createTextNode(address);

                                tdId.appendChild(codeId);
                                tdName.appendChild(codeName);
                                tdAddress.appendChild(codeAddress);
                                tr.appendChild(tdId);
                                tr.appendChild(tdName);
                                tr.appendChild(tdAddress);
                                tbody.appendChild(tr);

                            }

                        } else {
                            var div = document.querySelector("#div");
                            div.innerText = statu;

                        }
                    }

                }
                xmlHttp.send();

            }

            function createAjax() {
                var xmlHttp = null;
                if(window.ActiveXObject) {
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP")
                } else {
                    xmlHttp = new XMLHttpRequest();
                }
                return xmlHttp;

            }

        })();
    </script>
</body>
</html>
