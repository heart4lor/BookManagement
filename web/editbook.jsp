<%@ page import="bm.User" %>
<%@ page import="bm.SqlManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%--
  Created by IntelliJ IDEA.
  User: syf
  Date: 2018/7/4
  Time: 下午 5:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>图书管理系统</title>

    <script src="js/util.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link href="css/dashboard.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

</head>
<body>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        out.print("<script language=\"JavaScript\">notLoginError();</script>");
    }
    SqlManager sqlm = new SqlManager();
%>

<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
    <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="index.jsp">图书管理系统</a>
    <input class="form-control form-control-dark w-100" type="text" placeholder="搜索" aria-label="Search">
    <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
            <a class="nav-link" href="signout.jsp">登出</a>
        </li>
    </ul>
</nav>

<div class="container-fluid">
    <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
            <div class="sidebar-sticky">
                <ul class="nav flex-column">
                    <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                        <span>菜单</span>
                    </h6>
                    <li class="nav-item">
                        <a class="nav-link" href="dashboard.jsp">
                            <span data-feather="home"></span>
                            统计概览
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="managebook.jsp">
                            <span data-feather="file"></span>
                            书籍管理
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="managepublisher.jsp">
                            <span data-feather="shopping-cart"></span>
                            出版社管理
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="manageuser.jsp">
                            <span data-feather="users"></span>
                            用户管理
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="managedb.jsp">
                            <span data-feather="layers"></span>
                            数据表管理
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
            <br><br>
            <div style="padding-right: 20%">
                <h2 class="h2">
                    修改书籍信息
                </h2>
            <%
                String id = request.getParameter("id");
                String sql = "select * from books where id=" + id;
                sqlm = new SqlManager();
                ResultSet rs = sqlm.executeQuery(sql);

                try {
                    rs.next();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                String number = rs.getString("number");
                String name = rs.getString("name");
                String author = rs.getString("author");
                String publisher = rs.getString("publisher");
                float price = rs.getFloat("price");
                int category = Integer.parseInt(rs.getString("category"));
                String profile = rs.getString("profile");
                profile = profile.replace("\n", "");
                profile = profile.replace("\r", "");
            %>
            <br>
                <form action="editbookproc.jsp" method="get">
                    <input hidden name="id" value="<%=id%>">
                    <div class="form-group">
                        <label for="number">书号:</label>
                        <input type="text" class="form-control" id="number" name="number" value="<%=number%>">
                    </div>
                    <div class="form-group">
                        <label for="name">书名:</label>
                        <input type="text" class="form-control" id="name" name="name" value="<%=name%>">
                    </div>
                    <div class="form-group">
                        <label for="author">作者:</label>
                        <input type="text" class="form-control" id="author" name="author" value="<%=author%>">
                    </div>
                    <div class="form-group">
                        <label for="publisher">出版社:</label>
                        <select class="form-control" id="publisher" name="publisher">
                            <%
                                ResultSet rs1 = sqlm.executeQuery("select * from publishers");
                                while (rs1.next()) {
                                    int pid = rs1.getInt("Id");
                                    String pname = rs1.getString("name");
                            %>
                            <option value="<%=pid%>"
                                    <%
                                        if (pid == Integer.parseInt(publisher))
                                            out.print(" selected");
                                    %>
                            ><%=pname%>
                            </option>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="price">价格:</label>
                        <input type="text" class="form-control" id="price" name="price" value="<%=price%>">
                    </div>
                    <div class="radio">
                        <label for="category">类别:</label><br>
                        <%
                            ResultSet rs2 = sqlm.executeQuery("select * from categories");
                            while (rs2.next()) {
                                int cid = rs2.getInt("Id");
                                String cname = rs2.getString("name");
                        %>
                        <label><input type="radio" name="category" id="category"
                                      value="<%=cid%>"<%
                                System.out.println(category);
                                if(cid == category)
                                    out.print(" checked");
                            %>><%=cname%>
                        </label>
                        <% } %>
                        <br>
                    </div>
                    <div class="form-group">
                        <label for="profile">简介:</label>
                        <textarea name="profile" id="profile" class="form-control" rows="8"><%=profile%></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">提交</button>
                </form>
            </div>
        </main>
    </div>
</div>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>

<!-- Icons -->
<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
<script>
    feather.replace()
</script>
</body>
</html>
