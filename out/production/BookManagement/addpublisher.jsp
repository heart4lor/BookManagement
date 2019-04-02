<%@ page import="bm.SqlManager" %><%--
  Created by IntelliJ IDEA.
  User: syf
  Date: 2018/7/5
  Time: 上午 8:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("name");

    SqlManager sqlm = new SqlManager();
    String sql = "insert into publishers(name) values(?);";
    String[] args = {name};
    sqlm.executeUpdate(sql, args);

    response.sendRedirect("managepublisher.jsp");
%>

</body>
</html>
