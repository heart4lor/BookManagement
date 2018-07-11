<%@ page import="bm.SqlManager" %><%--
  Created by IntelliJ IDEA.
  User: syf
  Date: 2018/7/4
  Time: 下午 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除书籍</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");

    SqlManager sqlm = new SqlManager();
    String sql = "delete from books where id=?";
    String[] args = {id};
    sqlm.executeUpdate(sql, args);

    response.sendRedirect("managebook.jsp");
%>
</body>
</html>
