
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link href="//cdn.bootcss.com/bootstrap/4.0.0-alpha.5/css/bootstrap-flex.css" rel="stylesheet">
    <link href="//cdn.bootcss.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-4">
            <form id="loginForm">
                <div class="form-group">
                    <label>邮箱</label>
                    <input id="email" name="email" type="text" class="form-control">
                </div>
                <div class="form-group">
                    <label>密码</label>
                    <input id="password" name="password" type="password" class="form-control">
                </div>
                <div class="form-group">
                    <button type="button" class="btn btn-info">登录</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="//cdn.bootcss.com/jquery/3.1.0/jquery.min.js"></script>
<script src="//cdn.bootcss.com/jquery-validate/1.15.0/jquery.validate.min.js"></script>
<script>
    $(function () {

        $(".btn").click(function () {
            $("#loginForm").submit();
        });

        $("#loginForm").validate({
            errorElement : "span",
            errorClass : "text-danger",
            rules : {
                email : {
                    required : true,
                    email : true,
                    remote : "/checkEmail"
                },
                password : {
                    required : true
                }
            },
            messages : {
                email : {
                    required : "请输入邮箱",
                    email : "请输入正确的邮箱",
                    remote : "你输入的邮箱已存在"
                },
                password : {
                    required : "请输入密码"
                }
            },
            submitHandler : function () {
                $.ajax({
                    type : "post",
                    url : "/login",
                    data : $("#loginForm").serialize(),
                    beforeSend : function () {
                        $("#btn").append("<i class='fa fa-gear fa-spin'></i>")
                    },
                    complete : function () {
                        $("#btn").text(登录);
                    },
                    success : function (result) {
                        if(result.state == "success") {
                            window.location.href = "/index.jsp";
                        } else {
                            alert(result);
                        }
                    },
                    error : function () {
                        alert("服务器异常");
                    }
                });
            }
        });

    });
</script>
</body>
</html>
