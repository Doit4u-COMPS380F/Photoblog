<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
    <title>Photoblog - Login</title>
    <%@include file="header.jsp" %>
</head>
<body>
<%@include file="nav.jsp" %>
<div class="container mt-5">
    <h1>Login</h1>
    <form action="login" method="post">
        <div class="mb-3">
            <label for="username" class="form-label">Username</label>
            <input type="text" class="form-control" id="username" placeholder="username"
                   aria-describedby="usernameHelp">
            <%--            <div id="usernameHelp" class="form-text">user name is what you use to login</div>--%>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" placeholder="p@ssw0rd">
        </div>
        <button type="submit" class="btn btn-primary">Login</button>
    </form>
</div>
</body>
</html>