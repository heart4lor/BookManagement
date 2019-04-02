function notLoginError() {
    alert("你还没有登陆");
    window.location="/index.jsp"
}

function signinError() {
    alert("登陆失败\n用户名或密码错误");
    window.location="/index.jsp"
}

function searchError() {
    alert("没有找到任何内容哦");
}

function addFail() {
    alert("添加书籍失败!");
    window.location="/managebook.jsp"
}

function addSuccess() {
    alert("添加书籍成功!");
    window.location="/managebook.jsp"
}

function getProfile(button) {
    var profile = button.parentElement.children[0].textContent;
    document.getElementById("profile-display").innerHTML=profile;
}

function borrowBook(id) {
    alert("确定要借阅吗?");
    window.location="/deletebook.jsp?id=" + id;
}

function deletePublisher(id) {
    window.location="/deletepublisher.jsp?id=" + id;
}

function deleteUser(id) {
    window.location="/deleteuser.jsp?name=" + id;
}

function editBook(id) {
    window.location="/editbook.jsp?id=" + id;
}

function noAccess() {
    alert("您没有权限访问本页");
    window.location="/dashboard.jsp";
}

function setDefault(button) {
    var id = button.parentElement.parentElement.children[0].textContent;
}