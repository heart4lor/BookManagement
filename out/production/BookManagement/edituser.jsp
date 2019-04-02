<%@ page import="bm.SqlManager" %><%--
  Created by IntelliJ IDEA.
  User: syf
  Date: 2018/7/5
  Time: 上午 9:44
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

    String role = request.getParameter("erole");
    String id = request.getParameter("id");

    SqlManager sqlm = new SqlManager();
    String sql = "update users set role=? where id=?";
    String[] args = {role, id};
    sqlm.executeUpdate(sql, args);

    response.sendRedirect("manageuser.jsp");
%>
</body>
</html>
