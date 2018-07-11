<%@ page import="java.sql.*" %>
<%@ page import="bm.SqlManager" %>
<%@ page import="bm.Util" %>
<%@ page import="bm.User" %>
<%--
  Created by IntelliJ IDEA.
  bm.User: syf
  Date: 2018/7/4
  Time: 上午 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆中</title>
    <script src="js/util.js"></script>
</head>
<body>

<%
    session.removeAttribute("user");
    String username = request.getParameter("username");
    String password = request.getParameter("password") + username;
    SqlManager sqlManager = new SqlManager();
    String[] args = {username};
    ResultSet rs = sqlManager.executeQuery("select passwd, role from users where username=?;", args);
    try {
        rs.next();
        String passwd = rs.getString("passwd");
        int role = rs.getInt("role");
        password = Util.getMD5(password);
        out.println(password);
        if(!passwd.equals(password)) {
            throw new Exception("用户名或密码不匹配");
        }
        else {
            session.setAttribute("user", new User(username, role));
            response.sendRedirect("dashboard.jsp");
        }
    } catch (Exception e) {
//        e.printStackTrace();
        out.print("<script language=\"JavaScript\">signinError();</script>");

    }
%>

</body>
</html>
