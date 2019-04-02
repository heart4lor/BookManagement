<%@ page import="bm.SqlManager" %><%--
  Created by IntelliJ IDEA.
  User: syf
  Date: 2018/7/4
  Time: 下午 9:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加书籍</title>
</head>
<body>

<%
    request.setCharacterEncoding("UTF-8");
    String number = request.getParameter("number");
    String name = request.getParameter("name");
    System.out.print(name);
    String author = request.getParameter("author");
    int publisher = Integer.parseInt(request.getParameter("publisher"));
    Float price = Float.valueOf(request.getParameter("price"));
    int category = Integer.parseInt(request.getParameter("category"));
    String profile = request.getParameter("profile");

    SqlManager sqlm = new SqlManager();
    String sql = "insert into books(number, name, author, publisher, price, category, profile) values(?, ?, ?, ?, ?, ?, ?);";
    String[] args = {number, name, author, String.valueOf(publisher), String.valueOf(price), String.valueOf(category), profile};
    sqlm.executeUpdate(sql, args);

    response.sendRedirect("managebook.jsp");
%>

</body>
</html>
