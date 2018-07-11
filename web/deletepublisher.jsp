<%@ page import="bm.SqlManager" %><%--
  Created by IntelliJ IDEA.
  User: syf
  Date: 2018/7/5
  Time: 上午 8:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除出版社</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");

    SqlManager sqlm = new SqlManager();
    String sql = "delete from publishers where id=?";
    String[] args = {id};
    sqlm.executeUpdate(sql, args);

    response.sendRedirect("managepublisher.jsp");
%>

</body>
</html>
