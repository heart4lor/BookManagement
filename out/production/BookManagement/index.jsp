<%--
  Created by IntelliJ IDEA.
  bm.User: syf
  Date: 2018/7/4
  Time: 上午 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="bm.User"%>

<html>
  <head>
    <title>图书管理系统</title>
  </head>
  <body>
  <%
    User user = (User) session.getAttribute("user");
    if(user == null)
        response.sendRedirect("signin.jsp");
    else
      response.sendRedirect("dashboard.jsp");
  %>
  </body>
</html>
