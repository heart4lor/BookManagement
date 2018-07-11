<%@ page import="bm.SqlManager" %><%--
  Created by IntelliJ IDEA.
  User: syf
  Date: 2018/7/5
  Time: 上午 9:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑书籍信息</title>
</head>
<body>

    <%
    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("id");
    String name = request.getParameter("name");

    SqlManager sqlm = new SqlManager();
    String sql = "update publishers set name=? where id=?";
    String[] args = {name, id};
    sqlm.executeUpdate(sql, args);

    response.sendRedirect("managepublisher.jsp");
%>
</html>
