<%@ page import="bm.User" %>
<%@ page import="bm.SqlManager" %>
<%@ page import="java.sql.ResultSet" %>
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

    int role = user.getRole();
    if(role != 3 && role != 2)
        out.print("<script language=\"JavaScript\">noAccess();</script>");
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
                    <%--<li class="nav-item">--%>
                        <%--<a class="nav-link" href="managepublisher.jsp">--%>
                            <%--<span data-feather="shopping-cart"></span>--%>
                            <%--出版社管理--%>
                        <%--</a>--%>
                    <%--</li>--%>
                    <%--<li class="nav-item">--%>
                        <%--<a class="nav-link" href="manageuser.jsp">--%>
                            <%--<span data-feather="users"></span>--%>
                            <%--用户管理--%>
                        <%--</a>--%>
                    <%--</li>--%>
                    <%--<li class="nav-item">--%>
                        <%--<a class="nav-link" href="managedb.jsp">--%>
                            <%--<span data-feather="layers"></span>--%>
                            <%--数据表管理--%>
                        <%--</a>--%>
                    <%--</li>--%>
                </ul>
            </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
            <br><br>
            <div>
                <h2 class="h2">
                    图书列表
                    <%--<button class="btn btn-lg btn-outline-secondary" data-toggle="modal" data-target="#addmodal"--%>
                            <%--style="float: right;">添加图书--%>
                    <%--</button>--%>
                </h2>
            </div>
            <div class="modal fade" id="addmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="form">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">借阅书籍</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="addbook.jsp" method="post">
                                <button type="submit" class="btn btn-primary">是的</button>
                            </form>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>
            <br>
            <div class="table-responsive">
                <table class="table table-striped table-sm" id="list">
                    <thead>
                    <tr>
                        <th>书号</th>
                        <th>书名</th>
                        <th>作者</th>
                        <th>出版社</th>
                        <th>价格</th>
                        <th>状态</th>
                        <th>简介</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <%
                            String query = "select books.Id as id, number, books.name as name, author, publishers.name as publisher, price, categories.name as category, profile " +
                                    "from publishers right join books on publishers.Id=books.publisher " +
                                    "left join categories on categories.Id=books.category " +
                                    "order by books.Id DESC;";
//                            query = String.format(query, p * LIMIT, LIMIT);
                            ResultSet rs3 = sqlm.executeQuery(query);
                            try {
                                while (rs3.next()) {
                                    int id = rs3.getInt("id");
                                    String number = rs3.getString("number");
                                    String name = rs3.getString("name");
                                    String author = rs3.getString("author");
                                    String publisher = rs3.getString("publisher");
                                    float price = rs3.getFloat("price");
                                    String category = rs3.getString("category");
                                    String profile = rs3.getString("profile");
                                    if(profile != null){
                                        profile = profile.replace("\n", "");
                                        profile = profile.replace("\r", "");
                                    }
                        %>
                        <td><%=number%>
                        </td>
                        <td><%=name%>
                        </td>
                        <td><%=author%>
                        </td>
                        <td><%=publisher%>
                        </td>
                        <td><%=price%>
                        </td>
                        <td><%=category%>
                        </td>
                        <td>
                            <p hidden><%= profile %>
                            </p>
                            <button class="btn btn-outline-secondary btn-sm" data-toggle="modal"
                                    data-target="#profilemodal" onclick="getProfile(this);" name="btn">
                                查看
                            </button>
                        </td>
                        <div class="modal fade" id="profilemodal" tabindex="-1" role="dialog"
                             aria-labelledby="myModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">内容简介</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body" id="profile-display">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    </div>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal -->
                        </div>
                        <td>
                            <p hidden><%=id%></p>
                            <div class="btn-group mr-2">
                                <button class="btn btn-sm btn-outline-secondary" onclick="borrowBook(<%=id%>);"><%=category.equals("在馆") ? "借阅" : "预约"%>
                                </button>
                            </div>
                        </td>
                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                            out.print("<script language=\"JavaScript\">searchError();</script>");
                        }
                    %>
                    </tbody>
                </table>
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
