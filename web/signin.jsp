<%--
  Created by IntelliJ IDEA.
  bm.User: syf
  Date: 2018/7/4
  Time: 上午 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>图书管理系统-用户登录</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">
</head>

<body class="text-center">
<form class="form-signin" action="signinproc.jsp" method="post">
    <h1 class="h4 mb-3 font-weight-normal">图书管理系统</h1><br>
    <img class="mb-4" src="https://getbootstrap.com/docs/4.1/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
    <h1 class="h3 mb-3 font-weight-normal">请登录</h1>
    <label for="userName" class="sr-only">用户名</label>
    <input type="text" name= "username" id="userName" class="form-control" placeholder="请输入用户名" required autofocus><br>
    <label for="password" class="sr-only">密码</label>
    <input type="password" name="password" id="password" class="form-control" placeholder="请输入密码" required><br><br>
    <button class="btn btn-lg btn-primary btn-block" type="submit">登陆</button>
    <p class="mt-5 mb-3 text-muted">&copy; syf-2018</p>
</form>
</body>
</html>