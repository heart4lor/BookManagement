<%@ page import="bm.SqlManager" %><%--
  Created by IntelliJ IDEA.
  User: syf
  Date: 2018/7/5
  Time: 上午 8:17
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
    String number = request.getParameter("number");
    String name = request.getParameter("name");
    String author = request.getParameter("author");
    String publisher = request.getParameter("publisher");
    String price = request.getParameter("price");
    String category = request.getParameter("category");
    String profile = request.getParameter("profile");

    profile = profile.replace("\n", "");
    profile = profile.replace("\r", "");

    SqlManager sqlm = new SqlManager();
    String sql = "update books set number=?, name=?, author=?, publisher=?, price=?, category=?, profile=? where id=?";
    String[] args = {number, name, author, publisher, price, category, profile, id};
    sqlm.executeUpdate(sql, args);

    response.sendRedirect("managebook.jsp");
%>

</body>
</html>
