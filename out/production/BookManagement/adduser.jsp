<%@ page import="bm.SqlManager" %>
<%@ page import="bm.MyUtils" %><%--
  Created by IntelliJ IDEA.
  User: syf
  Date: 2018/7/5
  Time: 上午 9:22
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
    String username = request.getParameter("name");
    String passwd = request.getParameter("pass") + username;
    String role = request.getParameter("role");
    passwd = MyUtils.getMD5(passwd);

    SqlManager sqlm = new SqlManager();
    String sql = "insert into users(username, passwd, role) values(?, ?, ?);";
    String[] args = {username, passwd, role};
    sqlm.executeUpdate(sql, args);

    response.sendRedirect("manageuser.jsp");
%>

</body>
</html>
